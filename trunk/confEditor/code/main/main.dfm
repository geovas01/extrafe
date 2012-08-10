object Conf: TConf
  Left = 115
  Top = 40
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = '"confEditor"'
  ClientHeight = 660
  ClientWidth = 891
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter
    Left = 160
    Top = 0
    Height = 660
    Visible = False
  end
  object PTools: TsPanel
    Left = 248
    Top = 206
    Width = 720
    Height = 372
    TabOrder = 0
    Visible = False
    SkinData.SkinSection = 'PANEL'
    object sLabel9: TsLabel
      Left = 16
      Top = 40
      Width = 100
      Height = 13
      Caption = 'Convert Histrory.dat'
    end
    object sLabel10: TsLabel
      Left = 16
      Top = 105
      Width = 108
      Height = 13
      Caption = 'Convert Mameinfo.dat'
    end
    object sGauge1: TsGauge
      Left = 344
      Top = 82
      Width = 144
      Height = 13
      Visible = False
      SkinData.SkinSection = 'GAUGE'
      ForeColor = clBlack
      Suffix = '%'
    end
    object sGauge2: TsGauge
      Left = 344
      Top = 146
      Width = 144
      Height = 13
      Visible = False
      SkinData.SkinSection = 'GAUGE'
      ForeColor = clBlack
      Suffix = '%'
    end
    object img1: TImage
      Left = 488
      Top = 56
      Width = 24
      Height = 24
      Center = True
      Picture.Data = {
        055449636F6E0000010002001010000001001800680300002600000010100000
        01002000680400008E0300002800000010000000200000000100180000000000
        40FFFFFF00000000000000000000000000000000000000000000000000000000
        00B93D00B93D0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B93D16E72304C63100B93D00000000000000
        000000000000000000000000000000000000000000000000000000B93D0AC939
        16E72316E72304C63100B93D0000000000000000000000000000000000000000
        0000000000000000000000B93D27EF3E1EEB301EEB3016E72300B93D00000000
        000000000000000000000000000000000000000000000000B93D0DCA4130F34C
        16D73E00B93D1EEB300CD32E00B93D0000000000000000000000000000000000
        0000000000000000B93D38F75A30F34C00B93D00B93D27EF3E1EEB3000B93D00
        000000000000000000000000000000000000000000B93D1AD44E41FC681FDC4D
        00B93D00000000B93D27EF3E11D53600B93D0000000000000000000000000000
        0000000000B93D48FF7348FF7300B93D00000000000000B93D13D14327EF3E00
        B93D00000000000000000000000000000000000000000000B93D28E05B00B93D
        00000000000000000000B93D30F34C16D73E00B93D0000000000000000000000
        0000000000000000000000000000000000000000000000000000B93D1FDC4D30
        F34C00B93D000000000000000000000000000000000000000000000000000000
        00000000000000000000000000B93D38F75A1BDA4500B93D0000000000000000
        0000000000000000000000000000000000000000000000000000000000B93D24
        DF5538F75A00B93D000000000000000000000000000000000000000000000000
        00000000000000000000000000000000B93D41FC6824DF5500B93D0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        B93D28E05B41FC6800B93D000000000000000000000000000000000000000000
        00000000000000000000000000000000000000B93D48FF7328E05B00B93D0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000B93D00B93D000000000000000000F3FF0000E1FF0000C0FF0000
        C0FF0000807F0000807F0000043F00000C3F00008E1F0000FE1F0000FF0F0000
        FF0F0000FF870000FF870000FFC30000FFE70000280000001000000020000000
        0100200000000000400000000000000000000000000000000000000000000000
        00000000000000000000000F00B93DBF00B93DBF000000190000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000F00B93DBF16E723FF04C631FF00B93DCB0000001900000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000B93DBF0AC939FF16E723FF16E723FF04C631FF00B93D9800000019
        0000000000000000000000000000000000000000000000000000000000000000
        0000001100B93DC927EF3EFF1EEB30FF1EEB30FF16E723FF00B93DC100000025
        0000000000000000000000000000000000000000000000000000000000000008
        00B93DC40DCA41EE30F34CFF16D73EFF00B93DFF1EEB30FF0CD32EFF00B93D92
        000000190000000000000000000000000000000000000000000000000000001F
        00B93DE538F75AFF30F34CFF00B93DEA00B93DAF27EF3EFF1EEB30FF00B93DCE
        0000002500000000000000000000000000000000000000000000000000B93DBF
        1AD44EFF41FC68FF1FDC4DFF00B93D9D0000001900B93DD927EF3EFF11D536FF
        00B93D9200000019000000000000000000000000000000000000000000B93DBF
        48FF73FF48FF73FF00B93DBF000000170000000000B93DB313D143FF27EF3EFF
        00B93DCE00000025000000000000000000000000000000000000000000000008
        00B93DBF28E05BFF00B93D8A00000009000000000000001100B93DDB30F34CFF
        16D73EFF00B93D92000000190000000000000000000000000000000000000000
        0000000900B93D550000000000000000000000000000000000B93DB31FDC4DFF
        30F34CFF00B93DCE000000250000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000001100B93DDB
        38F75AFF1BDA45FF00B93D920000001900000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000B93DA5
        24DF55FF38F75AFF00B93DCE0000002500000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000013
        00B93DD541FC68FF24DF55FF00B93D9200000019000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00B93DA528E05BFF41FC68FF00B93DCE00000025000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000B93DBF48FF73FF28E05BFF00B93D7F000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000B93DD800B93DDB000000000000000000000000E1FF0000
        C0FF0000C07F0000807F0000003F0000003F0000001F0000041F0000040F0000
        9E0F0000FE070000FF070000FF030000FF830000FFC30000FFE70000}
      Visible = False
    end
    object img2: TImage
      Left = 488
      Top = 120
      Width = 24
      Height = 24
      Center = True
      Picture.Data = {
        055449636F6E0000010002001010000001001800680300002600000010100000
        01002000680400008E0300002800000010000000200000000100180000000000
        40FFFFFF00000000000000000000000000000000000000000000000000000000
        00B93D00B93D0000000000000000000000000000000000000000000000000000
        0000000000000000000000000000B93D16E72304C63100B93D00000000000000
        000000000000000000000000000000000000000000000000000000B93D0AC939
        16E72316E72304C63100B93D0000000000000000000000000000000000000000
        0000000000000000000000B93D27EF3E1EEB301EEB3016E72300B93D00000000
        000000000000000000000000000000000000000000000000B93D0DCA4130F34C
        16D73E00B93D1EEB300CD32E00B93D0000000000000000000000000000000000
        0000000000000000B93D38F75A30F34C00B93D00B93D27EF3E1EEB3000B93D00
        000000000000000000000000000000000000000000B93D1AD44E41FC681FDC4D
        00B93D00000000B93D27EF3E11D53600B93D0000000000000000000000000000
        0000000000B93D48FF7348FF7300B93D00000000000000B93D13D14327EF3E00
        B93D00000000000000000000000000000000000000000000B93D28E05B00B93D
        00000000000000000000B93D30F34C16D73E00B93D0000000000000000000000
        0000000000000000000000000000000000000000000000000000B93D1FDC4D30
        F34C00B93D000000000000000000000000000000000000000000000000000000
        00000000000000000000000000B93D38F75A1BDA4500B93D0000000000000000
        0000000000000000000000000000000000000000000000000000000000B93D24
        DF5538F75A00B93D000000000000000000000000000000000000000000000000
        00000000000000000000000000000000B93D41FC6824DF5500B93D0000000000
        0000000000000000000000000000000000000000000000000000000000000000
        B93D28E05B41FC6800B93D000000000000000000000000000000000000000000
        00000000000000000000000000000000000000B93D48FF7328E05B00B93D0000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000B93D00B93D000000000000000000F3FF0000E1FF0000C0FF0000
        C0FF0000807F0000807F0000043F00000C3F00008E1F0000FE1F0000FF0F0000
        FF0F0000FF870000FF870000FFC30000FFE70000280000001000000020000000
        0100200000000000400000000000000000000000000000000000000000000000
        00000000000000000000000F00B93DBF00B93DBF000000190000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000F00B93DBF16E723FF04C631FF00B93DCB0000001900000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000B93DBF0AC939FF16E723FF16E723FF04C631FF00B93D9800000019
        0000000000000000000000000000000000000000000000000000000000000000
        0000001100B93DC927EF3EFF1EEB30FF1EEB30FF16E723FF00B93DC100000025
        0000000000000000000000000000000000000000000000000000000000000008
        00B93DC40DCA41EE30F34CFF16D73EFF00B93DFF1EEB30FF0CD32EFF00B93D92
        000000190000000000000000000000000000000000000000000000000000001F
        00B93DE538F75AFF30F34CFF00B93DEA00B93DAF27EF3EFF1EEB30FF00B93DCE
        0000002500000000000000000000000000000000000000000000000000B93DBF
        1AD44EFF41FC68FF1FDC4DFF00B93D9D0000001900B93DD927EF3EFF11D536FF
        00B93D9200000019000000000000000000000000000000000000000000B93DBF
        48FF73FF48FF73FF00B93DBF000000170000000000B93DB313D143FF27EF3EFF
        00B93DCE00000025000000000000000000000000000000000000000000000008
        00B93DBF28E05BFF00B93D8A00000009000000000000001100B93DDB30F34CFF
        16D73EFF00B93D92000000190000000000000000000000000000000000000000
        0000000900B93D550000000000000000000000000000000000B93DB31FDC4DFF
        30F34CFF00B93DCE000000250000000000000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000001100B93DDB
        38F75AFF1BDA45FF00B93D920000001900000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000B93DA5
        24DF55FF38F75AFF00B93DCE0000002500000000000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000013
        00B93DD541FC68FF24DF55FF00B93D9200000019000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        00B93DA528E05BFF41FC68FF00B93DCE00000025000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        0000000000B93DBF48FF73FF28E05BFF00B93D7F000000000000000000000000
        0000000000000000000000000000000000000000000000000000000000000000
        000000000000000000B93DD800B93DDB000000000000000000000000E1FF0000
        C0FF0000C07F0000807F0000003F0000003F0000001F0000041F0000040F0000
        9E0F0000FE070000FF070000FF030000FF830000FFC30000FFE70000}
      Visible = False
    end
    object sEdit56: TsEdit
      Left = 16
      Top = 56
      Width = 320
      Height = 21
      TabOrder = 0
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sEdit57: TsEdit
      Left = 16
      Top = 120
      Width = 320
      Height = 21
      TabOrder = 3
      SkinData.SkinSection = 'EDIT'
      BoundLabel.Indent = 0
      BoundLabel.Font.Charset = DEFAULT_CHARSET
      BoundLabel.Font.Color = clWindowText
      BoundLabel.Font.Height = -11
      BoundLabel.Font.Name = 'MS Sans Serif'
      BoundLabel.Font.Style = []
      BoundLabel.Layout = sclLeft
      BoundLabel.MaxWidth = 0
      BoundLabel.UseSkinColor = True
    end
    object sBitBtn3: TsBitBtn
      Left = 368
      Top = 120
      Width = 120
      Height = 24
      Caption = 'Create and Export'
      Enabled = False
      TabOrder = 5
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 2
      Images = InBitBtn_Imagelist
    end
    object sBitBtn4: TsBitBtn
      Left = 344
      Top = 56
      Width = 24
      Height = 24
      TabOrder = 1
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 12
      Images = InBitBtn_Imagelist
    end
    object sBitBtn5: TsBitBtn
      Left = 344
      Top = 120
      Width = 24
      Height = 24
      TabOrder = 4
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 12
      Images = InBitBtn_Imagelist
    end
    object sBitBtn2: TsBitBtn
      Left = 368
      Top = 56
      Width = 120
      Height = 24
      Caption = 'Create and Export'
      Enabled = False
      TabOrder = 2
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 2
      Images = InBitBtn_Imagelist
    end
  end
  object Main_Panel: TsPanel
    Left = 163
    Top = 0
    Width = 728
    Height = 660
    Align = alClient
    TabOrder = 2
    SkinData.SkinSection = 'PANEL'
    object Pem_hatari_roms: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 17
      SkinData.SkinSection = 'PANEL'
      object grp43: TGroupBox
        Left = 20
        Top = 10
        Width = 500
        Height = 110
        Caption = 'Tos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sLabel58: TsLabel
          Left = 220
          Top = 17
          Width = 60
          Height = 13
          Caption = 'Tos Image'
        end
        object sLabel59: TsLabel
          Left = 5
          Top = 37
          Width = 3
          Height = 13
          Alignment = taCenter
        end
        object sLabel70: TsLabel
          Left = 5
          Top = 67
          Width = 93
          Height = 13
          Caption = 'Cartridge Image'
        end
        object sLabel71: TsLabel
          Left = 5
          Top = 88
          Width = 3
          Height = 13
        end
        object sBitBtn65: TsBitBtn
          Left = 105
          Top = 64
          Width = 25
          Height = 21
          Hint = 'SetHatari_GemDosDrive'
          TabOrder = 0
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn66: TsBitBtn
          Left = 135
          Top = 64
          Width = 25
          Height = 21
          Hint = 'Eject_cartridge'
          TabOrder = 1
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
      end
      object grp44: TGroupBox
        Left = 20
        Top = 120
        Width = 500
        Height = 129
        Caption = 'Disks'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sLabel64: TsLabel
          Left = 5
          Top = 34
          Width = 183
          Height = 13
          Caption = 'Default Floppy Images Directory'
        end
        object sLabel65: TsLabel
          Left = 5
          Top = 54
          Width = 3
          Height = 13
        end
        object sBitBtn60: TsBitBtn
          Left = 195
          Top = 31
          Width = 25
          Height = 21
          Hint = 'Set_diskimagesdir'
          TabOrder = 0
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sComboBox44: TsComboBox
          Left = 420
          Top = 10
          Width = 70
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Write Protection'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 1
          Text = 'Off'
          Items.Strings = (
            'Off'
            'On'
            'Auto')
        end
        object sCheckBox90: TsCheckBox
          Left = 324
          Top = 80
          Width = 122
          Height = 20
          Caption = 'Auto Insert Disk B'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox61: TsCheckBox
          Left = 324
          Top = 104
          Width = 126
          Height = 20
          Caption = 'Fast Floppy Access'
          TabOrder = 3
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp49: TGroupBox
        Left = 20
        Top = 252
        Width = 500
        Height = 210
        Caption = 'Hard Disks'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object sLabel66: TsLabel
          Left = 5
          Top = 25
          Width = 86
          Height = 13
          Caption = 'ACSI HD Image'
        end
        object sLabel67: TsLabel
          Left = 5
          Top = 166
          Width = 83
          Height = 13
          Caption = 'Gem Dos Drive'
        end
        object sLabel68: TsLabel
          Left = 5
          Top = 47
          Width = 3
          Height = 13
        end
        object sLabel69: TsLabel
          Left = 5
          Top = 184
          Width = 3
          Height = 13
        end
        object sLabel72: TsLabel
          Left = 5
          Top = 73
          Width = 119
          Height = 13
          Caption = 'IDE HD Master image'
        end
        object sLabel73: TsLabel
          Left = 5
          Top = 95
          Width = 3
          Height = 13
        end
        object sLabel74: TsLabel
          Left = 5
          Top = 121
          Width = 112
          Height = 13
          Caption = 'IDE HD Slave Image'
        end
        object sLabel75: TsLabel
          Left = 5
          Top = 143
          Width = 3
          Height = 13
        end
        object sCheckBox95: TsCheckBox
          Left = 360
          Top = 10
          Width = 135
          Height = 20
          Caption = 'Boot From Hard Disk'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sBitBtn61: TsBitBtn
          Left = 105
          Top = 22
          Width = 25
          Height = 21
          Hint = 'Set_hdimage'
          TabOrder = 1
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn62: TsBitBtn
          Left = 135
          Top = 22
          Width = 25
          Height = 21
          Hint = 'Eject_hdimage'
          TabOrder = 2
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
        object sBitBtn63: TsBitBtn
          Left = 92
          Top = 163
          Width = 25
          Height = 21
          Hint = 'Set_gemdos'
          TabOrder = 3
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn64: TsBitBtn
          Left = 122
          Top = 163
          Width = 25
          Height = 21
          Hint = 'Eject_gemdos'
          TabOrder = 4
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
        object sBitBtn67: TsBitBtn
          Left = 129
          Top = 70
          Width = 25
          Height = 21
          Hint = 'Set_masteride'
          TabOrder = 5
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn68: TsBitBtn
          Left = 159
          Top = 70
          Width = 25
          Height = 21
          Hint = 'Eject_masteride'
          TabOrder = 6
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
        object sBitBtn69: TsBitBtn
          Left = 129
          Top = 118
          Width = 25
          Height = 21
          Hint = 'Set_slaveide'
          TabOrder = 7
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn70: TsBitBtn
          Left = 159
          Top = 118
          Width = 25
          Height = 21
          Hint = 'Eject_slaveide'
          TabOrder = 8
          OnClick = Hatari_ConfigRoms
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
        object sComboBox46: TsComboBox
          Left = 420
          Top = 164
          Width = 70
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Gem Dos Drive Write Protection'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 9
          Text = 'Off'
          Items.Strings = (
            'Off'
            'On'
            'Auto')
        end
      end
    end
    object Pem_hatari_screen: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 18
      SkinData.SkinSection = 'PANEL'
      object grp50: TGroupBox
        Left = 20
        Top = 20
        Width = 480
        Height = 133
        Caption = 'Hatari Screen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sCheckBox96: TsCheckBox
          Left = 101
          Top = 15
          Width = 77
          Height = 20
          Caption = 'Fullscreen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sComboBox47: TsComboBox
          Left = 94
          Top = 41
          Width = 90
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Frameskip'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'Off'
          Items.Strings = (
            'Off'
            '1'
            '2'
            '4'
            'Auto')
        end
        object grp53: TGroupBox
          Left = 189
          Top = 10
          Width = 156
          Height = 87
          Caption = 'Max Zoomed Window'
          TabOrder = 2
          object sLabel76: TsLabel
            Left = 70
            Top = 39
            Width = 7
            Height = 13
            Caption = 'X'
          end
          object sComboBox49: TsComboBox
            Left = 5
            Top = 36
            Width = 60
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = -1
            TabOrder = 0
          end
          object sComboBox48: TsComboBox
            Left = 87
            Top = 36
            Width = 60
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = -1
            TabOrder = 1
          end
        end
        object grp54: TGroupBox
          Left = 352
          Top = 16
          Width = 121
          Height = 81
          Caption = 'Avi'
          TabOrder = 3
          object sBitBtn71: TsBitBtn
            Left = 20
            Top = 49
            Width = 75
            Height = 25
            Caption = 'Record Avi'
            Enabled = False
            TabOrder = 0
            SkinData.SkinSection = 'BUTTON'
          end
          object sCheckBox97: TsCheckBox
            Left = 5
            Top = 19
            Width = 105
            Height = 20
            Caption = 'Crop Statusbar'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
        object sComboBox38: TsComboBox
          Left = 94
          Top = 70
          Width = 90
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Indicators'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 4
          Text = 'Status bar'
          Items.Strings = (
            'Status bar'
            'Drive Led'
            'None')
        end
        object sCheckBox62: TsCheckBox
          Left = 188
          Top = 107
          Width = 284
          Height = 20
          Caption = 'Atari Falcon/TT only : Keep Desktop Resolution'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp51: TGroupBox
        Left = 20
        Top = 159
        Width = 480
        Height = 130
        Caption = 'Atari Screen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object grp55: TGroupBox
          Left = 5
          Top = 20
          Width = 232
          Height = 105
          Caption = 'Atari Monitor'
          TabOrder = 0
          object sCheckBox98: TsCheckBox
            Left = 5
            Top = 61
            Width = 140
            Height = 20
            Caption = 'Show ST/STE Borders'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sComboBox50: TsComboBox
            Left = 160
            Top = 26
            Width = 60
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Type'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 1
            Text = 'Mono'
            Items.Strings = (
              'Mono'
              'RGB'
              'VGA'
              'TV')
          end
        end
        object grp56: TGroupBox
          Left = 242
          Top = 20
          Width = 232
          Height = 105
          Caption = 'VDI'
          TabOrder = 1
          object sComboBox51: TsComboBox
            Left = 47
            Top = 51
            Width = 60
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Size'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = -1
            TabOrder = 0
            Text = '2040'
          end
          object sComboBox52: TsComboBox
            Left = 139
            Top = 51
            Width = 60
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'X   '
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = -1
            TabOrder = 1
            Text = '2040'
          end
          object sComboBox53: TsComboBox
            Left = 99
            Top = 78
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Colors'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 2
            TabOrder = 2
            Text = '16'
            Items.Strings = (
              '2'
              '4'
              '16')
          end
          object sCheckBox99: TsCheckBox
            Left = 39
            Top = 14
            Width = 162
            Height = 20
            Caption = 'Use Extended DVI Screen'
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object grp52: TGroupBox
        Left = 20
        Top = 289
        Width = 480
        Height = 130
        Caption = 'Sound Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object grp57: TGroupBox
          Left = 5
          Top = 20
          Width = 232
          Height = 105
          Caption = 'Sound'
          TabOrder = 0
          object sCheckBox100: TsCheckBox
            Left = 16
            Top = 21
            Width = 94
            Height = 20
            Caption = 'Enable sound'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sComboBox54: TsComboBox
            Left = 128
            Top = 46
            Width = 100
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Playback Quality'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 6
            TabOrder = 1
            Text = '44100 Hz'
            Items.Strings = (
              '11025 Hz'
              '12517 Hz'
              '16000 Hz'
              '22050 Hz'
              '25033 Hz'
              '32000 Hz'
              '44100 Hz'
              '48000 Hz'
              '50066 Hz')
          end
          object sComboBox39: TsComboBox
            Left = 128
            Top = 74
            Width = 100
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'YM Voices Mixing'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 2
            Text = 'Math Model'
            Items.Strings = (
              'Math Model'
              'ST Table'
              'Linear')
          end
        end
        object grp58: TGroupBox
          Left = 242
          Top = 20
          Width = 232
          Height = 105
          Caption = 'Capture YM/WAV'
          TabOrder = 1
          object sLabel77: TsLabel
            Left = 50
            Top = 20
            Width = 146
            Height = 13
            Caption = 'File Name (*.wav or *.ym)'
          end
          object sLabel78: TsLabel
            Left = 5
            Top = 43
            Width = 46
            Height = 13
            Caption = 'c:/progr'
          end
          object sBitBtn72: TsBitBtn
            Left = 201
            Top = 17
            Width = 25
            Height = 21
            Enabled = False
            TabOrder = 0
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn73: TsBitBtn
            Left = 141
            Top = 76
            Width = 85
            Height = 25
            Caption = 'Record Sound'
            Enabled = False
            TabOrder = 1
            SkinData.SkinSection = 'BUTTON'
          end
        end
      end
    end
    object Pem_hatari_joy: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 19
      SkinData.SkinSection = 'PANEL'
      object grp59: TGroupBox
        Left = 20
        Top = 80
        Width = 400
        Height = 236
        Caption = 'Joystick Setup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sComboBox55: TsComboBox
          Left = 251
          Top = 20
          Width = 145
          Height = 21
          Hint = 'Change_joystick_port'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Joystick Port'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = -1
          TabOrder = 0
          Text = 'ST Joystick 0'
          OnChange = Hatari_ConfigJoy2
          OnDropDown = Hatari_ConfigJoy
          Items.Strings = (
            'ST Joystick 0'
            'ST Joystick 1'
            'STE Joypad A'
            'STE Joypad B'
            'Parallel Port Stick 1'
            'Parallel Port Stick 2')
        end
        object grp30: TGroupBox
          Left = 4
          Top = 48
          Width = 389
          Height = 185
          TabOrder = 1
          object grp61: TGroupBox
            Left = 5
            Top = 8
            Width = 212
            Height = 145
            TabOrder = 0
            object rb28: TRadioButton
              Left = 5
              Top = 20
              Width = 113
              Height = 17
              Hint = 'Joystick_disable'
              Caption = 'Disable'
              TabOrder = 0
              OnClick = Hatari_ConfigJoy
            end
            object rb29: TRadioButton
              Left = 5
              Top = 40
              Width = 113
              Height = 17
              Hint = 'Joystick_keyboard'
              Caption = 'Use Keyboard'
              TabOrder = 1
              OnClick = Hatari_ConfigJoy
            end
            object rb30: TRadioButton
              Left = 5
              Top = 60
              Width = 113
              Height = 17
              Hint = 'Joystick_real'
              Caption = 'Real Joystick'
              TabOrder = 2
              OnClick = Hatari_ConfigJoy
            end
            object sComboBox56: TsComboBox
              Left = 10
              Top = 113
              Width = 145
              Height = 21
              Alignment = taLeftJustify
              BoundLabel.Active = True
              BoundLabel.Caption = 'Found Joystics'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = [fsBold]
              BoundLabel.Layout = sclTopCenter
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
              SkinData.SkinSection = 'COMBOBOX'
              Enabled = False
              ItemHeight = 15
              ItemIndex = -1
              TabOrder = 3
            end
          end
          object grp20: TGroupBox
            Left = 228
            Top = 8
            Width = 153
            Height = 169
            TabOrder = 1
            object sLabel45: TsLabel
              Left = 10
              Top = 123
              Width = 21
              Height = 13
              Caption = 'Fire'
              Enabled = False
            end
            object sLabel44: TsLabel
              Left = 10
              Top = 99
              Width = 30
              Height = 13
              Caption = 'Right'
              Enabled = False
            end
            object sLabel31: TsLabel
              Left = 10
              Top = 75
              Width = 22
              Height = 13
              Caption = 'Left'
              Enabled = False
            end
            object sLabel30: TsLabel
              Left = 10
              Top = 51
              Width = 31
              Height = 13
              Caption = 'Down'
              Enabled = False
            end
            object sLabel29: TsLabel
              Left = 10
              Top = 27
              Width = 15
              Height = 13
              Caption = 'Up'
              Enabled = False
            end
            object sLabel63: TsLabel
              Left = 13
              Top = 148
              Width = 132
              Height = 13
              Caption = 'This key already used...'
              Color = clBtnFace
              ParentColor = False
              ParentFont = False
              Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              UseSkinColor = False
            end
            object sPanel37: TsPanel
              Left = 62
              Top = 20
              Width = 84
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = CheckUpKey
              SkinData.SkinSection = 'PANEL'
            end
            object sPanel38: TsPanel
              Left = 62
              Top = 44
              Width = 84
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 1
              OnClick = CheckUpKey
              SkinData.SkinSection = 'PANEL'
            end
            object sPanel39: TsPanel
              Left = 62
              Top = 68
              Width = 84
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = CheckUpKey
              SkinData.SkinSection = 'PANEL'
            end
            object sPanel40: TsPanel
              Left = 62
              Top = 92
              Width = 84
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 3
              OnClick = CheckUpKey
              SkinData.SkinSection = 'PANEL'
            end
            object sPanel41: TsPanel
              Left = 62
              Top = 116
              Width = 84
              Height = 20
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = CheckUpKey
              SkinData.SkinSection = 'PANEL'
            end
          end
          object sCheckBox101: TsCheckBox
            Left = 10
            Top = 159
            Width = 106
            Height = 20
            Caption = 'Enable Autofire'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object grp60: TGroupBox
        Left = 20
        Top = 316
        Width = 400
        Height = 132
        Caption = 'Keyboard Setup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sLabel80: TsLabel
          Left = 5
          Top = 50
          Width = 70
          Height = 13
          Caption = 'Mapping File'
        end
        object sLabel81: TsLabel
          Left = 5
          Top = 75
          Width = 3
          Height = 13
        end
        object sComboBox57: TsComboBox
          Left = 251
          Top = 20
          Width = 145
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Keyboard Mapping'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 0
          Text = 'Symbolic'
          Items.Strings = (
            'Symbolic'
            'Scancode'
            'From File')
        end
        object sBitBtn75: TsBitBtn
          Left = 80
          Top = 47
          Width = 25
          Height = 21
          Hint = 'Set_mapping'
          TabOrder = 1
          OnClick = Hatari_ConfigJoy
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sCheckBox102: TsCheckBox
          Left = 142
          Top = 110
          Width = 254
          Height = 20
          Caption = 'Disable Key Repeat In Fast Forward Mode'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sBitBtn50: TsBitBtn
          Left = 112
          Top = 47
          Width = 25
          Height = 21
          Hint = 'Eject_mapping'
          TabOrder = 3
          OnClick = Hatari_ConfigJoy
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
      end
    end
    object Pem_zinc_sound: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 15
      SkinData.SkinSection = 'PANEL'
      object sCheckBox79: TsCheckBox
        Left = 10
        Top = 50
        Width = 79
        Height = 20
        Caption = 'Use Sound'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox80: TsCheckBox
        Left = 10
        Top = 75
        Width = 100
        Height = 20
        Caption = 'Stereo Exciter'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox81: TsCheckBox
        Left = 10
        Top = 100
        Width = 130
        Height = 20
        Caption = 'Use Slow Geometry'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox82: TsCheckBox
        Left = 10
        Top = 125
        Width = 151
        Height = 20
        Caption = 'Use Stack In Ram Hack'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox83: TsCheckBox
        Left = 10
        Top = 150
        Width = 115
        Height = 20
        Caption = 'Use Mem Predict'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox84: TsCheckBox
        Left = 309
        Top = 50
        Width = 96
        Height = 20
        Hint = 'Filter'
        Caption = 'Filter Enabled'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = Zinc_SoundChecking
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox85: TsCheckBox
        Left = 309
        Top = 125
        Width = 96
        Height = 20
        Hint = 'Surround'
        Caption = 'Surround Lite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = Zinc_SoundChecking
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sEdit74: TsEdit
        Left = 500
        Top = 75
        Width = 45
        Height = 21
        Enabled = False
        TabOrder = 7
        Text = '22000'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Filter CuttOff'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sEdit75: TsEdit
        Left = 500
        Top = 150
        Width = 45
        Height = 21
        Enabled = False
        TabOrder = 8
        Text = '40'
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Surround Lite Multiplier'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
    end
    object Pexf_themes: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 12
      SkinData.SkinSection = 'PANEL'
    end
    object Pem_mame_sound: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 6
      SkinData.SkinSection = 'PANEL'
      object grp105: TGroupBox
        Left = 3
        Top = 372
        Width = 196
        Height = 193
        Caption = 'Sound'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sLabel13: TsLabel
          Left = 1
          Top = 114
          Width = 113
          Height = 13
          Caption = 'Volume Attenuation'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sLabel14: TsLabel
          Left = 1
          Top = 152
          Width = 80
          Height = 13
          Caption = 'Audio Latency'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sLabel15: TsLabel
          Left = 169
          Top = 152
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sLabel16: TsLabel
          Left = 169
          Top = 114
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sCheckBox26: TsCheckBox
          Left = 3
          Top = 20
          Width = 137
          Height = 20
          Caption = 'Enable Sound Output'
          Checked = True
          Enabled = False
          State = cbChecked
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sComboBox18: TsComboBox
          Left = 5
          Top = 81
          Width = 186
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Sample Rate'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopRight
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = '11025'
          Items.Strings = (
            '11025'
            '22050'
            '44100'
            '48000')
        end
        object sbar_mame_valumeattenuation: TsScrollBar
          Left = 3
          Top = 130
          Width = 190
          Height = 13
          Hint = 'Change_volume_attenuation'
          Max = 0
          Min = -32
          PageSize = 0
          TabOrder = 3
          OnChange = Mame_ManageSound
          SkinManager = SkinM
        end
        object sbar_mame_audiolatency: TsScrollBar
          Left = 3
          Top = 168
          Width = 190
          Height = 13
          Max = 5
          Min = 1
          PageSize = 0
          Position = 1
          TabOrder = 4
          OnChange = Mame_ManageSound
          SkinManager = SkinM
        end
        object sCheckBox43: TsCheckBox
          Left = 3
          Top = 40
          Width = 92
          Height = 20
          Caption = 'Use Samples'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp106: TGroupBox
        Left = 3
        Top = 9
        Width = 403
        Height = 361
        Caption = 'Controllers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object grp107: TGroupBox
          Left = 3
          Top = 186
          Width = 196
          Height = 43
          Caption = 'Joystick Deadzone'
          TabOrder = 4
          object sLabel19: TsLabel
            Left = 168
            Top = 7
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '1.00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sbar_mame_joysdeadzone: TsScrollBar
            Left = 3
            Top = 20
            Width = 190
            Height = 13
            Hint = 'Change_joystick_deadzone'
            Min = 10
            PageSize = 0
            Position = 10
            TabOrder = 0
            OnChange = Mame_ManageSound
            SkinManager = SkinM
          end
        end
        object grp108: TGroupBox
          Left = 203
          Top = 10
          Width = 196
          Height = 304
          Caption = 'Input Configuration'
          TabOrder = 0
          object sComboBox10: TsComboBox
            Left = 5
            Top = 30
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Paddle Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 0
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
          object sComboBox11: TsComboBox
            Left = 5
            Top = 65
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Pedal Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 1
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
          object sComboBox12: TsComboBox
            Left = 5
            Top = 100
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Dial Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 2
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
          object sComboBox13: TsComboBox
            Left = 5
            Top = 135
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Lightgun Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 3
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
          object sComboBox14: TsComboBox
            Left = 5
            Top = 170
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'ADStick Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 4
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
          object sComboBox15: TsComboBox
            Left = 5
            Top = 205
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Mouse Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 5
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
          object sComboBox16: TsComboBox
            Left = 5
            Top = 240
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Trackball Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 6
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
          object sComboBox17: TsComboBox
            Left = 5
            Top = 275
            Width = 186
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Positional Device'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopRight
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 7
            Text = 'none'
            Items.Strings = (
              'none'
              'keyboard'
              'mouse'
              'joystick'
              'lightgun')
          end
        end
        object grp109: TGroupBox
          Left = 3
          Top = 272
          Width = 196
          Height = 75
          Caption = 'Joystick Map'
          TabOrder = 3
          object sEdit15: TsEdit
            Left = 5
            Top = 24
            Width = 186
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'auto'
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn40: TsBitBtn
            Left = 127
            Top = 47
            Width = 25
            Height = 21
            Hint = 'Choose_joystick_map'
            TabOrder = 1
            OnClick = Mame_ManageSound
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn41: TsBitBtn
            Left = 159
            Top = 47
            Width = 25
            Height = 21
            Hint = 'Reset_joystick_map'
            TabOrder = 2
            OnClick = Mame_ManageSound
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 10
            Images = InBitBtn_Imagelist
          end
        end
        object sCheckBox16: TsCheckBox
          Left = 3
          Top = 40
          Width = 131
          Height = 20
          Caption = 'Enable Mouse Input'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox17: TsCheckBox
          Left = 3
          Top = 100
          Width = 172
          Height = 20
          Caption = 'Enable Steady Key Support'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox18: TsCheckBox
          Left = 3
          Top = 120
          Width = 143
          Height = 20
          Caption = 'Enable Lightgun Input'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox19: TsCheckBox
          Left = 3
          Top = 140
          Width = 151
          Height = 20
          Caption = 'Offscreen Shots Reload'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox20: TsCheckBox
          Left = 3
          Top = 160
          Width = 103
          Height = 20
          Caption = 'Dual Lightguns'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox21: TsCheckBox
          Left = 3
          Top = 80
          Width = 122
          Height = 20
          Caption = 'Multiple Keyboard'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox22: TsCheckBox
          Left = 3
          Top = 60
          Width = 94
          Height = 20
          Caption = 'Multiple Mice'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox23: TsCheckBox
          Left = 3
          Top = 20
          Width = 141
          Height = 20
          Caption = 'Enable Joystick Input'
          Checked = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          State = cbChecked
          TabOrder = 10
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object grp10: TGroupBox
          Left = 3
          Top = 229
          Width = 196
          Height = 43
          Caption = 'Joystick Saturation'
          TabOrder = 11
          object sLabel17: TsLabel
            Left = 169
            Top = 7
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '1.00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sbar_mame_joysaturation: TsScrollBar
            Left = 3
            Top = 20
            Width = 190
            Height = 13
            Hint = 'Change_joystick_saturation'
            Min = 10
            PageSize = 0
            Position = 10
            TabOrder = 0
            OnChange = Mame_ManageSound
            SkinManager = SkinM
          end
        end
      end
      object sButton2: TsButton
        Left = 567
        Top = 352
        Width = 156
        Height = 26
        Hint = 'Mame_save_global_button'
        Caption = 'Default Mame Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
      object sButton6: TsButton
        Left = 567
        Top = 318
        Width = 156
        Height = 26
        Hint = 'Mame_save_topic_sound_button'
        Caption = 'Default Topic Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
    end
    object Pce_wizard: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 2
      SkinData.SkinSection = 'PANEL'
    end
    object Pce_config: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 659
      Align = alCustom
      TabOrder = 1
      SkinData.SkinSection = 'PANEL'
      object sCheckBox1: TsCheckBox
        Left = 16
        Top = 26
        Width = 155
        Height = 20
        Hint = 'Help_in_main_panel'
        Caption = 'Show help in main panel'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 0
        OnClick = confEditor_Config_Set
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox2: TsCheckBox
        Left = 16
        Top = 56
        Width = 278
        Height = 20
        Hint = 'Show_path_in_main_form'
        Caption = 'Show Path directory in the main form caption.'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        State = cbChecked
        TabOrder = 1
        OnClick = confEditor_Config_Set
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object grp116: TGroupBox
        Left = 18
        Top = 99
        Width = 447
        Height = 68
        Caption = 'Windows Effects'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object sLabel32: TsLabel
          Left = 256
          Top = 20
          Width = 28
          Height = 13
          Caption = 'Time'
        end
        object sComboBox74: TsComboBox
          Left = 5
          Top = 34
          Width = 225
          Height = 21
          Hint = 'Window_effect_type'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Type'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = -1
          ParentFont = False
          TabOrder = 0
          Text = 'None'
          OnChange = confEditor_Config_Set
          Items.Strings = (
            'None'
            'From Right To Left'
            'From Left To Right'
            'From Down To Up'
            'From Up To Down'
            'From DownRight To UpLeft Corner'
            'From DownLeft To UpRight Corner'
            'From UpRight To DonwLeft Corner'
            'From UpLef  To DownRight Corner'
            'Collapse'
            'Random')
        end
        object se1: TSpinEdit
          Left = 255
          Top = 34
          Width = 48
          Height = 22
          MaxValue = 700
          MinValue = 100
          TabOrder = 1
          Value = 100
          OnChange = confEditor_Config_Set
        end
      end
    end
    object Pem_mame_dirs: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 3
      SkinData.SkinSection = 'PANEL'
      object sLabel47: TsLabel
        Left = 15
        Top = 85
        Width = 71
        Height = 13
        Caption = 'Mame Builds'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sGauge_MameChange: TsGauge
        Left = 8
        Top = 288
        Width = 233
        Height = 17
        Visible = False
        SkinData.SkinSection = 'GAUGE'
        ForeColor = clBlack
        Suffix = '%'
      end
      object sLabel112: TsLabel
        Left = 8
        Top = 272
        Width = 57
        Height = 13
        Caption = 'sLabel112'
        ParentFont = False
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object grp95: TGroupBox
        Left = 257
        Top = 85
        Width = 295
        Height = 369
        Caption = 'Directories'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sLabel46: TsLabel
          Left = 142
          Top = 347
          Width = 7
          Height = 13
          Caption = '1'
        end
        object sComboBox1: TsComboBox
          Left = 37
          Top = 21
          Width = 240
          Height = 21
          Hint = 'Add_or_Choose_rom_directories'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Roms'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopRight
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'Choose or Add directory...'
          OnChange = Mame_ManageDirectories
          Items.Strings = (
            'Choose or Add directory...'
            'add...')
        end
        object sBitBtn17: TsBitBtn
          Left = 12
          Top = 343
          Width = 35
          Height = 21
          Hint = 'Left_page_of_mame_dirs'
          Enabled = False
          TabOrder = 1
          OnClick = Mame_ManageDirectories
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 29
          Images = InBitBtn_Imagelist
        end
        object sBitBtn18: TsBitBtn
          Left = 248
          Top = 343
          Width = 35
          Height = 21
          Hint = 'Right_page_of_mame_dirs'
          TabOrder = 2
          OnClick = Mame_ManageDirectories
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 30
          Images = InBitBtn_Imagelist
        end
        object panel_mame_page1: TsPanel
          Left = 8
          Top = 55
          Width = 279
          Height = 285
          BevelOuter = bvNone
          TabOrder = 3
          SkinData.SkinSection = 'PANEL'
          object sEdit2: TsEdit
            Left = 6
            Top = 14
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Snapshots'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn19: TsBitBtn
            Left = 249
            Top = 14
            Width = 25
            Height = 21
            Hint = 'Mame_snapshots'
            TabOrder = 1
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn20: TsBitBtn
            Left = 250
            Top = 49
            Width = 25
            Height = 21
            Hint = 'Mame_samples'
            TabOrder = 2
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sEdit4: TsEdit
            Left = 6
            Top = 49
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Samples'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn21: TsBitBtn
            Left = 249
            Top = 84
            Width = 25
            Height = 21
            Hint = 'Mame_cabinets'
            TabOrder = 4
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sEdit3: TsEdit
            Left = 6
            Top = 84
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Cabinets'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn22: TsBitBtn
            Left = 249
            Top = 119
            Width = 25
            Height = 21
            Hint = 'Mame_flyers'
            TabOrder = 6
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sEdit8: TsEdit
            Left = 6
            Top = 119
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Flyers'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn23: TsBitBtn
            Left = 249
            Top = 154
            Width = 25
            Height = 21
            Hint = 'Mame_marquees'
            TabOrder = 8
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sEdit10: TsEdit
            Left = 6
            Top = 154
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Marquees'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn24: TsBitBtn
            Left = 249
            Top = 189
            Width = 25
            Height = 21
            Hint = 'Mame_control_panels'
            TabOrder = 10
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sEdit6: TsEdit
            Left = 6
            Top = 189
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Control Panels'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn25: TsBitBtn
            Left = 249
            Top = 224
            Width = 25
            Height = 21
            Hint = 'Mame_pcbs'
            TabOrder = 12
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sEdit9: TsEdit
            Left = 6
            Top = 224
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'PCBs'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn26: TsBitBtn
            Left = 249
            Top = 259
            Width = 25
            Height = 21
            Hint = 'Mame_artwork_preview'
            TabOrder = 14
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sEdit7: TsEdit
            Left = 6
            Top = 259
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Artwork Preview'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
        end
        object panel_mame_page2: TsPanel
          Left = 296
          Top = 55
          Width = 279
          Height = 285
          TabOrder = 4
          SkinData.SkinSection = 'PANEL'
          object sEdit11: TsEdit
            Left = 6
            Top = 14
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Titles'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit5: TsEdit
            Left = 6
            Top = 49
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Select'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit58: TsEdit
            Left = 6
            Top = 84
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Scores'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit59: TsEdit
            Left = 6
            Top = 119
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Bosses'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit60: TsEdit
            Left = 6
            Top = 154
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Crosshair'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit61: TsEdit
            Left = 6
            Top = 189
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Artwork'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit62: TsEdit
            Left = 6
            Top = 224
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Input Files'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit63: TsEdit
            Left = 6
            Top = 259
            Width = 240
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'State'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn34: TsBitBtn
            Left = 248
            Top = 224
            Width = 25
            Height = 21
            Hint = 'Mame_input'
            TabOrder = 8
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn33: TsBitBtn
            Left = 248
            Top = 255
            Width = 25
            Height = 21
            Hint = 'Mame_state'
            TabOrder = 9
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn32: TsBitBtn
            Left = 249
            Top = 189
            Width = 25
            Height = 21
            Hint = 'Mame_artwork'
            TabOrder = 10
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn31: TsBitBtn
            Left = 249
            Top = 154
            Width = 25
            Height = 21
            Hint = 'Mame_crosshair'
            TabOrder = 11
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn30: TsBitBtn
            Left = 249
            Top = 119
            Width = 25
            Height = 21
            Hint = 'Mame_bosses'
            TabOrder = 12
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn29: TsBitBtn
            Left = 249
            Top = 84
            Width = 25
            Height = 21
            Hint = 'Mame_scores'
            TabOrder = 13
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn28: TsBitBtn
            Left = 249
            Top = 49
            Width = 25
            Height = 21
            Hint = 'Mame_select'
            TabOrder = 14
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn27: TsBitBtn
            Left = 249
            Top = 14
            Width = 25
            Height = 21
            Hint = 'Mame_titles'
            TabOrder = 15
            OnClick = Mame_ManageDirectories
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
        end
        object sBitBtn42: TsBitBtn
          Left = 7
          Top = 21
          Width = 25
          Height = 21
          Hint = 'Show_results_from_rom_paths'
          TabOrder = 5
          Visible = False
          OnClick = Mame_ManageDirectories
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 20
          Images = InBitBtn_Imagelist
        end
      end
      object sButton22: TsButton
        Left = 567
        Top = 352
        Width = 156
        Height = 26
        Hint = 'Mame_save_global_button'
        Caption = 'Default Mame Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
      object sEdit64: TsEdit
        Left = 15
        Top = 50
        Width = 503
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path to Mame execution file'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn35: TsBitBtn
        Left = 524
        Top = 50
        Width = 25
        Height = 21
        Hint = 'Find_Mame'
        TabOrder = 3
        OnClick = Mame_ManageDirectories
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object sCheckListBox1: TsCheckListBox
        Left = 15
        Top = 99
        Width = 197
        Height = 103
        Hint = 'Show_mame_builds'
        Style = lbOwnerDrawFixed
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Enabled = False
        ExtendedSelect = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 16
        ParentFont = False
        TabOrder = 4
        OnDrawItem = sCheckListBox1DrawItem
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopCenter
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object sBitBtn36: TsBitBtn
        Left = 215
        Top = 99
        Width = 25
        Height = 21
        Hint = 'Select_mame_button_up'
        TabOrder = 5
        OnClick = Mame_ManageDirectories
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 31
        Images = InBitBtn_Imagelist
      end
      object sBitBtn37: TsBitBtn
        Left = 215
        Top = 181
        Width = 25
        Height = 21
        Hint = 'Select_mame_button_down'
        TabOrder = 6
        OnClick = Mame_ManageDirectories
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 28
        Images = InBitBtn_Imagelist
      end
      object sCheckBox127: TsCheckBox
        Left = 15
        Top = 207
        Width = 188
        Height = 20
        Hint = 'Show Setuped Mame'
        Caption = 'Show Only Setup Mame Builds'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        OnClick = Mame_ManageDirectories
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sButton4: TsButton
        Left = 567
        Top = 318
        Width = 156
        Height = 26
        Hint = 'Mame_save_topic_dirs_button'
        Caption = 'Default Topic Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
    end
    object Pem_mame_graphics: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 4
      SkinData.SkinSection = 'PANEL'
      object sCheckBox3: TsCheckBox
        Left = 3
        Top = 10
        Width = 115
        Height = 20
        Caption = 'Run In A Window'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox4: TsCheckBox
        Left = 3
        Top = 30
        Width = 113
        Height = 20
        Caption = 'Start Maximized'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox5: TsCheckBox
        Left = 3
        Top = 50
        Width = 137
        Height = 20
        Caption = 'Enforce Aspect Ratio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox6: TsCheckBox
        Left = 3
        Top = 70
        Width = 66
        Height = 20
        Caption = 'Throttle'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object grp97: TGroupBox
        Left = 209
        Top = 185
        Width = 196
        Height = 145
        Caption = 'Fullscreen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        object sLabel6: TsLabel
          Left = 168
          Top = 88
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sLabel7: TsLabel
          Left = 168
          Top = 58
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sLabel8: TsLabel
          Left = 168
          Top = 24
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sLabel48: TsLabel
          Left = 3
          Top = 24
          Width = 44
          Height = 13
          Caption = 'Gamma'
        end
        object sLabel49: TsLabel
          Left = 3
          Top = 58
          Width = 60
          Height = 13
          Caption = 'Brightness'
        end
        object sLabel50: TsLabel
          Left = 3
          Top = 88
          Width = 49
          Height = 13
          Caption = 'Contrast'
        end
        object sbar_mame_Fgamma: TsScrollBar
          Left = 3
          Top = 40
          Width = 190
          Height = 13
          Hint = 'Change_fullscreen_gamma'
          Ctl3D = True
          Max = 300
          Min = 10
          PageSize = 0
          ParentCtl3D = False
          Position = 10
          TabOrder = 0
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
        object sbar_mame_Fbrightness: TsScrollBar
          Left = 2
          Top = 71
          Width = 190
          Height = 13
          Hint = 'Change_fullscreen_brightness'
          Ctl3D = True
          Max = 200
          Min = 10
          PageSize = 0
          ParentCtl3D = False
          Position = 10
          TabOrder = 1
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
        object sbar_mame_Fcontrast: TsScrollBar
          Left = 2
          Top = 104
          Width = 190
          Height = 13
          Hint = 'Change_fullscreen_contrast'
          Ctl3D = True
          Max = 200
          Min = 10
          PageSize = 0
          ParentCtl3D = False
          Position = 10
          TabOrder = 2
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
        object sCheckBox9: TsCheckBox
          Left = 2
          Top = 122
          Width = 156
          Height = 20
          Caption = 'Switch Resolutions to fit'
          TabOrder = 3
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp98: TGroupBox
        Left = 209
        Top = 10
        Width = 196
        Height = 172
        Caption = 'Video'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object sComboBox2: TsComboBox
          Left = 5
          Top = 16
          Width = 186
          Height = 21
          Hint = 'Change_video_mode'
          Alignment = taLeftJustify
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'None'
          OnChange = Mame_ManageGraphics
          Items.Strings = (
            'None'
            'GDI'
            'Direct Draw'
            'Direct 3D')
        end
        object grp99: TGroupBox
          Left = 3
          Top = 41
          Width = 190
          Height = 81
          Caption = 'Direct 3D'
          TabOrder = 1
          object sLabel51: TsLabel
            Left = 21
            Top = 18
            Width = 118
            Height = 13
            Caption = 'Use Billinear Filtering'
          end
          object sCheckBox7: TsCheckBox
            Left = 4
            Top = 16
            Width = 15
            Height = 20
            AutoSize = False
            Enabled = False
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sComboBox3: TsComboBox
            Left = 79
            Top = 53
            Width = 110
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Version of Direct3d'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = 0
            ParentFont = False
            TabOrder = 1
            Text = 'Version 9'
            Items.Strings = (
              'Version 9'
              'Version 8')
          end
        end
        object grp100: TGroupBox
          Left = 3
          Top = 126
          Width = 190
          Height = 41
          Caption = 'Direct Draw'
          TabOrder = 2
          object sLabel52: TsLabel
            Left = 21
            Top = 18
            Width = 134
            Height = 13
            Caption = 'Stretch Using Hardware'
          end
          object sCheckBox8: TsCheckBox
            Left = 4
            Top = 16
            Width = 15
            Height = 20
            AutoSize = False
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object grp101: TGroupBox
        Left = 414
        Top = 69
        Width = 196
        Height = 193
        Caption = 'Screen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sComboBox4: TsComboBox
          Left = 5
          Top = 21
          Width = 186
          Height = 21
          Hint = 'Change_per_window_video_mode'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Per Window Video'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopRight
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'All Screens'
          OnChange = Mame_ManageGraphics
          Items.Strings = (
            'All Screens'
            'Screen 1'
            'Screen 2'
            'Screen 3'
            'Screen 4')
        end
        object sComboBox5: TsComboBox
          Left = 5
          Top = 56
          Width = 186
          Height = 21
          Hint = 'Change_per_window_physical_monitor'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Physical Monitor'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopRight
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'auto'
          OnChange = Mame_ManageGraphics
          Items.Strings = (
            'auto')
        end
        object sComboBox6: TsComboBox
          Left = 5
          Top = 91
          Width = 186
          Height = 21
          Hint = 'Change_per_window_aspect'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Aspect Ratio'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopRight
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'auto'
          OnChange = Mame_ManageGraphics
          Items.Strings = (
            'auto'
            '4:3'
            '5:4'
            '16:9')
        end
        object sComboBox7: TsComboBox
          Left = 5
          Top = 126
          Width = 186
          Height = 21
          Hint = 'Change_per_window_resolution'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Resolution'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopRight
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = -1
          ParentFont = False
          TabOrder = 3
          Text = 'auto'
          OnChange = Mame_ManageGraphics
          Items.Strings = (
            'auto')
        end
        object sComboBox8: TsComboBox
          Left = 5
          Top = 161
          Width = 186
          Height = 21
          Hint = 'Change_per_window_view'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'View'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopRight
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 4
          Text = 'auto'
          OnChange = Mame_ManageGraphics
          Items.Strings = (
            'auto'
            'standard'
            'pixel aspect'
            'coctail')
        end
      end
      object grp103: TGroupBox
        Left = 209
        Top = 334
        Width = 196
        Height = 279
        Caption = 'Advanced'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        object sCheckBox11: TsCheckBox
          Left = 3
          Top = 18
          Width = 118
          Height = 20
          Caption = 'Triple Buffering'
          AutoSize = False
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox12: TsCheckBox
          Left = 3
          Top = 58
          Width = 174
          Height = 20
          Caption = 'Sync to monitor Refresh'
          AutoSize = False
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox13: TsCheckBox
          Left = 3
          Top = 38
          Width = 158
          Height = 20
          Caption = 'Wait For Vertical Sync'
          AutoSize = False
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox14: TsCheckBox
          Left = 3
          Top = 78
          Width = 126
          Height = 20
          Caption = 'Refresh Speed'
          AutoSize = False
          TabOrder = 3
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object grp7: TGroupBox
          Left = 3
          Top = 101
          Width = 190
          Height = 43
          Caption = 'Seconds To Run'
          TabOrder = 4
          object sLabel12: TsLabel
            Left = 169
            Top = 4
            Width = 7
            Height = 13
            Alignment = taRightJustify
            Caption = '0'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sbar_mame_secondstorun: TsScrollBar
            Left = 3
            Top = 20
            Width = 184
            Height = 13
            Hint = 'Change_seconds_to_run'
            Max = 60
            PageSize = 0
            TabOrder = 0
            OnChange = Mame_ManageGraphics
            SkinManager = SkinM
          end
        end
        object grp8: TGroupBox
          Left = 3
          Top = 144
          Width = 190
          Height = 43
          Caption = 'Scale Screen'
          TabOrder = 5
          object sLabel1: TsLabel
            Left = 169
            Top = 4
            Width = 7
            Height = 13
            Alignment = taRightJustify
            Caption = '1'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sbar_mame_scalescreen: TsScrollBar
            Left = 3
            Top = 20
            Width = 184
            Height = 13
            Hint = 'Change_scale_screen'
            Ctl3D = True
            Max = 10
            Min = 1
            PageSize = 0
            ParentCtl3D = False
            Position = 1
            TabOrder = 0
            OnChange = Mame_ManageGraphics
            SkinManager = SkinM
          end
        end
        object grp9: TGroupBox
          Left = 3
          Top = 191
          Width = 190
          Height = 72
          Caption = 'Visual Effects'
          TabOrder = 6
          object sEdit1: TsEdit
            Left = 5
            Top = 20
            Width = 180
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            Text = 'none'
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Caption = 'Effect'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn38: TsBitBtn
            Left = 123
            Top = 45
            Width = 25
            Height = 21
            Hint = 'Choose_effect'
            TabOrder = 1
            OnClick = Mame_ManageGraphics
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn39: TsBitBtn
            Left = 154
            Top = 44
            Width = 25
            Height = 21
            Hint = 'Reset_effect'
            TabOrder = 2
            OnClick = Mame_ManageGraphics
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 10
            Images = InBitBtn_Imagelist
          end
        end
      end
      object grp104: TGroupBox
        Left = 3
        Top = 472
        Width = 196
        Height = 65
        Caption = 'Frame Skipping'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        object sCheckBox15: TsCheckBox
          Left = 140
          Top = 8
          Width = 47
          Height = 20
          Caption = 'Auto'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sComboBox9: TsComboBox
          Left = 5
          Top = 32
          Width = 186
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = -1
          ParentFont = False
          TabOrder = 1
          Text = 'Draw Every Frame'
          Items.Strings = (
            'Draw Every Frame'
            'Skip 1 of 10 Frames'
            'Skip 2 of 10 Frames'
            'Skip 3 of 10 Frames'
            'Skip 4 of 10 Frames'
            'Skip 5 of 10 Frames'
            'Skip 6 of 10 Frames'
            'Skip 7 of 10 Frames'
            'Skip 8 of 10 Frames'
            'Skip 9 of 10 Frames'
            'Skip 10 of 10 Frames')
        end
      end
      object grp96: TGroupBox
        Left = 3
        Top = 185
        Width = 196
        Height = 103
        Caption = 'Rotation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object sComboBox20: TsComboBox
          Left = 5
          Top = 17
          Width = 186
          Height = 21
          Hint = 'Change_rotation'
          Alignment = taLeftJustify
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = []
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 2
          Text = 'Default'
          OnChange = Mame_ManageGraphics
          Items.Strings = (
            'Default'
            'Clockwise'
            'Anti-Clockwise'
            'None'
            'Auto Clockwise'
            'Auto Anti-Clockwise')
        end
        object sCheckBox40: TsCheckBox
          Left = 3
          Top = 78
          Width = 158
          Height = 20
          Caption = 'Flip Screen Upside-Down'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox41: TsCheckBox
          Left = 3
          Top = 53
          Width = 141
          Height = 20
          Caption = 'Flip Screen Left-Right'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp2: TGroupBox
        Left = 3
        Top = 332
        Width = 196
        Height = 43
        Caption = 'Gamma Correction'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        Visible = False
        object sLabel4: TsLabel
          Left = 168
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sbar_mame_gammacorrection: TsScrollBar
          Left = 3
          Top = 20
          Width = 190
          Height = 13
          Hint = 'Change_gamma'
          Ctl3D = True
          Max = 300
          Min = 10
          PageSize = 0
          ParentCtl3D = False
          Position = 10
          TabOrder = 0
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
      end
      object grp3: TGroupBox
        Left = 3
        Top = 289
        Width = 196
        Height = 43
        Caption = 'Pause Brightness'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        object sLabel3: TsLabel
          Left = 168
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sbar_mame_pausebrightness: TsScrollBar
          Left = 4
          Top = 20
          Width = 190
          Height = 13
          Hint = 'Change_pause_brightness'
          Ctl3D = True
          PageSize = 0
          ParentCtl3D = False
          TabOrder = 0
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
      end
      object grp4: TGroupBox
        Left = 3
        Top = 375
        Width = 196
        Height = 43
        Caption = 'Brightness Correction'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        object sLabel5: TsLabel
          Left = 168
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sbar_mame_brightnesscorrection: TsScrollBar
          Left = 3
          Top = 20
          Width = 190
          Height = 13
          Hint = 'Change_brightness'
          Ctl3D = True
          Max = 200
          Min = 10
          PageSize = 0
          ParentCtl3D = False
          Position = 10
          TabOrder = 0
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
      end
      object grp5: TGroupBox
        Left = 3
        Top = 418
        Width = 196
        Height = 43
        Caption = 'Contrast Correction'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 13
        object sLabel2: TsLabel
          Left = 168
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sbar_mame_contrastcorrection: TsScrollBar
          Left = 3
          Top = 19
          Width = 190
          Height = 13
          Hint = 'Change_contrast'
          Ctl3D = True
          Max = 200
          Min = 10
          PageSize = 0
          ParentCtl3D = False
          Position = 10
          TabOrder = 0
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
      end
      object grp6: TGroupBox
        Left = 3
        Top = 119
        Width = 196
        Height = 43
        Caption = 'Gameplay Speed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 14
        object sLabel11: TsLabel
          Left = 168
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sbar_mame_emulatrionspeed: TsScrollBar
          Left = 3
          Top = 20
          Width = 190
          Height = 13
          Hint = 'Change_emulation_speed'
          Max = 10000
          Min = 1
          PageSize = 0
          Position = 10
          TabOrder = 0
          OnChange = Mame_ManageGraphics
          SkinManager = SkinM
        end
      end
      object sButton1: TsButton
        Left = 567
        Top = 352
        Width = 156
        Height = 26
        Hint = 'Mame_save_global_button'
        Caption = 'Default Mame Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 15
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
      object sButton5: TsButton
        Left = 567
        Top = 318
        Width = 156
        Height = 26
        Hint = 'Mame_save_topic_graphics_button'
        Caption = 'Default Topic Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 16
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
    end
    object Pem_mame_others: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 5
      SkinData.SkinSection = 'PANEL'
      object grp110: TGroupBox
        Left = 3
        Top = 184
        Width = 196
        Height = 43
        Caption = 'Thread Priority'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sLabel28: TsLabel
          Left = 169
          Top = 7
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = '1.00'
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
        end
        object sbar_mame_threadpriority: TsScrollBar
          Left = 3
          Top = 20
          Width = 190
          Height = 13
          Hint = 'Change_thread_priority'
          Max = 1
          Min = -15
          PageSize = 0
          TabOrder = 0
          OnChange = Mame_ManageOthers
          SkinManager = SkinM
        end
      end
      object grp111: TGroupBox
        Left = 204
        Top = 10
        Width = 196
        Height = 180
        Caption = 'Snapshot'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object grp112: TGroupBox
          Left = 3
          Top = 93
          Width = 190
          Height = 65
          Caption = 'Snapshot View'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object sComboBox19: TsComboBox
            Left = 5
            Top = 24
            Width = 180
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemHeight = 15
            ItemIndex = -1
            ParentFont = False
            TabOrder = 0
            Text = 'internal'
            Items.Strings = (
              'internal'
              'auto'
              'standard'
              'pixel aspect'
              'coctail')
          end
        end
        object grp102: TGroupBox
          Left = 3
          Top = 19
          Width = 190
          Height = 65
          Caption = 'Snapshot Size'
          TabOrder = 1
          object sComboBox73: TsComboBox
            Left = 5
            Top = 24
            Width = 180
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 0
            Text = 'auto'
            Items.Strings = (
              'auto'
              '320X240'
              '640X480'
              '800X600'
              '1024X768'
              '1024X1024')
          end
        end
      end
      object grp113: TGroupBox
        Left = 405
        Top = 10
        Width = 196
        Height = 121
        Caption = 'Artwork Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sCheckBox35: TsCheckBox
          Left = 3
          Top = 24
          Width = 79
          Height = 20
          Caption = 'Backdrops'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox36: TsCheckBox
          Left = 3
          Top = 48
          Width = 56
          Height = 20
          Caption = 'Bezels'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox37: TsCheckBox
          Left = 3
          Top = 72
          Width = 70
          Height = 20
          Caption = 'Overlays'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox38: TsCheckBox
          Left = 3
          Top = 96
          Width = 95
          Height = 20
          Caption = 'Crop Artwork'
          TabOrder = 3
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp114: TGroupBox
        Left = 3
        Top = 232
        Width = 196
        Height = 156
        Caption = 'Vector'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object sCheckBox39: TsCheckBox
          Left = 28
          Top = 20
          Width = 161
          Height = 20
          Caption = 'Draw Antialiased Vectors'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object grp15: TGroupBox
          Left = 3
          Top = 50
          Width = 190
          Height = 43
          Caption = 'Beam Width'
          TabOrder = 1
          object sLabel18: TsLabel
            Left = 158
            Top = 7
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '1.00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sbar_mame_beamwidth: TsScrollBar
            Left = 5
            Top = 20
            Width = 180
            Height = 13
            Hint = 'Change_beam_width'
            Max = 1000
            Min = 10
            PageSize = 0
            Position = 10
            TabOrder = 0
            OnChange = Mame_ManageOthers
            SkinManager = SkinM
          end
        end
        object grp16: TGroupBox
          Left = 3
          Top = 100
          Width = 190
          Height = 43
          Caption = 'Flicker'
          TabOrder = 2
          object sLabel20: TsLabel
            Left = 158
            Top = 7
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = '1.00'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sbar_mame_flicker: TsScrollBar
            Left = 5
            Top = 20
            Width = 180
            Height = 13
            Hint = 'Change_flicker'
            Max = 10000
            PageSize = 0
            TabOrder = 0
            OnChange = Mame_ManageOthers
            SkinManager = SkinM
          end
        end
      end
      object sCheckBox24: TsCheckBox
        Left = 3
        Top = 20
        Width = 135
        Height = 20
        Caption = 'Enable Game Cheats'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox27: TsCheckBox
        Left = 3
        Top = 40
        Width = 135
        Height = 20
        Caption = 'Sleep When Possible'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        Visible = False
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox28: TsCheckBox
        Left = 3
        Top = 60
        Width = 106
        Height = 20
        Caption = 'Skip Game Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox30: TsCheckBox
        Left = 3
        Top = 100
        Width = 171
        Height = 20
        Caption = 'Multi-Threading Rendering'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox31: TsCheckBox
        Left = 3
        Top = 120
        Width = 92
        Height = 20
        Caption = 'Coin Lockout'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sButton3: TsButton
        Left = 567
        Top = 352
        Width = 156
        Height = 26
        Hint = 'Mame_save_global_button'
        Caption = 'Default Mame Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 9
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
      object sButton7: TsButton
        Left = 567
        Top = 318
        Width = 156
        Height = 26
        Hint = 'Mame_save_topic_others_button'
        Caption = 'Default Topic Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 10
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
      object sCheckBox29: TsCheckBox
        Left = 3
        Top = 80
        Width = 159
        Height = 20
        Caption = 'Save Game State on Exit'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 11
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sComboBox75: TsComboBox
        Left = 3
        Top = 157
        Width = 196
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = 'User Interface Font'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 12
        Text = 'default'
        Items.Strings = (
          'default')
      end
    end
    object Pem_mame_builds: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 7
      SkinData.SkinSection = 'PANEL'
      object PBuilds_MameTools: TsPanel
        Left = 10
        Top = 50
        Width = 550
        Height = 524
        BevelOuter = bvNone
        Ctl3D = True
        ParentCtl3D = False
        TabOrder = 3
        SkinData.SkinSection = 'PANEL'
        object grp122: TGroupBox
          Left = 10
          Top = 21
          Width = 530
          Height = 105
          Caption = 'Create New Font For Mame'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object img86: TImage
            Left = 494
            Top = 10
            Width = 30
            Height = 30
            Hint = 
              '|WARNING!!'#13#10'  If you push "Create Font" the selected mame from n' +
              'ow it uses your created font.'#13#10'  If you dont like and want to ch' +
              'ange the font to default mame font or any other,'#13#10'just push the ' +
              'button others and change the desire font in the '
            ParentShowHint = False
            Picture.Data = {
              0B54504E474772617068696316290100424D1629010000000000360000002800
              00007D000000980000000100200000000000E028010000000000000000000000
              000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6FFBDBDBDFFB2B2
              B2FFA6A6A6FF9B9B9BFF939393FF8E8E8EFF8A8A8AFF888888FF858585FF8989
              89FF969696FFAAAAAAFFB9B9B9FFBFBFBFFFC3C3C3FFC6C6C6FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00919191FF838383FF7D7D7DFF7C7C7CFF7E7E7EFF8484
              84FF8C8C8CFF8F8F8FFF929292FF8D8D8DFF949494FF8F8F8FFF919191FFACAC
              ACFFB1B1B1FFB4B4B4FFB7B7B7FFBABABAFFBEBEBEFFC2C2C2FFC5C5C5FFC8C8
              C8FFCACACAFFCACACAFFCDCDCDFFD1D1D1FFD2D2D2FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BBBBBBFFAAAA
              AAFF9A9A9AFF989898FF9F9F9FFFA4A4A4FFA7A7A7FFA8A8A8FFA8A8A8FFAAAA
              AAFFA9A9A9FFAAAAAAFFA7A7A7FFACACACFFA6A6A6FF9C9C9CFF9A9A9AFF9999
              99FF979797FF949494FF919191FF8E8E8EFF8C8C8CFF8B8B8BFF8B8B8BFF8A8A
              8AFF888888FF888888FF898989FF8E8E8EFF939393FF989898FFBEBEBEFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B5B5B5FFB3B3B3FFB3B3B3FFB7B7B7FFBCBC
              BCFFBFBFBFFFBEBEBEFFBCBCBCFFBABABAFFBABABAFFBABABAFFB6B6B6FFB4B4
              B4FFB6B6B6FF8E8E8EFF797979FF797979FF7A7A7AFF7B7B7BFF7D7D7DFF7F7F
              7FFF808080FF828282FF838383FF8A8A8AFF888888FF878787FF898989FF8D8D
              8DFF909090FF919191FF919191FFAEAEAEFFC8C8C80AFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C1C1C1FFCACACAFFD3D3D3FFD6D6D6FFD4D4D4FFD1D1D1FFCDCDCDFFCACA
              CAFFCBCBCBFFCACACAFFC9C9C9FFCBCBCBFFCACACAFFC6C6C6FF9E9E9EFF9191
              91FF949494FF969696FF999999FF9E9E9EFFA3A3A3FFA8A8A8FFABABABFFACAC
              ACFFACACACFFACACACFFADADADFFAFAFAFFFB2B2B2FFB3B3B3FFB1B1B1FFAFAF
              AFFFB1B1B1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0D0D0FFD3D3D3FFD6D6
              D6FFD7D7D7FFD9D9D9FFDBDBDBFFDCDCDCFFDBDBDBFFDADADAFFD8D8D8FFD2D2
              D2FFD8D8D8FFD0D0D0FFBDBDBDFFA6A6A6FFA6A6A6FFA6A6A6FFA6A6A6FFA8A8
              A8FFABABABFFAFAFAFFFB2B2B2FFB3B3B3FFB3B3B3FFB9B9B9FFB8B8B8FFB8B8
              B8FFB8B8B8FFB9B9B9FFBBBBBBFFBEBEBEFFC0C0C0FFBDBDBDFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00D6D6D6FFD8D8D8FFD6D6D6FFD3D3D3FFD4D4
              D4FFDADADAFFDFDFDFFFE5E5E5FFE2E2E2FFE2E2E2FFE4E4E4FFD7D7D7FFB9B9
              B9FFAAAAAAFFABABABFFA8A8A8FFA8A8A8FFAAAAAAFFAEAEAEFFB4B4B4FFB9B9
              B9FFBBBBBBFFBCBCBCFFB8B8B8FFBABABAFFBDBDBDFFBFBFBFFFC0C0C0FFC3C3
              C3FFC8C8C8FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00D1D1D1FFCACACAFFBCBCBCFFB0B0B0FFB0B0B0FFB6B6B6FFBEBE
              BEFFC1C1C1FFDEDEDEFFDFDFDFFFDFDFDFFFCCCCCCFFB7B7B7FFACACACFFA9A9
              A9FFA7A7A7FFA7A7A7FFAAAAAAFFAFAFAFFFB6B6B6FFBABABAFFBDBDBDFFB8B8
              B8FFBBBBBBFFC0C0C0FFC4C4C4FFC8C8C8FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5C5FFC1C1
              C1FFB8B8B8FFABABABFFA4A4A4FFA4A4A4FF9D9D9DFFA4A4A4FFDBDBDBFFDCDC
              DC33E9E9E90AE3E3E314C2C2C2FFA9A9A9FFA3A3A3FFA0A0A0FF9E9E9EFFA0A0
              A0FFA6A6A6FFAEAEAEFFB5B5B5FFB8B8B8FFC3C3C3FFC3C3C3FFC3C3C3FFC4C4
              C4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C4C4C4FFBEBEBEFFB3B3B3FFAEAEAEFFA4A4
              A4FFA5A5A5FFA0A0A0FF9A9A9AFFB5B5B5FFEAEAEA0AFFFFFF00E2E2E214DFDF
              DF29A5A5A5FF9C9C9CFF9B9B9BFF9B9B9BFF9C9C9CFFA1A1A1FFA8A8A8FFAEAE
              AEFFB1B1B1FFC8C8C80AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C1C1C1FFBCBCBCFFB6B6B6FFB0B0B0FFA7A7A7FFA6A6A6FF9B9B9BFFA0A0
              A0FF9D9D9DFFDCDCDC33FFFFFF00FFFFFF00E1E1E11FA5A5A5FF9A9A9AFF9999
              99FF999999FF9B9B9BFFA0A0A0FFA7A7A7FFADADADFFB1B1B1FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2C2C2FFBBBBBBFFBABA
              BAFFB3B3B3FFACACACFFA7A7A7FF9E9E9EFF9B9B9BFF969696FFB8B8B8EBFFFF
              FF00FFFFFF00FFFFFF00A7A7A7FF999999FF979797FF969696FF999999FF9E9E
              9EFFA5A5A5FFACACACFFB0B0B0FFC2C2C2FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C7C7C70ABDBDBDFFBEBEBEFFB4B4B4FFB0B0B0FFA9A9
              A9FFA5A5A5FF989898FF9D9D9DFF9B9B9BFFD0D0D00FFFFFFF00FFFFFF00ADAD
              ADFF999999FF969696FF959595FF989898FF9D9D9DFFA4A4A4FFAAAAAAFFAFAF
              AFFFC3C3C3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E0DAFFFFDFD9FFFFD4D3
              F3FFC8CAE20AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C2C2C2FFBEBEBEFFB4B4B4FFB1B1B1FFAAAAAAFFA3A3A3FFA2A2A2FF9A9A
              9AFF989898FFA9A9A950EAEAEA05EBEBEB05B1B1B1FF9A9A9AFF969696FF9494
              94FF989898FF9D9D9DFFA3A3A3FFA8A8A8FFADADADFFC2C2C2FFFFFFFF00FFFF
              FF00F1F1F1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00EDEDFBFFEBE6FFFF938DB6FF59537CFF2B2A4AFF282A42FF2C3140FF353D
              44FF626D6BFF9BA99EFFE2F1E3FFECF6E9FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C8C80ABCBCBCFFB6B6
              B6FFB2B2B2FFABABABFFA2A2A2FFAAAAAAFF9A9A9AFF989898FF9A9A9AFFC6C6
              C6FFEBEBEBFFAFAFAFFF999999FF959595FF939393FF989898FF9E9E9EFFA2A2
              A2FFA7A7A7FFABABABFFBABABAFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A3A2CEFF231F53FF0A0B
              3EFF0B0A42FF050642FF010044FF000045FF00004FFF000051FF00004FFF0E11
              5CFF4B4C90FF9294CEFFC3C6F3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00BDBDBDFFBCBCBCFFB6B6B6FFAFAFAFFFA8A8
              A8FFA8A8A8FFA0A0A0FF989898FF9F9F9FFFA1A1A1FFDADADAFFACACACFF9898
              98FF939393FF929292FF989898FF9E9E9EFFA2A2A2FFA6A6A6FFAAAAAAFFB7B7
              B7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00767793FF191844FF141044FF0F1043FF0C0B43FF070844FF0706
              4AFF03054CFF060555FF0A0B5CFF101162FF10135EFF1A1B5FFF242660FF3A3D
              6AFF6C7192FFAEB3C8FFDCE1F0FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00BEBEBEFFC1C1C1FFBBBBBBFFB3B3B3FFB0B0B0FFA6A6A6FFA3A3A3FFA1A1
              A1FF9D9D9DFF979797FFBEBEBEFFAEAEAEFF969696FF919191FF919191FF9797
              97FF9E9E9EFFA1A1A1FFA5A5A5FFA9A9A9FFB1B1B1FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000F104DFF1313
              5FFF0A0959FF060856FF030455FF00015CFF03036FFF0B0985FF0F0C98FF0F0B
              A6FF100BAAFF0C07A8FF0A05A6FF08059EFF13109CFF12118FFF0F0F81FF4849
              B7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FFC4C4C4FFC4C4
              C4FFB9B9B9FFB5B5B5FFB0B0B0FFA9A9A9FFA4A4A4FFA4A4A4FFA7A7A7FFA7A7
              A7FFA6A6A6FF999999FF909090FF8F8F8FFF979797FF9C9C9CFFA0A0A0FFA6A6
              A6FFA8A8A8FFACACACFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00EBF0FFFFADB0CFFF303360FF20215EFF10105CFF191868FF0E105EFF0C0D
              5EFF12136EFF1E1E8AFF1E1C98FF100D99FF07039EFF0B06A5FF0B06A7FF0A05
              A6FF06039CFF110E9AFF1E1D9BFF19198BFF161785FF2E2D8BFFA3A2CCFFF2F2
              FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C9C9C9FFC9C9C9FFBEBEBEFFBABABAFFB7B7
              B7FFB3B3B3FFAEAEAEFFADADADFFACACACFFA8A8A8FFA4A4A4FF9C9C9CFF9393
              93FF939393FF999999FF9C9C9CFF9F9F9FFFA4A4A4FFA6A6A6FFABABABFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3E5FFFF4C4991FF1818
              72FF17167DFF0C1178FF0F1181FF070580FF110C8FFF18159AFF17179FFF1114
              9FFF0A0EA2FF050AA2FF0107A6FF0004A5FF050DAEFF050AACFF0003A5FF0107
              A6FF090CABFF0508A6FF0605A3FF38369AFFACACE8FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D0D0D0FFC9C9C9FFC2C2C2FFBEBEBEFFBDBDBDFFBABABAFFB7B7B7FFB4B4
              B4FFB1B1B1FFACACACFFA6A6A6FF999999FF929292FF939393FF9B9B9BFF9F9F
              9FFFA1A1A1FFA6A6A6FFA9A9A9FFAAAAAAFFC8C8C8FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00B7B9E9FF2B2870FF22227CFF19187FFF141980FF0F11
              81FF100E89FF191497FF19169BFF0D0D95FF070A95FF090DA1FF0B10A8FF040A
              A9FF0008A9FF020AABFF0409ABFF0005A7FF0005A4FF070AA9FF0B0EACFF0D0C
              AAFF121074FF53538FFFCED2FBFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3C3C3FFC1C1
              C1FFBFBFBFFFBEBEBEFFBBBBBBFFB8B8B8FFB6B6B6FFB4B4B4FFB0B0B0FFACAC
              ACFF979797FF909090FF929292FF9C9C9CFF9F9F9FFFA2A2A2FFA7A7A7FFACAC
              ACFFABABABFFBCBCBCFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007A74
              C5FF261B95FF0F0692FF0B0B95FF101999FF091292FF13169DFF10119DFF0E0F
              9FFF0E0EA2FF0A0DA5FF0709A4FF0407A9FF0508AAFF0409ABFF0005A7FF020A
              A4FF060FA6FF030E9EFF010E9AFF000E96FF010B94FF11139DFF150E99FF888E
              DBFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00BEBEBEFFC1C1C1FFBEBEBEFFBDBDBDFFBBBB
              BBFFB8B8B8FFB6B6B6FFB5B5B5FFB2B2B2FFAEAEAEFF9A9A9AFF919191FF9292
              92FF9B9B9BFF9E9E9EFF9F9F9FFFA4A4A4FFA9A9A9FFADADADFFB4B4B4FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005852A3FF180D87FF160D99FF1010
              9AFF0D1696FF0A1393FF11149BFF10119DFF0D0E9EFF0C0CA0FF0A0DA5FF0B0D
              A8FF0508AAFF0104A6FF0308AAFF0308AAFF050DA7FF040DA4FF000B9BFF010E
              9AFF06149CFF0B159EFF12149EFF140D98FF444A97FFDBE3FFFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00BFBFBFFFC3C3C3FFBDBDBDFFBEBEBEFFBDBDBDFFBBBBBBFFB9B9B9FFB6B6
              B6FFB2B2B2FFAEAEAEFF9B9B9BFF909090FF8F8F8FFF989898FF9D9D9DFF9F9F
              9FFFA4A4A4FFA9A9A9FFADADADFFB2B2B2FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF004339A3FF18089BFF1509AFFF1612B7FF000A98FF030F9DFF0806
              A6FF0C0AAAFF0B09A9FF0503A3FF0505A5FF0C0CACFF0C0CACFF0606A6FF0909
              A9FF0706AAFF0605A9FF0603ACFF0A07B0FF0B08B1FF0A05AEFF0500ACFF0200
              AFFF0704B4FF161E83FFBFC7FCFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3C3C3FFC5C5C5FFBFBF
              BFFFC0C0C0FFC0C0C0FFBDBDBDFFBABABAFFB7B7B7FFB3B3B3FFAFAFAFFF9D9D
              9DFF8F8F8FFF8C8C8CFF969696FF9C9C9CFF9E9E9EFFA4A4A4FFA9A9A9FFACAC
              ACFFB2B2B2FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D9D6FF294B41ABFF2414
              A7FF1206ACFF0501A6FF0A16A4FF010D9BFF0A08A8FF0806A6FF0A08A8FF0E0C
              ACFF0A0AAAFF0505A5FF0505A5FF0A0AAAFF0808A8FF0807ABFF0807ABFF0805
              AEFF0906AFFF0603ACFF0904ADFF0E08B5FF0906B6FF0401B1FF131B80FFACB4
              E9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C6C6C6FFC4C4C4FFC1C1C1FFC1C1C1FFC0C0C0FFBCBC
              BCFFB9B9B9FFB7B7B7FFB5B5B5FFB2B2B2FFA3A3A3FF939393FF8D8D8DFF9595
              95FF9A9A9AFF9C9C9CFFA1A1A1FFA5A5A5FFAAAAAAFFB2B2B2FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF005A52AFFF1C0FA1FF180CC2FF0304B8FF0010
              A6FF0010A6FF0608ACFF0608ACFF0308AAFF0308AAFF0109AAFF020AABFF0009
              ADFF0007B0FF0206B2FF0206B2FF0207B0FF0507ACFF0509A8FF080AA5FF080C
              A0FF080CA0FF0001B3FF0002B4FF0F1984FF949FD9FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5
              C5FFC2C2C2FFC1C1C1FFC2C2C2FFC0C0C0FFBEBEBEFFBBBBBBFFB9B9B9FFB5B5
              B5FFB1B1B1FFADADADFF929292FF8B8B8BFF959595FF969696FF9A9A9AFFA2A2
              A2FFA5A5A5FFACACACFFB2B2B2FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF007870CDFF271AACFF1105BBFF0708BCFF000FA5FF0015ABFF080AAEFF0709
              ADFF0409ABFF0308AAFF0109AAFF0109AAFF0007ABFF0004ADFF0206B2FF0206
              B2FF0207B0FF0608ADFF060AA9FF080AA5FF080CA0FF080CA0FF0004B6FF0000
              B1FF0C1681FF939ED8FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5C5C5FFC2C2C2FFC2C2C2FFC2C2
              C2FFC1C1C1FFBEBEBEFFBBBBBBFFB9B9B9FFB6B6B6FFB2B2B2FFAFAFAFFF9A9A
              9AFF8A8A8AFF949494FF959595FF9A9A9AFFA1A1A1FFA4A4A4FFA9A9A9FFB0B0
              B0FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ACAAF0FF272295FF1D13
              BAFF1309D1FF0804D9FF0703D8FF0505B5FF070BA6FF060E9DFF060E9DFF0910
              9DFF0A119EFF0B07ACFF0A05AEFF0D06AFFF0E07B0FF0C0EA2FF0C0EA2FF090D
              A2FF0809A7FF0700B5FF0700B5FF0504AEFF0409A2FF111879FFB0B4EEFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C6C6C6FFC3C3C3FFC3C3C3FFC3C3C3FFC1C1C1FFBEBEBEFFBCBC
              BCFFBABABAFFB7B7B7FFB4B4B4FFB1B1B1FFA4A4A4FF898989FF919191FF9494
              94FF999999FF9F9F9FFFA3A3A3FFA6A6A6FFAEAEAEFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00DAD8FFFF4F4ABDFF2319C0FF1309D1FF0D09DEFF0000
              CEFF0808B8FF080CA7FF060E9DFF070F9EFF0B129FFF0B129FFF0C08ADFF0B06
              AFFF0D06AFFF0D06AFFF0B0DA1FF0B0DA1FF090DA2FF0809A7FF0700B5FF0600
              B4FF0706B0FF090EA7FF212889FFD1D5FFFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C6FFC3C3
              C3FFC4C4C4FFC4C4C4FFC2C2C2FFBFBFBFFFBDBDBDFFBBBBBBFFB9B9B9FFB6B6
              B6FFB1B1B1FFACACACFF8B8B8BFF8E8E8EFF929292FF999999FF9E9E9EFFA3A3
              A3FFA5A5A5FFAEAEAEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00A4A6E6FF3837A5FF2218B8FF210DDCFF1F0FDEFF0B11B8FF060CB3FF0306
              AFFF0605AFFF0808AEFF0B08ABFF0A0AA4FF0909A3FF0A0AA4FF0A09A7FF0908
              ABFF0908ABFF0509A8FF0409A4FF010B9FFF000D99FF13139DFF19118DFF595B
              A9FFE3E3FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C7C7C7FFC4C4C4FFC5C5C5FFC5C5C5FFC3C3
              C3FFBFBFBFFFBEBEBEFFBCBCBCFFBABABAFFB7B7B7FFB0B0B0FFB0B0B0FF9292
              92FF8B8B8BFF909090FF979797FF9C9C9CFFA4A4A4FFA6A6A6FFADADADFFD4D4
              D4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D5FFFF8281EFFF3A30
              D0FF1501D0FF2212E1FF1016BDFF070DB4FF0205AEFF0504AEFF0707ADFF0B08
              ABFF0B0BA5FF0B0BA5FF0A0AA4FF0A09A7FF0807AAFF0807AAFF0509A8FF0409
              A4FF020CA0FF010E9AFF0B0B95FF1F1793FF989AE8FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C7C7C7FFC5C5C5FFC4C4C4FFC5C5C5FFC3C3C3FFC0C0C0FFBEBEBEFFBDBD
              BDFFBBBBBBFFB7B7B7FFB1B1B1FFB1B1B1FF9E9E9EFF8A8A8AFF8E8E8EFF9696
              96FF9A9A9AFFA3A3A3FFA6A6A6FFACACACFFCDCDCDFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00EBF9F5FFDEE9FFFF8C8FCCFF47469CFF27209FFF1D18
              CFFF120DC4FF0704B8FF0502B6FF0508B1FF0509AEFF010DA9FF020EAAFF000A
              A8FF0007AEFF0005B4FF0404B4FF0406B2FF0607ABFF050AA7FF080F9CFF1C1D
              7FFF6663A1FFD5D5FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C8C8FFC5C5C5FFC4C4
              C4FFC4C4C4FFC3C3C3FFC1C1C1FFBFBFBFFFBEBEBEFFBBBBBBFFB7B7B7FFB4B4
              B4FFB1B1B1FFADADADFF8B8B8BFF8D8D8DFF939393FF989898FFA0A0A0FFA3A3
              A3FFA8A8A8FFC6C6C6FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ECFA
              F6FFE5F0FFFFDCDFFFFFB0AFFFFF625BDAFF2A25DCFF1D18CFFF0E0BBFFF0906
              BAFF0609B2FF0307ACFF000AA6FF000BA7FF000BA9FF0008AFFF0005B4FF0404
              B4FF0406B2FF0708ACFF070CA9FF0A119EFF343597FFB2AFEDFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C8C8C8FFC5C5C5FFC3C3C3FFC4C4C4FFC3C3C3FFC1C1
              C1FFC0C0C0FFBEBEBEFFBBBBBBFFB7B7B7FFB6B6B6FFB2B2B2FFB8B8B8FF8C8C
              8CFF8D8D8DFF929292FF969696FF9F9F9FFFA1A1A1FFA5A5A5FFC1C1C1FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00E4EBFFFFA8B4D6FF696DB4FF302B98FF1C12A4FF170BB7FF0805AFFF0006
              A3FF040CA5FF020BA2FF030CA3FF0404ACFF0F06B0FF1005A7FF1C0FA1FF1711
              8EFF2A2881FFB2B4DDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
              C6FFC5C5C5FFC4C4C4FFC4C4C4FFC4C4C4FFC3C3C3FFC1C1C1FFBEBEBEFFBCBC
              BCFFBABABAFFB2B2B2FFB3B3B3FFAFAFAFFF9E9E9EFF8C8C8CFF8B8B8BFF9696
              96FF9B9B9BFF9F9F9FFFA3A3A3FFB8B8B8FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00B1ACFFFF5E54E6FF1F13BFFF0A07B1FF060DAAFF030BA4FF0811A8FF0B14
              ABFF0808B0FF1007B1FF0D02A4FF180B9D33FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4C4C4FFC5C5C5FFC5C5C5FFC5C5
              C5FFC4C4C4FFC3C3C3FFC1C1C1FFBFBFBFFFBCBCBCFFBBBBBBFFB7B7B7FFB4B4
              B4FFB1B1B1FFA5A5A5FF919191FF888888FF8E8E8EFF979797FF9D9D9DFFA2A2
              A2FFB4B4B4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAC7
              D5FF737FA9FF38418AFF22208AFF19148DFF1B168FFF29258CFF393483FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C1C1C1FFC6C6C6FFC6C6C6FFC6C6C6FFC4C4C4FFC3C3C3FFC1C1
              C1FFBFBFBFFFBDBDBDFFBDBDBDFFBCBCBCFFB4B4B4FFB3B3B3FFAEAEAEFF9A9A
              9AFF888888FF898989FF919191FF989898FF9F9F9FFFADADADFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3CCFFFFA4A2
              FFFF9B96FFFF9C97FFFFAEAAFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBFBFFFC7C7
              C7FFC7C7C7FFC6C6C6FFC5C5C5FFC3C3C3FFC1C1C1FFC0C0C0FFBFBFBFFFBEBE
              BEFFBCBCBCFFB4B4B4FFB4B4B4FFB3B3B3FFA3A3A3FF919191FF8C8C8CFF8E8E
              8EFF949494FF9C9C9CFFA5A5A5FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00CFCFCFFFBDBDBDFFC6C6C6FFC8C8C8FFC7C7C7FFC5C5
              C5FFC3C3C3FFC2C2C2FFC0C0C0FFC0C0C0FFC0C0C0FFBDBDBDFFB6B6B6FFB5B5
              B5FFB5B5B5FFABABABFF9E9E9EFF959595FF8F8F8FFF939393FF9A9A9AFFA1A1
              A1FFD4D4D4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F4FEF1FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFBF
              BFFFBCBCBCFFC4C4C4FFC9C9C9FFC8C8C8FFC6C6C6FFC4C4C4FFC2C2C2FFC1C1
              C1FFC1C1C1FFC0C0C0FFBFBFBFFFB9B9B9FFB8B8B8FFB7B7B7FFB1B1B1FFA9A9
              A9FFA0A0A0FF959595FF979797FF9A9A9AFFA0A0A0FFC4C4C4FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00AEB2CBFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8B8B8FFBEBEBEFFC3C3C3FFC9C9
              C9FFC8C8C8FFC7C7C7FFC5C5C5FFC3C3C3FFC2C2C2FFC1C1C1FFC1C1C1FFC1C1
              C1FFBBBBBBFFBABABAFFB9B9B9FFB5B5B5FFAFAFAFFFA8A8A8FFA0A0A0FF9E9E
              9EFF9D9D9DFFA4A4A4FFB8B8B8FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00D7D9D901BEBCC8FFA9A4B9FF7B7495FF50496AFF333050FF2320
              40FF1B1F38FF0A0F24FF1E2539FF4A5263FFBAB9B5FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00B7B7B7FFC2C2C2FFC4C4C4FFC9C9C9FFC8C8C8FFC7C7C7FFC6C6
              C6FFC4C4C4FFC3C3C3FFC1C1C1FFC1C1C1FFC2C2C2FFBBBBBBFFBABABAFFBCBC
              BCFFB7B7B7FFB1B1B1FFADADADFFAAAAAAFFA4A4A4FF9F9F9FFFA7A7A7FFB1B1
              B1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00CAD5F5FF9EABC3FF768091FF5E6576FF4B485EFF2B2544FF1509
              39FF10003FFF0A0045FF090147FF050741FF02063BFF010736FF010736FF0003
              36FF000134FF060F41FF414A7CFFA9AFEAFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBDFFC6C6
              C6FFC5C5C5FFC3C3C3FFC6C6C6FFC5C5C5FFC0C0C0FFBDBDBDFFBEBEBEFFBEBE
              BEFFBCBCBCFFBEBEBEFFBBBBBBFFBABABAFFBDBDBDFFBDBDBDFFB7B7B7FFB1B1
              B1FFAEAEAEFFA8A8A8FFA2A2A2FFA8A8A8FFB6B6B6FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00D7D6DF294C497AFF0F1141FF000A2AFF000A
              22FF020C1DFF070E1FFF0F0C22FF0F0928FF110535FF150444FF070042FF0600
              44FF01033DFF000439FF010736FF040A39FF070A3DFF070A3DFF030C3EFF0003
              35FF040A45FF444581FFCDD6DFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C1C1C1FFC6C6C6FFC5C5C5FFC0C0C0FFC0C0
              C0FFBBBBBBFFB3B3B3FFACACACFFAAAAAAFFACACACFFADADADFFACACACFFB0B0
              B0FFB1B1B1FFB2B2B2FFB8B8B8FFBFBFBFFFBBBBBBFFB2B2B2FFAEAEAEFFACAC
              ACFFADADADFFAFAFAFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00DCD8FC01483B97FF201387FF01007AFF000078FF000060FF00004FFF0102
              3FFF020340FF01023FFF00003DFF000245FF00014CFF00024FFF000057FF0000
              62FF00006DFF00007EFF01007FFF070381FF17148FFF16118AFF272192FFB0B4
              E7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C8C8C8FFC6C6C6FFC6C6C6FFC4C4C4FFBABABAFFABABABFF9E9E9EFF9494
              94FF8C8C8CFF888888FF878787FF8B8B8BFF929292FF989898FF9B9B9BFFA5A5
              A5FFB3B3B3FFB8B8B8FFB6B6B6FFB5B5B5FFB4B4B4FFB7B7B7FFB9B9B9FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004A3D99FF2B1E
              92FF1E1A97FF0D0986FF010062FF000050FF040542FF050643FF050643FF0708
              45FF040A4DFF050B56FF07115EFF0D136CFF12147AFF181588FF1C129AFF1D13
              9BFF130F8DFF1A1792FF1A158EFF1F198AFFA2A6D9FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3D3D303C8C8C8FFC5C5
              C5FFB9B9B9FFADADADFFA3A3A3FFA3A3A3FFA6A6A6FFA6A6A6FFA4A4A4FFA2A2
              A2FFA8A8A8FFA1A1A1FF979797FF919191FF909090FF989898FFA9A9A9FFB9B9
              B9FFBEBEBEFFB7B7B7FFB8B8B8FFBEBEBEFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF005941C3FF2A18B9FF100FBDFF0B0AB8FF0807
              ABFF05029EFF010097FF040096FF09009DFF0F04A6FF1009AEFF1009AEFF0E0C
              ACFF0F0DADFF0C0CACFF0A09ADFF0B06AFFF0B05B2FF120CBDFF0A04B5FF0C07
              B0FF140BA8FF8286D9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00CACACAFFC3C3C3FFBDBDBDFFB5B5B5FFB1B1
              B1FFB4B4B4FFB8B8B8FFB6B6B6FFB3B3B3FFB1B1B1FFB4B4B4FFB2B2B2FFB0B0
              B0FFAEAEAEFFA8A8A8FFA1A1A1FFA0A0A0FFA3A3A3FFB2B2B2FFBABABAFFC1C1
              C1FFBEBEBEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF006F57D9FF2614B5FF0A09B7FF1312C0FF1817BBFF1411ADFF0E0BA4FF140C
              A6FF160DAAFF1409ABFF0E07ACFF0D06ABFF0A08A8FF0B09A9FF0909A9FF0908
              ACFF0C07B0FF0F09B6FF0701B2FF0B05B6FF0D08B1FF1209A6FF6E72C5FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CECECEFFC0C0C0FFB0B0B0FFB3B3B3FFB7B7B7FFBABABAFFBABABAFFB8B8
              B8FFB8B8B8FFBABABAFFB9B9B9FFB9B9B9FFB5B5B5FFAFAFAFFFB1B1B1FFB7B7
              B7FFB5B5B5FFAEAEAEFFA5A5A5FFADADADFFBBBBBBFFC4C4C4FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00857BE6FF1408A8FF040B
              C0FF080FC4FF0A10C1FF0709BBFF0508B7FF0B09B9FF0906B9FF0401B4FF0B0B
              BBFF0909B9FF080AB6FF070AB2FF0309AEFF0107ACFF0108ABFF040BAEFF0007
              AEFF060EB5FF070BB0FF0400A6FF434BA9FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4D4D403C0C0C0FFBBBB
              BBFFC0C0C0FFC4C4C4FFC3C3C3FFC0C0C0FFBFBFBFFFC0C0C0FFC0C0C0FFBBBB
              BBFFBFBFBFFFBFBFBFFFBDBDBDFFBFBFBFFFC3C3C3FFBEBEBEFFB5B5B5FFB2B2
              B2FFA4A4A4FFA6A6A6FFBABABAFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF009E94FFFF2014B4FF070EC3FF050CC1FF080EBFFF0D0F
              C1FF090CBBFF0604B4FF0502B5FF0906B9FF0404B4FF0404B4FF0608B4FF080B
              B3FF060CB1FF0309AEFF030AADFF050CAFFF0810B7FF0005ACFF0509AEFF0F0B
              B1FF2F3795FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C2C2C2FFC2C2C2FFC3C3C3FFC1C1C1FFBFBF
              BFFFC0C0C0FFC2C2C2FFC0C0C0FFBCBCBCFFBEBEBEFFBEBEBEFFBFBFBFFFC0C0
              C0FFBDBDBDFFBBBBBBFFBFBFBFFFC5C5C5FFBEBEBEFFB9B9B9FFB2B2B2FFA4A4
              A4FFC1C1C1FFCCCCCCFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAB8
              FEFF201D98FF0807C8FF0F0ECFFF0606C4FF080AC3FF0A0EC1FF0209B4FF040B
              AEFF030CAAFF050DA7FF050DA7FF080CABFF080AAEFF060AAFFF0609B2FF0507
              B3FF0507B3FF010DA9FF010DA9FF0008A6FF0C10AFFF141E89FFCAD3FFFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00BABABAFFC6C6C6FFC9C9C9FFC9C9C9FFC5C5C5FFC2C2C2FFC0C0C0FFC0C0
              C0FFBEBEBEFFBEBEBEFFBEBEBEFFBDBDBDFFBCBCBCFFBCBCBCFFBFBFBFFFC0C0
              C0FFBFBFBFFFC1C1C1FFBDBDBDFFBCBCBCFFA9A9A9FFA3A3A3FF989898FFA0A0
              A0FFACACACFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8C6FFFF3431ACFF0807C8FF100F
              D0FF0E0ECCFF0C0EC7FF060ABDFF030AB5FF080FB2FF0009A7FF050DA7FF050D
              A7FF080CABFF080AAEFF060AAFFF0609B2FF0507B3FF0507B3FF0410ACFF000B
              A7FF0710AEFF090DACFF151F8AFF969FDEFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCBCBCFFBBBBBBFFC2C2
              C2FFC8C8C8FFCACACAFFC9C9C9FFC6C6C6FFC1C1C1FFBCBCBCFFB9B9B9FFB8B8
              B8FFB7B7B7FFB9B9B9FFBDBDBDFFC1C1C1FFC3C3C3FFC4C4C4FFC6C6C6FFBCBC
              BCFFBABABAFFB2B2B2FFB7B7B7FFB2B2B2FFAFAFAFFFACACACFFB5B5B5FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF005453B1FF100DC0FF110AC9FF100ACDFF120CCFFF0605
              C7FF0302C4FF080AC2FF0303B3FF0507B3FF0806B3FF0B06B5FF0B05B8FF0905
              B8FF0905B8FF0706B4FF0706B4FF0307B4FF0307B4FF080CB8FF0309B0FF0F11
              9FFF7074CDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C7C7C7FFB3B3B3FFB4B4B4FFB7B7B7FFBABABAFFBDBDBDFFBFBF
              BFFFBFBFBFFFBDBDBDFFBABABAFFBCBCBCFFB5B5B5FFB0B0B0FFB0B0B0FFB4B4
              B4FFB9B9B9FFC0C0C0FFC6C6C6FFC5C5C5FFC5C5C5FFC8C8C8FFC1C1C1FFBBBB
              BBFFB7B7B7FFBDBDBDFFBCBCBCFFB4B4B4FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006D6C
              CAFF1310C3FF0E07C6FF0B05C8FF100ACDFF0B0ACCFF0403C5FF0204BCFF0606
              B6FF0507B3FF0806B3FF0B06B5FF0B05B8FF0905B8FF0905B8FF0706B4FF0706
              B4FF0408B5FF0408B5FF0105B1FF060CB3FF0C0E9CFF4F53ACFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBDFFAFAF
              AFFFB6B6B6FFB3B3B3FFAEAEAEFFACACACFFACACACFFADADADFFADADADFFADAD
              ADFFA8A8A8FFA4A4A4FFA5A5A5FFABABABFFAFAFAFFFB1B1B1FFB8B8B8FFC1C1
              C1FFC5C5C5FFC6C6C6FFC8C8C8FFC9C9C9FFC9C9C9FFCBCBCBFFD3D3D3FFCFCF
              CFFFC8C8C8FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009B9ECBFF1514B0FF1412BFFF120F
              C2FF0D0EC4FF0D11C7FF0509BFFF0006AEFF050DAEFF060DAAFF090CAAFF0B09
              AFFF0B08B2FF0808B4FF0808B4FF040AAFFF040AAFFF0D0ABEFF0603B7FF0001
              B3FF0A0CBEFF0909B1FF1C10AAFFBBB7FFFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B5B5B5FFADADADFFAFAFAFFFAAAAAAFFA4A4
              A4FFA0A0A0FF9C9C9CFF989898FF949494FF919191FF969696FF939393FF9595
              95FF9A9A9AFFA0A0A0FFA8A8A8FFB7B7B7FFC6C6C6FFC8C8C8FFCFCFCFFFCFCF
              CFFFD8D8D8FFD9D9D9FFDADADAFFDEDEDEFFD8D8D8FFD4D4D4FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C3C6F3FF1312AEFF1614C1FF1714C7FF0C0DC3FF090DC3FF090D
              C3FF0009B1FF050DAEFF070EABFF0A0DABFF0C0AB0FF0C09B3FF0909B5FF0909
              B5FF050BB0FF050BB0FF0B08BCFF0906BAFF080ABCFF0406B8FF0B0BB3FF180C
              A6FF6F6BBDFFF5F3FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00A3A3A3FF999999FF999999FF949494FF8F8F8FFF8C8C8CFF898989FF8686
              86FF838383FF828282FF838383FF818181FF7F7F7FFF808080FF838383FF8B8B
              8BFF999999FFA7A7A7FFCBCBCBFFD4D4D4FFCDCDCDFFD8D8D8FFDDDDDDFFDEDE
              DEFFE4E4E4FFE7E7E7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003338
              BCFF1618BCFF1316BFFF0E10C9FF0308C9FF050ACBFF020AC2FF0105BBFF0307
              B9FF0808BAFF0A06BDFF0A06BDFF0808BAFF0809B7FF040EAFFF030DAEFF0709
              ADFF0C0DB5FF080FBAFF0002B5FF0B03C6FF1C08CDFF251B97FFB5ABF7FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BDBDBDFF969696FF8C8C8CFF8F8F
              8FFF8A8A8AFF868686FF868686FF878787FF888888FF8B8B8BFF8E8E8EFF8C8C
              8CFF909090FF959595FF989898FF979797FF949494FF929292FF919191FFA8A8
              A8FFABABABFF969696FFABABABFFC3C3C3FFCDCDCDFFD3D3D3FFDADADAFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006166EAFF1C1EC2FF0F12BBFF1618
              D1FF060BCCFF0409CAFF020AC2FF0003B9FF0408BAFF0808BAFF0A06BDFF0B07
              BEFF0909BBFF0809B7FF040EAFFF040EAFFF0A0CB0FF0A0BB3FF0007B2FF0307
              BAFF0D05C8FF0900BAFF221894FF534995FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00AFAFAFFF9A9A9AFF979797FF989898FF969696FF959595FF9898
              98FF9A9A9AFF9B9B9BFF9D9D9DFFA0A0A0FFA3A3A3FFA3A3A3FFA1A1A1FF9F9F
              9FFFA0A0A0FFA3A3A3FFA3A3A3FFA1A1A1FF9A9A9AFFA9A9A9FF999999FFACAC
              ACFFBDBDBDFFBEBEBEFFC7C7C7FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF009CAFF3FF2429A4FF200ED3FF1A09D6FF1507D7FF1006D5FF0309
              B6FF050BB8FF0408BAFF0408BAFF030CB0FF070CAEFF070DACFF0B0EADFF0B04
              BFFF0B04BFFF0606BEFF0607BBFF070DB2FF060CB1FF060AB7FF0A09B7FF0A0A
              B2FF110BACFF5C5FCBFFD2DBFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A6ABA9FFA29E
              B1FF9F9BAEFF9F9BA6FFA09FA1FFA5A69CFFA7A89EFFA6A8A2FFA8A9A7FFA7A8
              ACFFA8A9ADFFA8A8A8FFACACACFFADADADFFACACACFFACACACFFADADADFFADAD
              ADFFABABABFFADADADFFB9B9B9FFA9A9A9FFB4B4B4FFBFBFBFFFC5C5C5FFCFCF
              CFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BED1FFFF3F44
              BFFF1907CCFF2110DDFF1204D4FF1208D7FF060CB9FF070DBAFF0408BAFF0408
              BAFF040DB1FF080DAFFF080EADFF0B0EADFF0B04BFFF0B04BFFF0606BEFF0607
              BBFF070DB2FF060CB1FF060AB7FF0A09B7FF0A0AB2FF110BACFF1E218DFF6069
              ACFFD4E4F4FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00A7ACAAFFABA7BAFFA7A3B6FFABA7B2FFADAC
              AEFFB1B2A8FFB3B4AAFFB3B5AFFFB3B4B2FFB0B1B5FFAFB0B4FFB4B4B4FFB6B6
              B6FFB7B7B7FFB6B6B6FFB4B4B4FFB3B3B3FFB7B7B7FFBBBBBBFFBEBEBEFFC8C8
              C8FFB9B9B9FFBDBDBDFFC3C3C3FFCCCCCCFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008691CFFF2614BBFF2317CDFF1314
              D0FF1116D1FF050EC3FF0001B6FF0307BDFF0607BDFF0B0EACFF0B0EACFF0A09
              B7FF0607BDFF0306BFFF0205BEFF040DB0FF040DB0FF0509BCFF0509BCFF0409
              B8FF040BB6FF050BB0FF0C0DABFF110FA9FF1E18A7FF5958C0FFD1D3FFFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00B4B5B3FFB7B8B4FFB4B5B1FFB8B2BDFFB7B1BCFFB5B0B9FFB7B3B8FFB8BB
              B2FFBCBFB6FFBBC0BFFFBDC2C1FFC4C4C4FFC3C3C3FFC3C3C3FFC5C5C5FFC7C7
              C7FFC6C6C6FFC7C7C7FFC8C8C8FFCFCFCFFFD7D7D7FFC6C6C6FFC0C0C0FFC6C6
              C6FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C5D0FFFF3E2CD3FF160AC0FF191AD6FF0E13CEFF0B14C9FF0008
              BDFF0307BDFF0607BDFF0B0EACFF0C0FADFF0B0AB8FF0607BDFF0306BFFF0205
              BEFF040DB0FF040DB0FF0509BCFF0509BCFF0409B8FF040BB6FF060CB1FF0C0D
              ABFF1A18B2FF120C9BFF1D1C84FF6264ABFFCDD5F3FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEBFBDFFC1C2BEFFC0C1
              BDFFC3BDC8FFC1BBC6FFC0BBC4FFBFBBC0FFC0C3BAFFC5C8BFFFC7CCCBFFCACF
              CEFFCCCCCCFFD1D1D1FFD7D7D7FFDADADAFFDDDDDDFFDFDFDFFFE1E1E1FFE1E1
              E1FFDCDCDCFFD9D9D9FFC8C8C8FFC0C0C0FFD0D0D0FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008383
              D1FF2824ABFF1F14E6FF0D0ADBFF060ED3FF000DC1FF0410AEFF0710AEFF0C09
              B9FF0C07BCFF0807BBFF0408BBFF000BB8FF000CB6FF060BB4FF060BB4FF050B
              B8FF050BB8FF040BB8FF030AB7FF030BB6FF060AB6FF0401B4FF0C06B9FF190F
              BDFF1206ACFF322FAAFFAEB5FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00CED0C4FFCACDBEFFC6C9BAFFC9C4C6FFCBC4CBFFCBC7
              CDFFCCC8CEFFCBCCC8FFCDCECAFFCFD1D2FFD2D4D5FFDEDEDEFFE7E7E7FFEBEB
              EBFFE5E5E5FFE1E1E1FFE5E5E5FFEBEBEBFFEDEDEDFFE7E7E7FFCECECEFFC1C1
              C1FFCCCCCCFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6FFFF4945CCFF1308DAFF1411
              E2FF0C14D9FF0009BDFF0511AFFF0710AEFF0C09B9FF0B06BBFF0807BBFF0408
              BBFF000BB8FF000CB6FF060BB4FF060BB4FF050BB8FF050BB8FF040BB8FF040B
              B8FF030BB6FF060AB6FF0D0ABDFF100ABDFF1208B6FF0F03A9FF201D98FF3239
              89FF879CBBFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CBCEBFFFCFD2C3FFCFCACCFFD0C9D0FFD0CCD2FFD2CED4FFD4D5D1FFD9DA
              D6FFDCDEDFFFE0E2E3FFDFDFDFFFDCDCDCFFD5D5D5FFD2D2D2FFD9D9D9FFE5E5
              E5FFEAEAEAFFE8E8E8FFEAEAEAFFC3C3C3FFC4C4C4FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF008D98C4FF301FC7FF1C14D3FF1D19E4FF120ED9FF0612
              B0FF0511AFFF0707BFFF0606BEFF0409B8FF040BB6FF000EB4FF000EB4FF0A05
              BEFF0A05BEFF070AB9FF070AB9FF050BB8FF050BB8FF030BB6FF030BB6FF0005
              B2FF0709BBFF0D06CBFF1208CDFF0700B7FF0E0CA6FF1E299BFF4F63B0FFD1D1
              FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CED1CFFFD8D6D5FFD6D6
              D0FFD5D5CFFFD5D6CCFFD6D7CDFFD6D7D5FFD6D4DAFFD7D1DCFFD5CFDAFFBABA
              BAFFB0B0B0FFADADADFFBEBEBEFFD7D7D7FFE9E9E9FFEFEFEFFFEEEEEEFFE1E1
              E1FFC6C6C6FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAE5
              FFFF6A59FFFF1911D0FF1410DBFF1915E0FF0612B0FF0511AFFF0707BFFF0505
              BDFF0308B7FF040BB6FF000EB4FF010FB5FF0A05BEFF0A05BEFF070AB9FF070A
              B9FF050BB8FF050BB8FF040CB7FF030BB6FF0209B6FF0709BBFF0A03C8FF0300
              BEFF1008C0FF1513ADFF0B1688FF1A2E7BFF4D4D93FFB8BAE3FFE5F2FAFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00CBC9C8FFD4D4CEFFD3D3CDFFD3D4CAFFD2D3
              C9FFCBCCCAFFBCBAC0FFAAA4AFFF9B95A0FFA1A1A1FF9E9E9EFFAAAAAAFFC4C4
              C4FFD9D9D9FFE1E1E1FFE8E8E8FFF0F0F0FFD7D7D7FFD3D3D3FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8F6EBFFD7DBFEFF4947A0FF3224
              C0FF2216CEFF130CD1FF0D0BCFFF0002BBFF0209BEFF0209BCFF0005B4FF0D11
              BDFF0B0BB7FF0E0AB7FF0E0AB7FF0B04C3FF0A03C2FF0607BBFF0609B8FF040B
              B4FF040BB4FF0306BCFF0507C0FF0706C0FF0605BFFF0607B5FF0708B6FF0806
              BDFF0C07BEFF120AABFF3632AFFF9195E8FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00BDBDC3FFCCCCCCFFC5C8BFFFC7CBBFFFBDC1B5FFA2A39FFF979196FF958C
              96FF8D848EFF868686FF848484FF9D9D9DFFB3B3B3FFC8C8C8FFD8D8D8FFEBEB
              EBFFE5E5E5FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00E6F4E9FFEAEEFFFFBDBBFFFF392BC7FF1F13CBFF1D16DBFF0503
              C7FF060BC4FF0A11C6FF0108BBFF0308B7FF060AB6FF0606B2FF0E0AB7FF0E0A
              B7FF0B04C3FF0B04C3FF0708BCFF0609B8FF040BB4FF030AB3FF0407BDFF0507
              C0FF0706C0FF0605BFFF0809B7FF090AB8FF0B09C0FF0F0AC1FF1B13B4FF120E
              8BFF24287BFF8890BFFFDAE5F9FFEAF0FDFFDEDFEDFFB0B0B6FFB3B3B3FFADB0
              A7FFA6AA9EFF979B8FFF868783FF8F898EFF978E98FF8F8690FF818181FF8888
              88FF919191FFA1A1A1FFB5B5B5FFD0D0D0FFDDDDDDFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00BABEE1FF4D4BA4FF3228BAFF2418D6FF0900D2FF0000C9FF0807
              C3FF0708BCFF0905B8FF1412C0FF0C0CB2FF0C0CB2FF0B0BB7FF0B08BCFF0907
              BFFF0803C4FF0602C5FF0501C4FF0708C4FF0509BCFF040BB4FF040BB4FF0509
              B5FF0607BBFF0701CAFF0C02CBFF0B03C2FF160DB8FF2012B0FF24188EFF625D
              A8FFE0DCFFFFB5B8BDFF9F9DA3FF9D9AA3FF9C99A2FF94949AFF85858BFF8385
              7FFF999691FFA39F9AFF969190FF878787FF979797FF9B9B9BFFAAAAAAFFBABA
              BAFFD3D3D3FFDBDBDBFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A8A6
              FFFF362CBEFF2A1EDCFF170EE0FF0900D2FF0706C2FF0809BDFF0B07BAFF0B09
              B7FF0B0BB1FF0C0CB2FF0B0BB7FF0C09BDFF0A08C0FF0904C5FF0602C5FF0602
              C5FF0708C4FF060ABDFF050CB5FF050CB5FF070BB7FF0607BBFF0600C9FF0B01
              CAFF1109C8FF1910BBFF1709A7FF20148AFF332E79FF8480A3FF72757AFF8B89
              8FFF85828BFF88858EFF84848AFF7B7B81FF80827CFF989590FFA09C97FF928D
              8CFF979797FFA4A4A4FFAFAFAFFFBEBEBEFFC8C8C8FFD5D5D5FFDFDFDFFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BCC2EDFF48469FFF3226
              BAFF261CC3FF0701B2FF0E0CBCFF080BBAFF0D10BFFF0608BAFF0608BAFF070E
              B1FF070EB1FF060ABCFF0606C4FF0603CBFF0502CAFF0507BFFF0409B8FF050C
              B7FF080FBAFF0A0BC1FF090AC0FF090ABEFF0A0DBCFF0F0EA4FF191799FF211C
              8FFF4B4597FF74719FFF868190FF94918DFF898682FF817C85FF817A87FF7676
              84FF727280FF7A7F7DFF92948EFF9FA097FF9D9E95FFB0B0B0FFB3B3B3FFC4C4
              C4FFCBCBCBFFD1D1D1FFDADADAFFE4E4E4FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00BDBBFFFF5347DBFF2A20C7FF251FD0FF0604
              B4FF0104B3FF080BBAFF0709BBFF0709BBFF070EB1FF070EB1FF0509BBFF0606
              C4FF0603CBFF0603CBFF0608C0FF050AB9FF060DB8FF080FBAFF0809BFFF0506
              BCFF0506BAFF080BBAFF1514AAFF2A28AAFF5651C4FF706ABCFF817EACFF8782
              91FF85827EFF807D79FF837E87FF817A87FF7A7A88FF7E7E8CFF8B908EFFA0A2
              9CFFB1B2A9FFBABBB2FFC4C4C4FFC7C7C7FFD9D9D9FFD8D8D8FFDEDEDEFFE5E5
              E5FFE4E4E4FFC3C3C3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00F5FFF6FFD6E5EEFF6B79AAFF2019B0FF1A18C6FF040CC3FF0005C0FF0408
              C5FF0307C4FF0308C1FF0209BEFF040DB4FF040DB4FF050EB5FF050DB8FF0607
              C3FF0506C2FF0608C1FF0709C2FF060BB4FF0207B0FF040AB1FF090FB6FF232F
              8FFF606EA2FF7D8EA1FF87988BFF7E8A6EFF8A8D73FF958F84FF938A87FF827B
              80FF827E83FF83868AFF919498FFA3A8ABFFB1B6B9FFBEC4BFFFCDCECAFFD4D4
              D4FFD7D7D7FFE0E0E0FFE2E2E2FFE4E4E4FFE5E5E5FFDCDCDCFFC8C8C8FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2FDF3FFE6F5FEFFDBE9
              FFFF8881FFFF2725D3FF0810C7FF0007C2FF060AC7FF0509C6FF0308C1FF0209
              BEFF030CB3FF030CB3FF040DB4FF040CB7FF0506C2FF0506C2FF0709C2FF080A
              C3FF080DB6FF070CB5FF0C12B9FF141AC1FF6571D1FF7987BBFF7E8FA2FF8293
              86FF97A387FF91947AFF938D82FF8E8582FF90898EFF938F94FF979A9EFFAAAD
              B1FFBFC4C7FFCED3D6FFD9DFDAFFE7E8E4FFEAEAEAFFEAEAEAFFE4E4E4FFEBEB
              EBFFE7E7E7FFE2E2E2FFDEDEDEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B2ADE4FF5E56
              97FF3A2599FF1B0DB9FF0A04C7FF0807D3FF0002CDFF0007CCFF0009C9FF040B
              C6FF0409BCFF0C11B4FF060BAEFF0800CCFF0A00CEFF0D06C1FF1614AAFF1E2B
              8DFF6975ABFF969597FF959496FF979698FF99989AFF969597FF908F91FF8F8E
              90FF929193FF9B9A9CFFA4A3A5FFB5B4B6FFCAC9CBFFDCDBDDFFE5E4E6FFE3E2
              E4FFDEDDDFFFDCDCDCFFDFDFDFFFE5E5E5FFEEEEEEFFE5E5E5FFDEDEDEFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00F3EEFFFFD1C9FFFF806BDFFF180AB6FF110B
              CEFF0000C9FF0509D4FF0001C6FF0007C7FF0007C2FF0409BCFF070CAFFF0A0F
              B2FF0A00CEFF0C02D0FF0E07C2FF1513A9FF4F5CBEFF7D89BFFF9D9C9EFF9A99
              9BFF9A999BFF9B9A9CFF99989AFF979698FF99989AFF9E9D9FFFC8C7C9FFCECD
              CFFFD9D8DAFFE8E7E9FFEAE9EBFFD6D5D7FFB0AFB1FF939294FFBBBBBBFFCBCB
              CBFFD3D3D3FFCECECEFFBFBFBFFFC4C4C4FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00F5F7FFFFDFE1FFFFA4AED6FF3E4888FF1C2097FF0F0BB0FF0600
              C3FF0201C3FF0D0FCCFF0509BFFF040DB4FF0710B7FF0703CEFF0D04D0FF120E
              A3FF363897FF8C98B0FF9BA0A9FFA2A1A3FF9F9EA0FF9E9D9FFF9E9D9FFF9E9D
              9FFF9D9C9EFFA1A0A2FFA6A5A7FFCAC9CBFFD6D5D7FFDCDBDDFFCDCCCEFFB2B1
              B3FF9F9EA0FF9F9EA0FFA6A5A7FF9E9E9EFFA9A9A9FFAAAAAAFFA6A6A6FF9E9E
              9EFFA8A8A8FFCECECEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2F4
              FFFFDCE6FFFFB6C0FFFF484CC3FF110DB2FF0E08CBFF0A09CBFF0305C2FF0206
              BCFF0811B8FF040DB4FF0602CDFF0D04D0FF120EA3FF6668C7FF929EB6FF9CA1
              AAFFA5A4A6FFA4A3A5FFA4A3A5FFA5A4A6FFA4A3A5FFA2A1A3FFA3A2A4FFA6A5
              A7FFADACAEFFABAAACFFA9A8AAFFA9A8AAFFABAAACFFABAAACFFA9A8AAFFA6A5
              A7FFACACACFFA8A8A8FFA4A4A4FFACACACFFADADADFFAEAEAEFFBBBBBBFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F2FEECFFFBFFF0FFF3F9E8FFCFD8
              ECFF8082C3FF2D2D99FF1C14AEFF1009B8FF0F0CC6FF0407C7FF0205C5FF0205
              BEFF0A0CBEFF313A91FF9AA5BBFFB4AAA3FFB5ABA4FFABABABFFAAAAAAFFAAAA
              AAFFABABABFFAAAAAAFFA8A8A8FFA7A7A7FFA8A8A8FFADADADFFAAAAAAFFA7A7
              A7FFA6A6A6FFA7A7A7FFAAAAAAFFAEAEAEFFB0B0B0FFAFAFAFFFAEAEAEFFADAD
              ADFFB3B3B3FFB4B4B4FFAEAEAEFFAEAEAEFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FDFFF2FFFFFFF4FFF1FAFFFFD5D7FFFF9393FFFF2D25
              BFFF120BBAFF0F0CC6FF0104C4FF0609C9FF0205BEFF090BBDFF555EB5FFA1AC
              C2FFBDB3ACFFBBB1AAFFAFAFAFFFAEAEAEFFADADADFFACACACFFACACACFFACAC
              ACFFADADADFFAEAEAEFFAFAFAFFFB0B0B0FFB1B1B1FFB2B2B2FFB2B2B2FFB0B0
              B0FFADADADFFABABABFFB2B2B2FFB6B6B6FFB6B6B6FFB2B2B2FFB5B5B5FFB6B6
              B6FFB5B5B5FFD1D1D1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFF5
              FBFFFFFFFF00FFFFFF00FFFFFF00E5ECFFFFAEAFEBFF4747ABFF1D17A4FF0F0C
              C0FF0F0CC0FF0A0BB9FF0E13B5FF758EB0FFA8B0BDFFC7B2B5FFC6B1B4FFB2B2
              B2FFB2B2B2FFB0B0B0FFB0B0B0FFB1B1B1FFB2B2B2FFB3B3B3FFB4B4B4FFAEAE
              AEFFB1B1B1FFB4B4B4FFB3B3B3FFB0B0B0FFB1B1B1FFB5B5B5FFBABABAFFB5B5
              B5FFB6B6B6FFB7B7B7FFB1B1B1FFB8B8B8FFBCBCBCFFBDBDBDFFC1C1C1FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00B3B3FFFF4A44D1FF1512C6FF0A07BBFF0D0EBCFF151A
              BCFF859EC0FFB4BCC9FFC6B1B4FFCAB5B8FFB6B6B6FFB6B6B6FFB7B7B7FFB7B7
              B7FFB8B8B8FFB9B9B9FFB8B8B8FFB7B7B7FFBCBCBCFFBABABAFFB8B8B8FFB8B8
              B8FFBABABAFFBBBBBBFFB9B9B9FFB7B7B7FFB9B9B9FFB9B9B9FFBFBFBFFFBEBE
              BEFFC1C1C1FFBCBCBCFFC1C1C1FFBEBEBEFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CDD2F9FF5559A8FF25289BFF110FA5FF3230C6FF97A4DCFFB0BCC8FFC4BC
              B5FFC3BBB4FFBBBBBBFFBCBCBCFFBCBCBCFFBDBDBDFFBDBDBDFFBEBEBEFFBEBE
              BEFFBEBEBEFFBEBEBEFFBEBEBEFFBEBEBEFFBDBDBDFFBDBDBDFFBDBDBDFFBEBE
              BEFFBEBEBEFFC0C0C0FFBFBFBFFFC3C3C3FFBFBFBFFFBFBFBFFFC4C4C4FFC2C2
              C2FFC3C3C3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7BBFFFF3D40
              B3FF2826BCFF3634CAFFA3B0E8FFBECAD6FFC0B8B1FFCEC6BFFFC1C1C1FFC1C1
              C1FFC2C2C2FFC2C2C2FFC2C2C2FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3C3FFC3C3
              C3FFC3C3C3FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC3C3C3FFC3C3C3FFC2C2
              C2FFC6C6C6FFC2C2C2FFC3C3C3FFC8C8C8FFC5C5C5FFC6C6C6FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BAC1E8FF292886FF5150AEFFAEB9
              E5FFB3C1CDFFC8D2C2FFC5CABBFFC6C6C6FFC6C6C6FFC7C7C7FFC7C7C7FFC7C7
              C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC7C7C7FFC6C6C6FFC6C6
              C6FFC6C6C6FFC6C6C6FFC7C7C7FFC6C6C6FFC5C5C5FFC9C9C9FFC6C6C6FFC7C7
              C7FFCBCBCBFFC8C8C8FFC8C8C8FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF006B6AC8FF3C3B99FFAEB9E5FFBCCAD6FFC2CCBCFFCFD4
              C5FFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCBCBFFCBCB
              CBFFCBCBCBFFCBCBCBFFCACACAFFCACACAFFCACACAFFCACACAFFCACACAFFCACA
              CAFFCBCBCBFFC9C9C9FFCDCDCDFFCCCCCCFFCDCDCDFFD0D0D0FFCDCDCDFFCECE
              CEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BABB
              E1FF55567CFFBDC3DAFFBAC3D1FFCACFD0FFCED0D1FFD1D0D2FFD1D0D2FFD1D0
              D2FFD1D0D2FFD1D0D2FFD1D0D2FFD1D0D2FFD0CFD1FFD1D0D2FFD0CFD1FFD0CF
              D1FFD0CFD1FFCFCED0FFD0CFD1FFD0CFD1FFD0CFD1FFD2D2D2FFCFCFCFFFD3D3
              D3FFD2D2D2FFD2D2D2FFD5D5D5FFD3D3D3FFD7D7D701FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005F6086FFB1B7CEFFC6CF
              DDFFCED3D4FFD2D4D5FFD5D4D6FFD5D4D6FFD5D4D6FFD5D4D6FFD5D4D6FFD5D4
              D6FFD5D4D6FFD5D4D6FFD5D4D6FFD5D4D6FFD4D3D5FFD4D3D5FFD4D3D5FFD4D3
              D5FFD4D3D5FFD4D3D5FFD5D5D5FFD3D3D3FFD7D7D7FFD5D5D5FFD5D5D5FFD8D8
              D8FFD9D9D9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00716C8BFF9893B3FFD0CBEBFFDBD4E9FFD9D5E1FFDAD9
              DBFFDAD9DBFFDAD9DBFFDAD9DBFFDAD9DBFFDAD9DBFFDAD9DBFFDAD9DBFFDAD9
              DBFFD9D8DAFFD9D8DAFFD9D8DAFFD9D8DAFFD9D8DAFFD9D8DAFFD9D8DAFFDADA
              DAFFD8D8D8FFDCDCDCFFD9D9D9FFD8D8D8FFDBDBDBFFDEDEDEFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00A29D
              BCFF605B7BFFDED9F9FFD8D1E6FFE4E0ECFFDFDEE0FFDFDEE0FFDFDEE0FFDFDE
              E0FFDFDEE0FFDFDEE0FFE0DFE1FFE0DFE1FFDFDEE0FFDFDEE0FFDFDEE0FFDEDD
              DFFFDEDDDFFFDEDDDFFFDEDDDFFFDEDDDFFFE0E0E0FFDEDEDEFFE2E2E2FFDFDF
              DFFFDDDDDDFFE0E0E0FFE6E6E6FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AAA3CEFF332075FFBCADFFFFCEDA
              E6FFD8E9E5FFE1E5DAFFE3E2D8FFE6DEE9FFEBDFEBFFE9DEE6FFE8E0E0FFE6E6
              DAFFE1E5D9FFE0E7E0FFD6DFDCFFD4DFDCFFD9E4E1FFDDE7DBFFDFE5DAFFE5E2
              DDFFE4E0DFFFDFE1E1FFE3E5E5FFE9E3E4FFE8E2E3FFE8E1E8FFE3E1E7FFE5EE
              F1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00B4ADD8FF332075FF695AAEFFD4E0ECFFD9EAE6FFE4E8DDFFEDEC
              E2FFEAE2EDFFE9DDE9FFEDE2EAFFEDE5E5FFE6E6DAFFE2E6DAFFE0E7E0FFDDE6
              E3FFDFEAE7FFE0EBE8FFE0EADEFFE2E8DDFFEAE7E2FFE8E4E3FFE9EBEBFFDDDF
              DFFFE9E3E4FFF1EBECFFF1EAF1FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0CDF4FFAFACD3FF7D7B
              98FFD3D1E5FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B0ADDFFF2716
              7FFF2E2089FFA0A5E4FFD7E7FFFFE2EFDFFFE8EDDEFFE7E9E3FFEDEAE5FFF2ED
              E4FFF2EDE4FFF0EBE8FFF2E9F3FFE9DEF8FFE9DEF8FFECE3F7FFEAE4EFFFE8E5
              E0FFEEE8E3FFF6EAEAFFF4E8E8FFE4EBE6FFE5ECE7FFF9F2F7FFEFE8EDFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00BCBDD7FF717092FF39365DFF19163DFF171532FF49475BFFD0D1DBFFF3F2
              F4FFF4F9EAFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00ADAADCFF1B0A73FF1E1079FF494E8DFFB8C8
              E5FFE4F1E1FFEBF0E1FFECEEE8FFEFECE7FFF1ECE3FFF6F1E8FFF3EEEBFFEAE1
              EBFFF1E6FFFFEDE2FCFFEEE5F9FFF0EAF5FFF1EEE9FFF6F0EBFFFBEFEFFFF8EC
              ECFFEDF4EFFFE7EEE9FFF1EAEFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00BBBADCFF73729EFF312D61FF0C0745FF050041FF0E09
              4EFF060146FF060042FF11064AFF3A3072FFCEC1FFFFF6FFFFFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF008E8DCBFF150784FF130985FF0A0C78FF4B56A8FFD2D3FFFFE0E1FFFFECED
              FFFFF0F2FFFFE9F1E7FFEEF2E6FFF4FAE9FFF5F6E6FFF4EFF0FFF0EBECFFF3F1
              E9FFF8F8ECFFF7F7E5FFF8F4E2FFFBF0ECFFFAEBF3FFD9E5F7FFE2EDFFFFE9E4
              FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00E6F4F2FFD3DFE5FFAFB9C0FF767D8CFF383953FF1211
              33FF0C0B37FF141044FF06013FFF0D0649FF00003DFF0E094EFF0E074AFF0E03
              47FF0A0042FF281B59FFBFC8CCFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF005D5C9AFF140683FF1309
              85FF0A0C78FF081365FF585996FFBABBE1FFE8E9FFFFE8EAFCFFF5FDF3FFFDFF
              F5FFF1F7E6FFF6F7E7FFF8F3F4FFF5F0F1FFF8F6EEFFF8F8ECFFF5F5E3FFFAF6
              E4FFFFF7F3FFFFF6FEFFE9F5FFFFDFEAFFFFC1BCD7FFE0D2EEFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9C6F7FF7570
              ADFF403B78FF16104BFF0E0843FF100A45FF0E0645FF070345FF040248FF0604
              50FF040752FF00004AFF000550FF000247FF010748FF000843FF070B46FF2A29
              6DFFB8B3F8FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00E1E5FFFF35347CFF0B007EFF070381FF090D83FF070D7EFF1213
              83FF2F2E96FF8C8BEDFFD8DAFFFFDAE1FFFFDCE8FFFFEEFFFEFFEAF8F6FFEFFD
              F9FFF0FEFAFFF1FEFCFFEDF9FBFFE9F5F9FFECF4FFFFE9EFFFFFDFDBFFFFC7CF
              FFFF828AE8FF4F4A99FFB4AEDDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0087899BFF393858FF0C093AFF080340FF0C0744FF120C47FF100A
              45FF0A043FFF0C0443FF0B0749FF07054BFF02004CFF000048FF040954FF0002
              4DFF000041FF040A4BFF020A45FF040843FF0B0A4EFF2D286DFFC9CDE9FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00ADB1D4FF1F1E
              66FF180B8BFF0E0A88FF05097FFF020879FF080979FF1C1B83FF242385FF4446
              94FF8F96C7FFCBD7EFFFDFF2EFFFEAF8F6FFE6F4F0FFECFAF6FFEFFCFAFFECF8
              FAFFEAF6FAFFE7EFFFFFCED4EBFFACA8DCFF474FADFF272F8DFF2D2877FFC3BD
              ECFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004E508AFF0800
              70FF000064FF0C0A46FF0C0A46FF0B054CFF090050FF080055FF090056FF0500
              55FF000052FF000751FF00044EFF00024DFF000052FF00005EFF00016DFF0209
              7CFF0B0D91FF1911ACFF2514B1FF8785D7FFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF006A679FFF201D6DFF0D0478FF161688FF0205
              71FF060E79FF000783FF010495FF1109BAFF160ABCFF160BBBFF2D1FCBFF4F4C
              D7FF706FF5FF9491FFFF9895FFFF9993FFFF8E85FFFF706BFFFF4E47E4FF2D28
              C7FF1814BAFF1716CAFF0403B7FF292A9CFFC0C2FFFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF007577B1FF23198BFF07006FFF05033FFF0604
              40FF080249FF0B0252FF0A0157FF0A0157FF050055FF000054FF00014BFF0005
              4FFF000F5AFF061669FF0C1A7AFF121C88FF192093FF1F21A5FF1E16B1FF200F
              ACFF504EA0FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B4B2
              D6FF39366EFF292676FF20178BFF030375FF0F127EFF020A75FF000581FF0001
              92FF1008B9FF1A0EC0FF180DBDFF1B0DB9FF1C19A4FF2221A7FF19169BFF1C19
              9EFF1F19A6FF2118AEFF1C17B0FF1A13B0FF1611B0FF120EB4FF0E0DC1FF0C0B
              BFFF3132A4FFCACCFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF009A9DE8FF2E21B9FF1609A1FF00006DFF01005FFF000059FF000054FF0000
              4DFF00004DFF00005DFF010177FF050692FF0703A8FF0A05BEFF1007CCFF1108
              D4FF1007D3FF0D07D0FF0D07D0FF0C03D5FF0C03D5FF1E1CA4FFAAACFFFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00D0CEF2FF575387FF302C73FF272178FF231F
              84FF1B1B7FFF080C6BFF101876FF00177AFF000F82FF0307B3FF0A03D0FF0800
              DBFF0A02DDFF0608C5FF0609C2FF0F12C8FF0D10C6FF0908CEFF0704CFFF0305
              CFFF0406D0FF0108CFFF0108CFFF0000D5FF1005DEFF4044B5FFD3DEFFFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E7F4FFFFB7BAFFFF3629C1FF2D20
              B8FF0F0B7CFF080666FF00005AFF020359FF060A5BFF0C1061FF131875FF1A1A
              90FF1718A4FF1511B6FF120DC6FF130ACFFF1007D3FF0F06D2FF0C06CFFF0D07
              D0FF0A01D3FF0F06D8FF201EA6FF6466BEFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00747296FF312D61FF312D74FF2B257CFF242085FF1F1F83FF171B7AFF1119
              77FF01187BFF001386FF090DB9FF0F08D5FF0B03DEFF0C04DFFF0A0CC9FF0C0F
              C8FF080BC1FF080BC1FF0807CDFF0906D1FF0709D3FF080AD4FF030AD1FF030A
              D1FF0704DCFF0E03DCFF5D61D2FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00EFF8FFFFD6D8FFFF5D51C1FF3123BFFF1513C1FF0402B0FF0000
              A3FF0300AAFF130EB7FF1813BCFF140FBEFF0E0AC1FF0E09C8FF0A07CEFF0706
              D2FF0602D7FF0401D9FF0601DEFF0803E0FF0904E1FF0008DEFF0006D4FF100F
              CBFF2926B7FFB2B0FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007676A4FF22205BFF2A2671FF2722
              77FF282581FF272883FF1E1D7DFF27288AFF191781FF071389FF020BA2FF0B0C
              C8FF0B08D9FF0102DCFF0001DBFF0009C9FF000CC8FF0713CDFF0B12CDFF090D
              D0FF080BD2FF0409D0FF0409D0FF010AD0FF020BD1FF1410D4FF1501C5FF8A98
              C9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FCFFF6FFEBF4FDFFE6E8
              FFFF9185F5FF2D1FBBFF2422D0FF1A18C6FF1411BBFF1512BCFF1914BDFF1712
              BBFF110CBBFF0C08BFFF0E09C8FF0C09D0FF0908D4FF0804D9FF0603DBFF0702
              DFFF0601DEFF0500DDFF0008DEFF0009D7FF0C0BC7FF1E1BACFF6967C1FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00656785FF131341FF181651FF201C67FF272277FF211E7AFF272883FF2B2A
              8AFF1E1F81FF292791FF121E94FF0710A7FF0A0BC7FF0704D5FF0000DAFF0405
              DFFF040FCFFF0713CFFF020EC8FF060DC8FF060ACDFF0508CFFF0207CEFF0308
              CFFF020BD1FF040DD3FF0F0BCFFF1905C9FFAAB8E9FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CBBFFFFF473ABAFF0D16
              DBFF0C14DDFF0B12DBFF0909D7FF0503D1FF0402D0FF0807D3FF0D0CD8FF0004
              CEFF0309CEFF010CCCFF010CCCFF030DCCFF050FCEFF0710CCFF050ECAFF0010
              CBFF0012D1FF080ED3FF1505CEFF3127A9FFBBADFFFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00A7A7C5FF33315FFF13144CFF121357FF1515
              61FF13146CFF171872FF1B1B79FF232381FF252486FF26228BFF2B209EFF1717
              A7FF0D0DB5FF0F0BCEFF0C08D6FF0306DAFF0508DCFF0007D0FF0005CEFF0508
              D5FF0907D5FF0D08D5FF0F0AD7FF100DD4FF100DD4FF0D0AD5FF0C09D4FF1C0D
              C2FF4537BBFFD3E6DDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00E3D7FF01675ADAFF131CE1FF1018E1FF0B12DBFF0A0A
              D8FF0B09D7FF0C0AD8FF0B0AD6FF0908D4FF060AD4FF060CD1FF000BCBFF0008
              C8FF0009C8FF020CCBFF050ECAFF040DC9FF0014CFFF000BCAFF0E14D9FF0F00
              C8FF271D9FFF6456A8FFCBCED3FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B8BABAFF5959
              69FF191937FF110F3DFF0E0F47FF06074BFF0F0F5BFF070860FF191A74FF1616
              74FF161674FF1E1D7FFF2A268FFF241997FF1818A8FF0E0EB6FF0F0BCEFF0B07
              D5FF0003D7FF0508DCFF040CD5FF050DD6FF080BD8FF0907D5FF0B06D3FF0B06
              D3FF0D0AD1FF0D0AD1FF0906D1FF0603CEFF2415CAFF685ADEFFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CACCCDFF0F0DE3FF1715EBFF0E18D0FF0711C9FF050ECFFF050CD5FF0209
              D5FF030AD6FF0009D3FF0009D3FF0008D2FF0107D2FF030BCAFF080BCBFF0C0A
              CEFF0D0BCFFF100ED2FF0705C9FF0807CDFF1110D6FF0E0FCBFF0B0BB3FF1A1E
              A5FF3A3DA5FF8C92D5FFB3B7DAFFD0D6E3FFD8D9E7FFD4D2E5FFCDC7E6FFBDB1
              E3FFAB9FD1FF555E8AFF2E3763FF0E104AFF0A0648FF100450FF0D014DFF0C01
              4AFF11074DFF110F4BFF0D0E4AFF0C1051FF0E1663FF0F1677FF0B1686FF1419
              9AFF161EAEFF0018B0FF0112BFFF0107D6FF0507D7FF0509D3FF0A0BD1FF0A0C
              CFFF0A0CCFFF0B09D7FF0402D0FF0D10D6FF0003C9FF090ED5FF0308CFFF0007
              D0FF0108D1FF2A287AFFBABBEDFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003432FFFF1A18
              EEFF0D17CFFF111BD3FF0009CAFF0007D0FF0209D5FF0108D4FF0009D3FF0009
              D3FF0009D3FF0208D3FF040CCBFF090CCCFF0C0ACEFF0D0BCFFF0A08CCFF100E
              D2FF0D0CD2FF0706CCFF0B0CC8FF1616BEFF10149BFF070A72FF01074AFF171B
              3EFF2A303DFF373846FF3B394CFF332D4CFF1F1345FF0D0133FF040D39FF0004
              30FF000036FF040042FF0F034FFF0F034FFF0E034CFF10064CFF070541FF1112
              4EFF101455FF020A57FF040B6CFF121D8DFF1E23A4FF131BABFF0119B1FF0112
              BFFF0107D6FF0507D7FF0509D3FF090AD0FF0A0CCFFF0A0CCFFF0B09D7FF0705
              D3FF0508CEFF0D10D6FF0005CCFF0A0FD6FF060DD6FF030AD3FF5553A5FFD0D1
              FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0093A8ECFF303EBCFF2315E9FF150FE2FF030A
              D5FF000BCCFF0012C7FF0116CBFF0004DBFF0204DBFF0705DBFF0706D8FF0708
              D4FF0708D4FF0509D3FF060AD4FF0604D2FF0B08DAFF0908DAFF0605D7FF0B0A
              D6FF1312D3FF110FBFFF0A08A1FF000078FF000066FF020353FF070743FF0407
              34FF00062BFF030B29FF08102EFF00013BFF030240FF070442FF060341FF0401
              3FFF04013FFF02033DFF01023CFF010643FF00054EFF00025CFF000077FF0808
              9AFF1510BFFF180ED3FF0B05D6FF0206DBFF0206DBFF030CCDFF070CCDFF0906
              D8FF0906D8FF070AD1FF070AD1FF050CD5FF0106D3FF0202DEFF0505E1FF0507
              C9FF0B0BC9FF1111CFFF0F08C3FF999DCEFFEBEDFFFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C3D8FFFF5A68E6FF1F11E5FF140EE1FF0910DBFF0009CAFF0011C6FF0010
              C5FF0005DCFF0305DCFF0705DBFF0807D9FF0809D5FF0809D5FF060AD4FF060A
              D4FF0B09D7FF0906D8FF0706D8FF0807D9FF0706D2FF0605C6FF0F0DBDFF1D1B
              B4FF151492FF0D0C73FF030454FF040440FF060936FF050B30FF070F2DFF0A12
              30FF070842FF070644FF070442FF03003EFF02003DFF050240FF060741FF0506
              40FF030845FF00024BFF000761FF13148CFF1D1DAFFF1914C3FF140ACFFF0D07
              D8FF0307DCFF0307DCFF030CCDFF070CCDFF0906D8FF0906D8FF070AD1FF070A
              D1FF030AD3FF0409D6FF0505E1FF0000DBFF0B0DCFFF0808C6FF0C0CCAFF2A23
              DEFFCBCFFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B9D1DDFF403E
              B9FF2C1FDFFF100BEAFF0002E0FF0113D2FF0007C6FF020AD3FF0508D5FF0C05
              DCFF0C05DCFF0A0BD1FF060CD1FF0108D9FF0107DCFF0A05DCFF0A05DCFF0405
              D9FF0304D8FF0206D7FF050AD7FF0509D4FF0507CAFF0D0CC8FF0A06B3FF0000
              98FF00007EFF000068FF000057FF000348FF000240FF00003AFF00003AFF0000
              3DFF000046FF00014BFF00004FFF000054FF00005DFF000069FF020885FF1017
              A4FF151AB7FF1216C3FF0E10CDFF0D0CD2FF0807D9FF0305E0FF0305E0FF0608
              D8FF0A07D8FF0A07D8FF0906D7FF0508D5FF0209D5FF000ACEFF0313D7FF0007
              D1FF0A0ED9FF100CD0FF180CC2FF1F17B7FF8784E7FFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008886FFFF3225E5FF120DECFF0407
              E5FF0012D1FF0010CFFF030BD4FF0609D6FF0C05DCFF0C05DCFF0A0BD1FF060C
              D1FF0108D9FF0107DCFF0803DAFF0904DBFF0506DAFF0506DAFF060ADBFF090E
              DBFF090DD8FF080ACDFF0F0ECAFF1814C1FF1715AFFF100C93FF020774FF0006
              5FFF000A4FFF000B49FF070844FF040541FF020542FF05054BFF01024CFF0000
              4FFF000159FF02076AFF0D1481FF181E9BFF1D24B1FF171CB9FF0E12BFFF0B0D
              CAFF0C0BD1FF0605D7FF0305E0FF0305E0FF0608D8FF0A07D8FF0A07D8FF0A07
              D8FF0609D6FF030AD6FF000CD0FF000ED2FF0008D2FF070BD6FF110DD1FF1408
              BEFF4139D9FFC4C1FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00D7E3FB016D70C5FF362DD7FF160BDDFF0300DFFF0A05EAFF040D
              CEFF040DCEFF050CCDFF050CCDFF030CCEFF030AD1FF0309D8FF0309D8FF0C09
              DAFF0906D7FF0509D4FF070CD3FF010ACFFF0005CAFF0006CCFF000AD4FF0207
              D4FF0606D4FF0707CFFF0B0ACBFF0E0DC1FF0A0AB2FF00009DFF000087FF0300
              7FFF00007CFF00007FFF00008AFF000093FF0100A0FF0802B3FF0F09C6FF130E
              D5FF0C08D6FF0805D7FF0B08DAFF070AD7FF0509D3FF010ACBFF020BCCFF030B
              D4FF030AD6FF0806DBFF0C06DBFF0C0DCDFF0C0DCDFF040DCFFF010CD2FF000B
              D6FF0008D3FF000DD5FF0507C9FF1A14C1FF342FA8FF9AA0D5FFEEF3FCFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BEC1
              FFFF554CF6FF1F14E6FF0800E4FF0601E6FF040DCEFF040DCEFF050CCDFF040B
              CCFF020BCDFF030AD1FF0309D8FF0309D8FF0A07D8FF0906D7FF0509D4FF060B
              D2FF040DD2FF040DD2FF020DD3FF020CD6FF060BD8FF0808D6FF0909D1FF0C0B
              CCFF100FC3FF1313BBFF1316B4FF191CADFF1E199AFF1E199AFF1F1A9FFF1E19
              AAFF1F1AB3FF1C16BBFF140EBFFF0F09C6FF100BD2FF0B07D5FF0805D7FF0805
              D7FF0508D5FF0509D3FF030CCDFF030CCDFF030BD4FF030AD6FF0806DBFF0C06
              DBFF0C0DCDFF0D0ECEFF050ED0FF020DD3FF0008D3FF000ED9FF000AD2FF0C0E
              D0FF140EBBFF5F5AD3FFD8DEFFFFF2F7FFFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9CCF8FF5C57C0FF200B
              C5FF1C0DDAFF0C06D9FF0307D8FF000FCDFF000ECCFF0005DEFF0405DFFF0C0B
              D1FF0F0ED4FF0B0DD0FF0A0CCFFF080CCFFF080CCFFF060CCFFF060CCFFF030C
              D1FF030BD4FF010BD5FF0109D8FF0308D9FF0607D9FF0807D9FF0C06D9FF0C06
              D9FF0F06D9FF1207D9FF1208D6FF100AD3FF0D0BD3FF0A0BD1FF060CD1FF0309
              D4FF0307D7FF0206DAFF0205DCFF0305DFFF0305DFFF0407DBFF0509D9FF040B
              D2FF040BD2FF0206D6FF0509D9FF0B0DCFFF0A0CCEFF0C0FCFFF0C0FCFFF070F
              CEFF0810CFFF0807E6FF0000DEFF120FE0FF190EC8FF3A3D9FFFD0D9FAFFF5FF
              EBFFFDFFECFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00E6E9FFFFA7A2FFFF442FE9FF1708D5FF0D07DAFF0004
              D5FF0111CFFF0111CFFF0004DDFF0304DEFF0A09CFFF0D0CD2FF0B0DD0FF0A0C
              CFFF080CCFFF080CCFFF060CCFFF060CCFFF030CD1FF030BD4FF010BD5FF0109
              D8FF0308D9FF0607D9FF0807D9FF0C06D9FF0C06D9FF0F06D9FF1207D9FF1208
              D6FF100AD3FF0D0BD3FF0B0CD2FF060CD1FF040AD5FF0307D7FF0206DAFF0205
              DCFF0305DFFF0305DFFF0407DBFF0509D9FF040BD2FF040BD2FF090DDDFF060A
              DAFF0B0DCFFF0B0DCFFF0B0ECEFF0B0ECEFF050DCCFF050DCCFF0302E1FF0403
              E2FF0F0CDDFF1B10CAFF9C9FFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00ADAEE0FF4745AFFF160CBAFF1711E2FF0000E0FF0000DFFF0408
              DDFF070AD7FF140FDCFF0B08D0FF090ECFFF080DCEFF0A0AD2FF0A09D5FF0A07
              D9FF0A07D9FF0607D9FF0607D9FF030AD6FF030AD6FF030BD4FF030BD4FF040A
              D5FF0808D8FF0A07D8FF0A06DBFF0408DCFF0408DCFF040BD7FF040CD5FF020F
              CFFF010ECEFF000FCDFF000ECCFF000DCDFF000CD0FF030CD2FF030CD2FF050C
              D3FF050CD3FF060CD1FF060CD1FF060CD1FF0309CEFF0708D4FF0A0ADAFF0B08
              D9FF0B08D9FF0C09DAFF0D07D8FF0F0AD1FF2317CFFF2220A2FF8788DEFFE2EE
              FFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009290
              FAFF271DCBFF0C06D7FF0000DDFF0202E2FF0004D9FF0508D5FF110CD9FF0A07
              CFFF090ECFFF090ECFFF0A0AD2FF0A09D5FF0A07D9FF0A07D9FF0607D9FF0607
              D9FF040BD7FF040BD7FF040CD5FF040CD5FF050BD6FF0909D9FF0B08D9FF0B07
              DCFF0408DCFF0408DCFF040BD7FF040CD5FF020FCFFF010ECEFF000FCDFF000F
              CDFF000DCDFF010DD1FF030CD2FF030CD2FF050CD3FF050CD3FF060CD1FF060C
              D1FF090FD4FF070DD2FF0B0CD8FF0A0ADAFF0805D6FF0906D7FF0C09DAFF0D07
              D8FF0E09D0FF180CC4FF7573F5FFCDCEFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008088CBFF21229AFF1409
              C9FF1914DBFF0B0AD0FF090BD5FF0407CEFF0A10DBFF020CD6FF020AD9FF0608
              D8FF0A06DBFF0D05DBFF0D05DBFF0C06D9FF0C06D9FF0909D7FF050CD5FF040D
              D3FF040DD3FF040DD2FF070DD2FF090CD2FF090BD5FF040BD6FF040AD9FF040A
              D9FF040AD9FF0509DAFF0509DAFF0408D9FF0408D9FF0408D8FF0408D8FF0608
              D8FF0709D9FF0708DAFF0708DAFF0806DBFF0806DBFF0C12C9FF0C12C9FF0603
              E2FF0401E0FF0303D9FF0B0BD5FF1010CEFF1918B6FF222296FF686BB6FFD6E7
              F029FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C9D1FFFF7172EAFF190ECEFF0A05CCFF1413D9FF090B
              D5FF090CD3FF080ED9FF020CD6FF020AD9FF0709D9FF0A06DBFF0D05DBFF0D05
              DBFF0C06D9FF0C06D9FF0909D7FF050CD5FF040DD3FF040DD3FF040DD2FF070D
              D2FF090CD2FF090BD5FF040BD6FF040AD9FF040AD9FF040AD9FF0509DAFF0509
              DAFF0509DAFF0408D9FF0408D8FF0408D8FF0709D9FF0709D9FF0708DAFF0708
              DAFF0806DBFF0806DBFF060CC3FF080EC5FF0300DFFF0300DFFF0606DCFF0707
              D1FF0A0AC8FF1D1CBAFF6767DBFFCBCEFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D1EAE6FF646CB9FF2223A9FF1505DFFF0401D9FF0515CCFF000BC1FF0008
              E0FF0008E0FF0408DDFF0607D9FF0D08D5FF0D0AD2FF0D0AD1FF0E0BD2FF0B0C
              D2FF070BD5FF040CD5FF040BD7FF040BD7FF040BD7FF0509D9FF0909D9FF090B
              D5FF090BD5FF0B09D7FF0B09D7FF0B09D7FF0B09D7FF0D0AD5FF0D0CD2FF0A0C
              CEFF0A0CCEFF0B0DCFFF0B0CD2FF090AD6FF0909D9FF0606DCFF0606DCFF0D0A
              D5FF110ED9FF050AD7FF050AD7FF040CD1FF030BC3FF2339A9FF5D73B4FFCEEA
              EBFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E3FCF802C9D1FF0E6162
              E8FF0D00D7FF0704DCFF0414CBFF0013C9FF0008E0FF0008E0FF0408DDFF0607
              D9FF0D08D5FF0D0AD2FF0D0AD1FF0E0BD2FF0B0CD2FF070BD5FF040CD5FF040B
              D7FF040BD7FF040BD7FF0509D9FF0909D9FF090BD5FF090BD5FF0B09D7FF0B09
              D7FF0B09D7FF0B09D7FF0D0AD5FF0D0CD2FF0A0CCEFF0B0DCFFF0B0DCFFF0B0C
              D2FF090AD6FF0909D9FF0606DCFF0606DCFF0B08D3FF0F0CD7FF0308D5FF0207
              D4FF050DD2FF131BD3FF5C72E2FFC5DBFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D5E1F9FF7B81CEFF312EACFF1907
              CCFF190BCFFF180DCDFF1009C8FF0F08CDFF0F0CD4FF0D09D7FF0908DAFF0609
              DDFF0407DBFF0307D7FF060ADAFF080CD7FF0B0AD6FF0C09D4FF100AD5FF100A
              D5FF1306D6FF1407D9FF1407D9FF0F07D6FF0F07D6FF0E0AD5FF0C0CD6FF060A
              D4FF0407D4FF070CD9FF0307D8FF0206D7FF0307D8FF0307D8FF0307D8FF0408
              D8FF0B0BDBFF0C01D3FF1B08DBFF1C11C1FF2218A0FF4F49A8FFADA8DFFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00E4F0FFFFD0D6FFFF827FFDFF2D1BE0FF1507CBFF180DCDFF110A
              C9FF110ACFFF0F0CD4FF0A06D4FF0403D5FF0306DAFF0508DCFF0408D8FF060A
              DAFF080CD7FF0A09D5FF0C09D4FF110BD6FF110BD6FF1407D7FF1508DAFF1306
              D8FF0C04D3FF0D05D4FF0E0AD5FF0E0ED8FF0A0ED8FF0A0DDAFF0005D2FF060A
              DBFF090DDEFF070BDCFF0509DAFF070BDCFF0509D9FF0606D6FF1106D8FF1603
              D6FF1B10C0FF5C52DAFFBEB8FFFFF2EDFFFFFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5FFEFFFE8F8
              F7FFE1F1FFFFAEBDDEFF5259A8FF1916B2FF1812C3FF1914C9FF130FCCFF0C0A
              D2FF0C0DD9FF080DDAFF0006D2FF000BD3FF000DD1FF000ECEFF000DCDFF010D
              CFFF020DD3FF050CD7FF040BD6FF000CD0FF010FD3FF0514D5FF0514D5FF0110
              D0FF000CCCFF000BCBFF010ACFFF0008CEFF080DD4FF0D10D7FF0D0BD3FF0907
              CBFF0C05CAFF0F09CCFF150DCCFF222591FF505796FFA5B0E2FFE8F3FFFFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F1FFFFFFE4F4FFFFD9E8FFFFC7CE
              FFFF6360FCFF2C26D7FF0A05BAFF0F0BC8FF110FD7FF0607D3FF0106D3FF060F
              DBFF010ED6FF010FD3FF0110D0FF0110D0FF030FD1FF030ED4FF040BD6FF030A
              D5FF000BCFFF000BCFFF000CCDFF000CCDFF000CCCFF000CCCFF000FCFFF0811
              D6FF030CD2FF0308CFFF070AD1FF100ED6FF0F0DD1FF120BD0FF211BDEFF3830
              EFFF8F92FEFFC7CEFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00E8FFFFFFA9BFE3FF6271
              B0FF32379DFF1B1AA6FF1A10C1FF170CD4FF1107D6FF0E08D9FF0A07D8FF060A
              D4FF070BD5FF080CD7FF0709D9FF0606DCFF0505DBFF030DDCFF0009D8FF0006
              D9FF0508DFFF080AE5FF0A08E4FF0805DDFF0D03D9FF150CD1FF180FBDFF1A16
              ABFF22239BFF313790FF55609CFF91A1CFFFCEDDF7FFEBF9F8FFFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2E1FFFFADB2FFFF6968F4FF3127
              D8FF180DD5FF160CDBFF120CDDFF0C09DAFF0509D3FF060AD4FF070BD6FF080A
              DAFF0909DFFF0A0AE0FF0006D5FF0008D7FF0009DCFF0407DEFF0002DDFF0000
              DAFF0502DAFF1208DEFF1209CEFF2920CEFF4E4ADFFF7F80F8FFB3B9FFFFD7E2
              FF01FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3E1E7FFAAB8CEFF7B85B4FF4B51
              9AFF3E3FA1FF2F2EA2FF271FA8FF2218AAFF2015ABFF2116ACFF2317B1FF1F17
              B1FF221AB4FF2522AEFF2C2AA6FF2E319DFF3D429DFF5960A9FF737CB5FFAEB4
              E1FFC6CDEEFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CDD3FFFFB9BAFFFF9F9EFFFF8C84
              FFFF7D73FFFF756AFFFF7368FEFF7468FFFF746CFFFF766EFFFF817EFFFF9896
              FFFFACAFFFFFC0C5FFFFD4DBFFFFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00EFFAF8FFF0FB
              F9FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00}
            ShowHint = True
            Stretch = True
            Transparent = True
          end
          object sLabel41: TsLabel
            Left = 293
            Top = 35
            Width = 51
            Height = 13
            Caption = 'Font Size'
          end
          object sLabel42: TsLabel
            Left = 19
            Top = 16
            Width = 139
            Height = 13
            Caption = 'Select Font from System'
          end
          object sLabel43: TsLabel
            Left = 19
            Top = 59
            Width = 149
            Height = 13
            Caption = 'Select Font from Directory'
          end
          object img87: TImage
            Left = 210
            Top = 32
            Width = 80
            Height = 60
            Picture.Data = {
              0B54504E4747726170686963B6700000424DB670000000000000360000002800
              00005A0000005000000001002000000000008070000000000000000000000000
              000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C5D9C2344F8C46FF26711BFF699D62FFE6EFE517FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2E2D03654904CFF2D76
              23FF5B9453FFD3E3D135FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C1D6BE383A7F31C51C6B11FF1C6B11FF1C6B11FF5E9656E2E6EF
              E517FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7E5D52E4B8A
              42FF1C6B11FF1C6B11FF1C6B11FF4A8942FFDBE7D929FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00D2E1CF263D8034C11C6B11FF1C6B11FF1C6B11FF1C6B
              11FF1C6B11FF5E9656E2E7EFE617FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E5
              D62E4B8A42FF1C6B11FF1C6B11FF1C6B11FF1C6B11FF1C6B11FF54904CF6E9F0
              E815FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00D9E6D71E4A8942B31C6B11FF1C6B11FF1C6B
              11FF1D6A10FF1C6B11FF1C6B11FF1C6B11FF5D9555E5E5EEE41AFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D7E5D52E4A8942FF1C6B11FF1C6B11FF1C6A11FF1D6910FF1C6B11FF1C6B
              11FF1C6B11FF5F9757E8E7EFE617FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9DCC6304A8942B31C6B11FF1C6B
              11FF1C6B11FF1D6A10FF1D6B11FF1D6A11FF1C6B11FF1C6B11FF1C6B11FF5D95
              55E5E4EEE31AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00D0E0CE3945863CFF1C6B11FF1C6B11FF1C6B11FF1D6910FF1B6B
              12FF1D6A10FF1C6B11FF1C6B11FF1C6B11FF599351F0D9E6D72CFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4D9C1343C8033C31C6B
              11FF1C6B11FF1D6A10FF1F670EFF147919FF088D25FF177416FF1E670FFF1C6B
              11FF1C6B11FF1C6B11FF5F9757E2E8F0E714FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00DAE7D82B46863DFF1C6B11FF1C6B11FF1D6B10FF1F68
              0EFF147819FF078C27FF167317FF1E670FFF1D6B10FF1C6B11FF1C6B11FF4B8A
              42FFD8E5D62FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8DBC5303D80
              34C11C6B11FF1C6B11FF1C6A11FF1E680FFF157518FF03932BFF009D30FF078D
              25FF1A6D12FF1E680FFF1C6B11FF1C6B11FF1C6B11FF62995BDDE7EFE617FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00DAE7D82B4D8B44FC1C6B11FF1C6B11FF1C6B
              11FF1F670EFF177115FF04922AFF009B30FF059028FF177215FF1E670FFF1C6B
              11FF1C6B11FF1C6B11FF508D47FFE3ECE11DFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAE7
              D81E498941B51C6B11FF1C6B11FF1C6B11FF1F670FFF167617FF03932AFF0099
              2EFF00962CFF009A2FFF078B25FF1A6D13FF1E680FFF1C6B11FF1C6B11FF1C6B
              11FF62995BDDE9F0E814FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAE7D82B508D47F91C6B11FF1C6B
              11FF1C6B11FF1F660EFF187015FF059028FF00982DFF00962CFF00992EFF0590
              28FF187015FF1E670EFF1C6B11FF1C6B11FF1C6B11FF63995CDFEBF2EA12FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D5E4D3224E8C45B11C6B11FF1C6B11FF1C6B11FF1F680FFF177316FF0492
              29FF009A2EFF00962CFF00962CFF00962DFF009C30FF078D28FF197014FF1D68
              0FFF1C6B11FF1C6B11FF1C6B11FF619859DFE3EDE21DFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4E3D2344D8B44FC1C6B
              11FF1C6B11FF1C6A11FF1F680FFF177216FF059028FF009A2EFF00962CFF0096
              2CFF00972CFF009B2FFF078F29FF1A6F13FF1E670FFF1C6A11FF1C6B11FF1C6B
              11FF61985AE2E2ECE020FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C8DBC530418338BD1C6B11FF1C6B11FF1D6A10FF1F670EFF1674
              16FF03922AFF00992EFF00962CFF00962CFF00962CFF01972DFF01992FFF009D
              32FF06942BFF197316FF1F670DFF1C6B11FF1C6B11FF1C6B11FF5C9554E5EBF2
              EA11FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3E3D1344787
              3EFF1C6B11FF1C6B11FF1C6A11FF1E680FFF167517FF03932BFF009A2FFF0097
              2CFF00962CFF00962CFF00972DFF019A2EFF009E32FF06942CFF177215FF1F65
              0DFF1C6A11FF1C6B11FF1C6B11FF528E4AF9D8E5D62FFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00D6E4D422408236BF1C6B11FF1C6B11FF1C6A11FF1E68
              0FFF167417FF03922AFF009A2FFF00962CFF00962CFF00962CFF00972CFF0198
              2DFF019A2FFF029C30FF00A234FF08962DFF1A6F14FF1F650DFF1C6B11FF1C6B
              11FF1C6B11FF659B5ED7ECF3EB0EFFFFFF00FFFFFF00FFFFFF00FFFFFF00E6EF
              E517538F4BF41C6B11FF1C6B11FF1C6B11FF1D6910FF167416FF03932AFF009A
              2FFF00962CFF00962CFF00962CFF00962CFF01982EFF019A2FFF019B31FF00A2
              35FF07962DFF187215FF1E660EFF1C6B11FF1C6B11FF1C6B11FF4F8C46FFDDE9
              DC26FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007CAA76811C6B11FF1C6B11FF1C6B
              11FF1D680FFF157518FF03942BFF00992EFF00962CFF00962CFF00962CFF0096
              2CFF00982DFF019A2FFF029B31FF029C31FF029E32FF01A537FF0A932BFF1C6C
              13FF1E650DFF1C6B11FF1C6B11FF1C6B11FF669B5ED7EBF2EA11FFFFFF00FFFF
              FF00FFFFFF009BBE968A1C6B11FF1C6B11FF1C6B11FF1D6B10FF177215FF0491
              2AFF009A2FFF00952CFF00962CFF00962CFF00962CFF00972EFF01992EFF019A
              2FFF029C30FF039E32FF01A537FF07982EFF197215FF1E660EFF1C6B11FF1C6B
              11FF1C6B11FF5C9554EAEBF2EA12FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007AA974811C6B
              11FF1C6B11FF1C6B11FF1E680FFF157718FF02962CFF009A2FFF00962CFF0096
              2CFF00962DFF00962DFF01982EFF029A2FFF029B31FF029E32FF039E32FF02A1
              35FF01A839FF0B932CFF1B6C12FF1E650DFF1C6B11FF1C6B11FF1C6B11FF679C
              5FD7EAF1E911FFFFFF00FFFFFF009ABD958A1C6B11FF1C6B11FF1C6B11FF1D6A
              10FF177215FF03932BFF009B2FFF00962CFF00962CFF00962CFF00972DFF0198
              2EFF029A30FF029B31FF029D31FF039E32FF039F33FF01A73AFF099830FF1A6E
              14FF1D660EFF1C6B11FF1C6B11FF1C6B11FF699D62D6EAF1E912FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D7E5D520498941B51C6B11FF1C6B11FF1C6A11FF1E690FFF167517FF0590
              28FF00992EFF00962CFF00972DFF01982EFF029A2FFF029B31FF039D32FF039F
              33FF039F33FF04A035FF04A337FF03AA3BFF0B992FFF197216FF1D670EFF1C6B
              11FF1C6B11FF1C6B11FF619859DFE7EFE617FFFFFF00E7EFE617609758FF1C6B
              11FF1C6B11FF1C6B11FF1D6910FF167517FF059229FF009B2FFF00962CFF0198
              2DFF01992EFF019A2FFF029C31FF039D31FF039E32FF039F33FF04A135FF04A2
              37FF03A83BFF0B972FFF197215FF1E660DFF1C6B11FF1C6B11FF1C6B11FF6097
              58E5DDE9DC26FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00D4E3D2244A8942B31C6B11FF1C6B11FF1D6A
              10FF1F670EFF187215FF059028FF009A2EFF01992EFF019A2FFF029C31FF039E
              32FF039F33FF03A034FF04A135FF04A235FF05A337FF06A639FF03AD3DFF0A9E
              33FF197317FF1E670FFF1C6B11FF1C6B11FF1C6B11FF659B5ED7ECF3EB0EFFFF
              FF00DFEADD1B4F8C46C11C6B11FF1C6B11FF1C6A11FF1F670EFF167316FF0490
              29FF009A2FFF01992EFF019A30FF029C30FF029E32FF039E33FF03A034FF04A2
              34FF04A235FF05A337FF05A638FF05AC3CFF0A9C33FF1A7316FF1E660DFF1C6B
              11FF1C6B11FF1C6B11FF528E4AF9DBE7D929FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3E3D1244989
              41B51C6B11FF1C6B11FF1C6B11FF1E680FFF187416FF04942CFF009C31FF029A
              2FFF029C31FF039E33FF03A033FF04A134FF04A235FF04A337FF05A538FF06A6
              38FF06A83AFF05AE3FFF0D9B31FF1B6F13FF1D680FFF1C6B11FF1C6B11FF1C6B
              11FF6B9F64FFEDF3EC0BFFFFFF00D2E2D00A48873FFF1C6B11FF1C6B11FF1C6B
              11FF1E680FFF177316FF05932AFF009D30FF029B30FF029C31FF039E33FF039F
              33FF03A034FF04A135FF05A337FF05A638FF06A639FF06A83AFF05AD3EFF0B9E
              34FF197315FF1E650DFF1C6B11FF1C6B11FF1C6B11FF57914FF3E3ECE11DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00D3E3D12444853BBB1C6B11FF1C6B11FF1C6B11FF1E6910FF1678
              1AFF02992EFF00A033FF029D32FF039E33FF04A034FF04A235FF04A236FF05A5
              37FF05A638FF06A63AFF07A83BFF07AA3CFF06B041FF0D9931FF1B6E13FF1E66
              0DFF1C6B11FF1C6B11FF1C6B11FF6A9E63A2ECF3EB01FFFFFF00CFE0CD2D4787
              3EFF1C6B11FF1C6B11FF1C6B11FF1F670EFF177316FF04952CFF00A033FF029D
              31FF039F33FF03A034FF04A135FF04A236FF05A337FF06A538FF06A739FF06A8
              3BFF07AA3BFF05B140FF0CA035FF1A7115FF1D640CFF1C6B11FF1C6B11FF1C6B
              11FF6B9F64D3EEF4ED0CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3D8C0363E8134C11C6B11FF1C6B
              11FF1D6A10FF1E680FFF15781AFF059930FF01A336FF03A134FF04A135FF04A2
              36FF05A336FF05A437FF06A639FF06A83BFF07AA3BFF07AA3CFF08AC3EFF06B2
              42FF0E9B33FF1A7014FF1E660DFF1C6A10FF1C6B11FF1C6B11FF699D62FFE3ED
              E20BFFFFFF00D0E0CE594F8C46FF1C6B11FF1C6B11FF1C6B11FF1F670DFF1675
              17FF05972EFF01A336FF03A134FF04A134FF04A335FF04A336FF05A439FF06A6
              39FF06A83AFF07A93BFF07AA3CFF07AC3EFF06B342FF0D9F35FF1A7015FF1E65
              0DFF1C6A10FF1C6B11FF1C6B11FF6B9F64D3E6EFE517FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0E0
              CE2847873EB71C6B11FF1C6B11FF1C6A10FF1E660EFF187417FF069A2FFF01A5
              38FF04A336FF05A437FF05A538FF05A639FF06A83AFF07A93CFF07AB3DFF07AC
              3EFF08AD3EFF09AF41FF08B745FF0DA439FF1A7216FF1E650CFF1C6B11FF1C6B
              11FF1C6B11FF5F9757FFEDF3EC16FFFFFF00DFEADDFF55904DFF1C6B11FF1C6B
              11FF1D6B11FF1F660EFF177417FF069A30FF02A638FF04A236FF04A437FF05A5
              38FF05A63AFF06A83AFF07A93CFF07AB3DFF07AC3EFF08AD3EFF08AF40FF08B7
              45FF0DA439FF1A7316FF1E640CFF1C6B11FF1C6B11FF1C6B11FF599250F0DEEA
              DC26FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00D4E3D22446863DB91C6B11FF1C6B11FF1D6A11FF1F64
              0CFF177316FF059D32FF02A839FF05A538FF05A739FF06A839FF07AA3BFF07AA
              3CFF08AB3EFF08AE3EFF08AE40FF09B041FF0AB242FF07BA48FF0DA53AFF1B6F
              13FF1E640BFF1C6B11FF1C6B11FF1C6B11FF6A9E63FFFFFFFF00FFFFFF0CDAE7
              D81C45863CFF1C6B11FF1C6B11FF1C6B11FF1F650DFF177417FF069D31FF02A8
              3AFF05A437FF05A638FF06A83AFF07A83CFF07AA3CFF08AC3DFF08AE3EFF08AF
              3FFF09AF40FF0AB242FF07BB49FF0DA73AFF1A7316FF1E650DFF1C6B11FF1C6B
              11FF1C6B11FF538F4BF9E0EBDE23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2E2D02644853BBB1C6B
              11FF1C6B11FF1C6A10FF20640CFF167A1BFF06A337FF04A93BFF06A739FF06A8
              3AFF07AA3DFF08AC3EFF08AE3FFF09AE3FFF09B040FF0AB242FF0AB243FF0AB5
              45FF09BD4BFF11A136FF1B6C11FF1D650CFF1C6B11FF1C6B11FF1C6B11FF6FA1
              68FFFFFFFF00FFFFFF0CD1E1CEFF43853AFF1C6B11FF1C6B11FF1C6A11FF1F65
              0DFF177618FF079E33FF04AB3CFF06A739FF07A83BFF07AA3CFF08AC3DFF08AC
              3EFF08AE3FFF09AF40FF09B141FF0AB242FF0AB443FF09BD4AFF0FA73BFF1B72
              16FF1D650DFF1C6C11FF1C6B11FF1C6B11FF61985AE2EEF4ED0CFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CDDECB2A387D2EC71C6B11FF1C6B11FF1D6A10FF1E660EFF157E1DFF07A4
              37FF05AB3DFF07A93AFF07AB3DFF08AC3EFF08AE3FFF09AF40FF09B041FF0AB2
              42FF0AB343FF0BB444FF0BB847FF0AC04BFF11A037FF1B6D13FF1D650CFF1C6B
              11FF1C6B11FF1C6B11FF6EA067FFFFFFFF00FFFFFF00CCDECA4246863DFF1C6B
              11FF1C6B11FF1D6B10FF1E660DFF177619FF08A135FF04AE3EFF07A93BFF08AB
              3DFF08AD3EFF08AE3FFF09AF40FF09B041FF09B242FF0BB443FF0BB444FF0BB6
              45FF0ABE4BFF10A73CFF1B7014FF1D650DFF1C6C11FF1C6B11FF1C6B11FF71A3
              6BCAEEF4ED0CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00CADDC82E428439BD1C6B11FF1C6B11FF1C6A
              10FF1D680FFF17791BFF09A136FF05AF3FFF08AC3EFF08AD3EFF09AF40FF09B0
              41FF0AB142FF0AB343FF0BB544FF0BB645FF0BB646FF0BBB49FF0CC04DFF11A8
              3CFF1A7417FF1D660DFF1C6B11FF1C6B11FF1C6B11FF5F9757FFE6EFE518FFFF
              FF00DBE7D92A55904DFF1C6B11FF1C6B11FF1C6A11FF1E670DFF17781AFF08A3
              37FF05B140FF08AC3EFF08AD3FFF09AF40FF09B041FF09B142FF0AB343FF0BB5
              44FF0BB646FF0CB646FF0CB948FF0BBF4BFF11A83CFF1B7217FF1D640DFF1C6B
              11FF1C6B11FF1D6C12FF619859E5E3EDE21DFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0E0CE284385
              3ABB1C6B11FF1C6B11FF1C6A11FF1D670FFF187719FF09A638FF06B242FF09AF
              40FF09B041FF09B142FF0AB242FF0BB445FF0BB546FF0BB646FF0CB747FF0CB9
              47FF0EBA4AFF0DC24FFF11AD40FF1B7317FF1D670EFF1C6C11FF1C6B11FF1C6B
              11FF6C9F65D8FFFFFF00FFFFFF00DDE9DC15498840FF1C6B11FF1C6B11FF1C6B
              11FF1E660EFF187719FF09A639FF06B342FF09AE3FFF09AF40FF09B241FF0AB2
              42FF0AB444FF0BB544FF0CB746FF0CB847FF0CB948FF0DBB48FF0DC34EFF11AD
              3FFF1A7316FF1D630CFF1C6B11FF1C6B11FF1C6B11FF599250F0E3ECE11DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00CFE0CD2843853ABB1C6B11FF1C6B11FF1C6B11FF1D650DFF1779
              1AFF0AAC3DFF07B545FF0AB141FF0AB342FF0AB443FF0BB645FF0CB746FF0CB8
              47FF0CB948FF0DBB49FF0EBC4AFF0EBE4AFF0DC552FF13A93EFF1D6D13FF1D65
              0EFF1C6C11FF1C6B11FF1C6B11FF71A26AFFFFFFFF00FFFFFF0DCCDECAFF4284
              39FF1C6B11FF1C6B11FF1C6B11FF1E640DFF17781AFF0BA73AFF07B444FF0AB0
              42FF0AB242FF0AB242FF0BB444FF0BB547FF0CB748FF0DBA48FF0DBB48FF0DBB
              4AFF0EBE4CFF0DC651FF12AE40FF1B7316FF1D640BFF1C6A11FF1C6B11FF1C6B
              11FF599351F0E5EEE41AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCDECA2C3E8134C11C6B11FF1C6B
              11FF1D6A10FF1E650DFF16811FFF09B040FF08B745FF0AB343FF0BB444FF0BB6
              46FF0CB747FF0CB948FF0DBA48FF0DBB4AFF0EBE4BFF0EBF4CFF0FC04DFF0FC7
              53FF14A53BFF1C6B11FF1D640CFF1C6B11FF1C6B11FF1C6B11FF72A36CFFFFFF
              FF00FFFFFF00CBDDC962418338FF1C6B11FF1C6B11FF1C6A10FF1E630CFF1879
              1AFF0BA93CFF08B646FF0AB343FF0BB444FF0BB645FF0CB846FF0CB948FF0DBA
              49FF0DBB4AFF0EBC4BFF0EBE4CFF0FC14EFF0EC954FF13B042FF1B7316FF1D63
              0BFF1C6A11FF1C6B11FF1C6B11FF6C9F65D3F3F7F303FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFD5
              BC3A3C8033C31C6B11FF1C6B11FF1D6910FF1E640CFF168120FF0BAE40FF09BA
              48FF0BB645FF0CB747FF0CB847FF0CB948FF0DBA49FF0EBC4BFF0EBF4CFF0FBF
              4DFF0FC14EFF0FC450FF0FCA55FF15A93DFF1C7015FF1D630CFF1C6A11FF1C6B
              11FF1C6B11FF70A269FFE8F0E71FFFFFFF00CCDECA624A8942FF1C6B11FF1C6B
              11FF1D6A11FF1E640CFF187A1CFF0BAC3EFF09B947FF0BB544FF0BB646FF0CB8
              48FF0DBA48FF0DBB49FF0DBC4AFF0EBD4BFF0FBF4DFF0FC04DFF0FC34FFF0FCD
              56FF13AF42FF1C7115FF1D630CFF1C6B11FF1C6B11FF1C6B11FF71A26ACAEAF1
              E912FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00CDDECB2A408337BF1C6B11FF1C6B11FF1D6910FF1E63
              0BFF187A1CFF0DAE40FF0ABD4AFF0CB847FF0CBA48FF0DBA49FF0DBB4AFF0EBC
              4BFF0FBE4CFF0FC04DFF0FC24FFF10C24FFF11C652FF10D05AFF14B446FF1B72
              17FF1D640CFF1C6B11FF1C6B11FF1C6B11FF62995BFFF0F5EF0DFFFFFF00DDE9
              DCFF4E8C45FF1C6B11FF1C6B11FF1C6B11FF1E640DFF187B1DFF0CAE41FF0ABC
              4AFF0CB747FF0CB948FF0DBB4AFF0DBC4BFF0EBE4CFF0EBE4CFF0FC04DFF0FC1
              4EFF10C24FFF10C551FF10CE59FF14B244FF1B7316FF1D630BFF1C6B11FF1C6B
              11FF1C6B11FF5F9757E8E6EFE517FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFE0CD28408236BF1C6B
              11FF1C6B11FF1C6A10FF1E620BFF187A1BFF0DB243FF0BBF4DFF0DB948FF0DBC
              49FF0EBD4AFF0FBE4DFF0FC04EFF10C24FFF10C350FF10C451FF11C551FF10C7
              54FF10D35CFF14B545FF1C6F14FF1C640CFF1C6C11FF1C6B11FF1C6B11FF72A3
              6CFFFFFFFF00FFFFFF08D2E2D031408236FF1C6B11FF1C6B11FF1C6A11FF1D64
              0DFF187B1DFF0DB143FF0BC14EFF0DB948FF0EBB49FF0EBD4BFF0EBE4CFF0FBE
              4DFF10C04EFF10C350FF10C350FF11C451FF12C752FF10D05BFF14B446FF1B72
              16FF1C630BFF1C6C11FF1C6B11FF1C6B11FF5D9555EAE7EFE617FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CDDECB2A418338BD1C6B11FF1C6B11FF1C6B10FF1E630BFF188120FF0DBA
              4AFF0CC04EFF0EBC4AFF0EBD4CFF0FC04EFF10C14FFF10C250FF11C450FF11C5
              51FF11C653FF12C652FF12CB55FF12D55EFF16AC41FF1C6A11FF1C650CFF1C6C
              11FF1C6B11FF1C6B11FF75A56EF7FFFFFF00FFFFFF00CADCC742408236FF1C6B
              11FF1C6B11FF1C6A10FF1E630CFF187D1DFF0EB545FF0CC24FFF0EBD4AFF0FBE
              4CFF0FBF4DFF0FC04DFF10C24FFF10C351FF11C551FF11C653FF12C753FF12C9
              56FF11D35CFF14B646FF1B7316FF1C630CFF1C6C12FF1C6B11FF1C6B11FF669B
              5EDCF1F6F009FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6DAC332387D2EC71C6B11FF1C6C11FF1D6A
              10FF1D650CFF178725FF0DBC4AFF0DC24FFF0FBE4DFF0FC04DFF10C24FFF10C4
              51FF11C552FF11C653FF12C753FF12C955FF13C956FF13CD58FF13D55EFF17AB
              3FFF1B6C12FF1C670DFF1C6B11FF1C6B11FF1D6C12FF75A56EF7FFFFFF00FFFF
              FF00C9DCC602408337BF1C6B11F01C6B11FF1C6A10FF1E630BFF197D1EFF0FB6
              47FF0DC450FF0FBF4DFF0FC14EFF10C24FFF10C350FF11C551FF11C652FF11C7
              53FF13C955FF13CA56FF13CC58FF13D55FFF16B747FF1B7116FF1C630BFF1C6B
              11FF1C6B11FF1C6B11FF75A56EC4F3F7F206FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343E81
              34C11C6B11FF1C6B11FF1C690FFF1D660DFF188020FF0FB747FF0EC651FF10C1
              4EFF10C350FF11C552FF11C652FF11C753FF12C854FF12CA56FF13CC57FF14CC
              57FF14D15AFF14D65EFF17B547FF1B7418FF1C650CFF1C6C11FF1C6B11FF1E6C
              13FF659B5ED7E7EFE617FFFFFF00FFFFFF00508D47AA1C6B11FF1C6B11FF1C69
              10FF1D630CFF187D1FFF0FB847FF0EC652FF0FC14FFF10C350FF11C551FF11C6
              52FF11C753FF12C855FF13CA55FF13CC56FF14CD58FF14D05BFF14D761FF16B7
              48FF1B7217FF1C620BFF1C6B11FF1C6B11FF1E6C13FF669B5EDCE6EFE517FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C9DCC6303E8134C11C6B11FF1C6B11FF1C6A11FF1D640DFF187F
              1FFF10BA49FF0FC854FF11C450FF11C552FF11C653FF12C853FF12C955FF13CB
              56FF13CD58FF14CE58FF14CF59FF15D15BFF15DA62FF18BA4BFF1C7317FF1C64
              0CFF1C6C11FF1C6B11FF1C6B11FF75A56EFFF3F7F21AFFFFFF00FFFFFF004485
              3BBB1C6B11FF1C6B11FF1C6A10FF1D630BFF197F1FFF10BA49FF0FC954FF10C3
              50FF11C552FF11C653FF12C754FF12C854FF13CA56FF14CD58FF14CD59FF14CE
              59FF15D15BFF15DA62FF17BA4BFF1B7216FF1C620BFF1C6B11FF1C6B11FF1C6B
              11FF61985AE2EAF1E912FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7DAC4323E8134C11C6B11FF1C6B
              11FF1C6A10FF1D640DFF188020FF11C24EFF10CD57FF11C652FF12C753FF12C8
              54FF12CA55FF13CC57FF14CE58FF14CE58FF15CF5AFF15D15BFF15D35DFF16DC
              64FF18B749FF1C6A11FF1C630BFF1C6C11FF1C6B11FF1C6B11FF79A772FFFFFF
              FF00FFFFFF00C5D9C2103B7F32FF1C6B11FF1C6B11FF1C6A11FF1D630CFF1880
              20FF11BE4CFF10CC56FF11C652FF12C753FF12C854FF12C956FF13CB56FF14CD
              57FF14CE59FF15CF5AFF15D05BFF15D25DFF16DD64FF19BA4CFF1C7217FF1C62
              0AFF1C6B11FF1C6B11FF1C6B11FF63995CDFEFF5EE0CFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9DC
              C6303B7F32C31C6B11FF1C6B11FF1C6A10FF1E630AFF198A28FF11C954FF11CF
              59FF12C954FF12CA55FF13CB56FF13CD57FF14CF59FF15CF5AFF15D15BFF15D2
              5CFF16D25EFF16D65EFF17DF65FF19B043FF1C680FFF1C610AFF1C6C12FF1C6C
              12FF1C6B11FF79A87379FFFFFF00FFFFFF00C6DAC3FF3C8033FF1C6B11FF1C6B
              11FF1C6A11FF1C620BFF198120FF12C14DFF11CF59FF12C854FF12CA55FF13CB
              56FF14CD57FF14CF59FF14D05AFF15D15BFF15D25BFF16D35DFF16D65FFF17E2
              68FF19BD4DFF1B7116FF1C610AFF1C6B11FF1C6B11FF1C6B11FF71A26ACAF2F6
              F106FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C2D7BF363A7F31C51C6B11FF1C6C11FF1D6810FF1E61
              0BFF188826FF13C352FF13D15BFF13CC56FF13CD57FF14CF58FF14D15AFF15D2
              5BFF16D25CFF16D35DFF16D55EFF17D65FFF17DB63FF18E369FF19B648FF1B70
              15FF1C620AFF1C6B11FF1C6B11FF1C6B11FF71A36BFBFFFFFF00FFFFFF00CBDD
              C906498840B51C6B11FF1C6B11FF1C6A10FF1E620AFF1A8020FF13C14FFF11D2
              5BFF13CA56FF13CD57FF14CF58FF15D15AFF15D25CFF15D35DFF16D45CFF16D6
              5EFF17D660FF17D961FF17E46AFF19BD4EFF1C7115FF1C620AFF1C6B11FF1C6B
              11FF1C6B11FF71A36BCAEAF1E912FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343A7F31C51C6B
              11FF1C6B11FF1C670EFF1D6008FF1A8221FF14C552FF13D25CFF14CD58FF14D0
              5AFF15D15BFF16D25BFF16D45DFF17D55EFF17D560FF18D860FF18D861FF18DE
              65FF18E96EFF19C150FF1C7215FF1C630BFF1C6B11FF1C6B11FF1C6B11FF6A9E
              6387FFFFFF00FFFFFF00D7E5D5204A8942B31C6B11FF1C6B11FF1C6910FF1D61
              0AFF1A8222FF13C652FF12D45CFF14CC57FF15CE5AFF15D05CFF16D35CFF16D4
              5DFF16D55EFF17D760FF17D861FF18D860FF19DC63FF19E76CFF1AC04FFF1C70
              15FF1C620AFF1C6B12FF1C6B11FF1C6B11FF649A5DDFEAF1E912FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C8DBC5303A7F31C51C6B11FF1C6C11FF1C690FFF1D630BFF1A8422FF14C5
              53FF14D15BFF15D05AFF15D15BFF16D35CFF16D55EFF17D55FFF17D860FF18D8
              61FF18D962FF19DA62FF19DE65FF19EA6EFF1BC151FF1C7014FF1C640BFF1C6B
              11FF1C6B11FF1D6C12D77BA9753BFFFFFF00FFFFFF00CADDC82E3A7F31C51C6B
              11FF1C6B11FF1C6910FF1D640BFF198424FF14C754FF14D45DFF15CF5AFF16D1
              5CFF16D35DFF16D45EFF17D55FFF17D75FFF18D862FF19D962FF19DA62FF19DF
              65FF1AE86DFF1BC04FFF1C7116FF1C620AFF1C6B11FF1C6B11FF1C6B11FF659B
              5EDCEBF2EA12FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343E8134C11C6B11FF1C6B11FF1C6A
              10FF1C640BFF188F2BFF14D25CFF15D15BFF16D25CFF16D45EFF17D55FFF17D6
              60FF17D761FF18D962FF19DA63FF19DC64FF19DB64FF1AE068FF1BEB70FF1CB6
              48FF1C6E14FF1C6910FF1C6B11FF1C6B11FF1F6D14E192B88D68FFFFFF00FFFF
              FF00C1D6BE383E8134C11C6B11FF1C6B11FF1C6910FF1C630BFF198B28FF15CE
              59FF14D65DFF16D25CFF16D45EFF17D55EFF17D65FFF17D860FF18D961FF19DB
              63FF19DC64FF1ADC65FF1AE066FF1BE96DFF1BC151FF1C7417FF1C670EFF1C6B
              11FF1C6B11FF1C6B11FF78A771FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1D6BE383078
              26FF1C6B11FF1C6B11FF1C680FFF1C7015FF16C350FF15D861FF16D25DFF17D5
              5DFF17D65FFF17D760FF18D862FF18DA62FF19DB63FF19DC64FF1ADD66FF1ADD
              67FF1BE169FF1BF073FF1CB043FF1C680FFF1C6A10FF1C6B11FF1C6B11FF4485
              3BBBE3ECE114FFFFFF00FFFFFF00C0D6BD382F7725FF1C6B11FF1C6B11FF1C66
              0DFF1C6A10FF17B446FF15DB63FF16D35DFF16D65EFF17D660FF17D760FF17D9
              60FF18DA62FF19DC64FF19DD65FF1ADE65FF1ADF66FF1BE269FF1BF072FF1CC1
              51FF1C6C11FF1C670EFF1C6B11FF1C6B11FF347B2AFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0092B88D6826711BFF1C6B11FF1C6B11FF1C660EFF1C7719FF17CB57FF16D8
              60FF16D45DFF17D760FF18D861FF18D962FF18DA62FF19DC64FF19DD65FF1ADE
              66FF1AE067FF1BDF66FF1CEA6FFF1CD961FF1C8F2CFF1C690FFF1C6A10FF1C6B
              11FF1C6B11FF659B5E97EEF4ED08FFFFFF00FFFFFF0092B88D6826711BFF1C6B
              11FF1C6C11FF1C640CFF1B6F15FF17BE4DFF15DB63FF17D45DFF17D65EFF17D6
              60FF18D960FF18DB63FF19DC65FF1ADE65FF1ADF65FF1AE067FF1BE067FF1CE8
              6EFF1CE168FF1C9B34FF1C6910FF1C6910FF1C6B11FF1C6B11FF498941FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0089B284721C6B11E51C6B11FF1C6C11FF1C660EFF1C690FFF18A7
              3CFF15D860FF16D35DFF17D55FFF17D760FF18D961FF18DA62FF19DC63FF19DD
              65FF1ADE65FF1ADF66FF1BE067FF1BEB70FF1CE269FF1C8C29FF1C6009FF1C6A
              10FF1C6B11FF1C6B11FF43853ABBCFE0CD28FFFFFF00FFFFFF0089B284721F6D
              14E11C6B11FF1C6C11FF1C660EFF1C690FFF18A53BFF15D760FF17D55FFF17D5
              5EFF17D760FF18D861FF18D962FF18DA63FF19DD64FF1ADF66FF1ADF67FF1BE0
              67FF1BE96EFF1CE168FF1C922EFF1C6008FF1C690FFF1C6B11FF1C6B11FF2E77
              24D1BBD3B83EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF008BB486701C6B11E51C6B11FF1C6B11FF1C650DFF1C66
              0EFF18A138FF15D85FFF16D45EFF16D55EFF17D760FF18D861FF18D962FF19DB
              63FF19DD64FF1ADD65FF1ADE66FF1AE168FF1BEC71FF1BE46AFF1C932FFF1C61
              0BFF1C690FFF1C6B11FF1C6B11FF397E30C5CADCC72EFFFFFF00FFFFFF009ABD
              9660206D15E11C6B11FF1C6B11FF1C670DFF1C680FFF18A43AFF15D961FF16D6
              5FFF17D45EFF17D860FF18D861FF18D962FF18DA62FF19DC64FF19DD65FF1ADF
              67FF1BDF67FF1BEA6EFF1BE269FF1C922EFF1C6109FF1C690FFF1C6C11FF1C6B
              11FF307826CFB5CFB244FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008DB5886E1E6C13E31C6B11FF1C6B11FF1C63
              0BFF1C640CFF19A238FF15D960FF16D65FFF16D45DFF16D660FF18D961FF18D9
              61FF18DA62FF19DB63FF19DC64FF1ADE66FF1AE067FF1BED70FF1BE36AFF1C93
              30FF1C5F08FF1C680FFF1C6B11FF1C6B11FF307826CFB4CEB144FFFFFF00FFFF
              FF00A7C6A3522A7420D51C6B11FF1C6C11FF1C650EFF1C620AFF189F37FF15DA
              62FF15D660FF16D35DFF17D65FFF17D761FF18DA61FF18DA62FF19DA64FF19DE
              64FF1ADF65FF1ADF66FF1BEA6FFF1BE56BFF1C932FFF1C6009FF1C690FFF1C6B
              11FF1C6B11FF317927CFB4CEB144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0090B68A6C216E17DF1C6B11FF1C6C
              11FF1C650CFF1C6A11FF18A73DFF15D961FF16D75FFF16D35DFF17D65FFF17D8
              60FF17D962FF19DB63FF19DC64FF19DD64FF1ADE65FF1ADF66FF1BEA6EFF1BDB
              62FF1C8E2BFF1C6009FF1C670EFF1C6C11FF1C6B11FF3A7F31C5BAD2B640FFFF
              FF00FFFFFF0096BB91642A7420D51C6B11FF1C6C12FF1C660DFF1C650DFF189C
              35FF15D55EFF16D860FF16D45EFF17D55FFF18D660FF18D862FF18DA62FF19DA
              64FF19DB64FF1ADD65FF1ADE66FF1BEA6FFF1BE369FF1C9A33FF1C620AFF1C69
              0FFF1C6C11FF1C6B11FF3A7F31C5BDD4BA3CFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008EB5886E237018DD1C6B
              11FF1C6B11FF1C660DFF1C670EFF18AA3FFF15DE64FF16D760FF16D35DFF17D5
              5EFF17D75FFF18D861FF18DA62FF19DC64FF1ADD64FF1ADD65FF1ADF65FF1BE8
              6DFF1BDE65FF1C8626FF1C5D07FF1C680FFF1C6C12FF1C6B11FF3E8134C1C7DA
              C432FFFFFF00FFFFFF008CB4876E226F18DD1C6B11FF1C6C11FF1C670FFF1C66
              0EFF18A138FF14D960FF16D660FF16D35DFF17D65EFF17D75FFF18D861FF19DB
              62FF19DB63FF19DC64FF1ADD64FF1ADD66FF1BE86EFF1CE369FF1C9430FF1C60
              0AFF1C680EFF1C6C11FF1C6B11FF307826CFBCD3B93CFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008DB5886E226F
              18DD1C6B11FF1C6B11FF1C680FFF1B670DFF19A037FF15D960FF16D65FFF16D3
              5DFF17D55EFF17D760FF18D861FF18DA62FF19DC64FF19DD64FF1ADE65FF1ADE
              66FF1BE66BFF1BE169FF1C932FFF1C5F08FF1C6810FF1C6C12FF1C6B11FF4183
              38BDC8DBC530FFFFFF00FFFFFF0091B78B6A216E17DF1C6B11FF1C6C11FF1C67
              0EFF1C660DFF18A138FF15D65EFF15D75FFF16D25DFF17D55EFF17D65FFF17D7
              60FF19D962FF19DB64FF19DD64FF1ADE65FF1ADE65FF1AE76CFF1BE268FF1C95
              2FFF1C6009FF1C670EFF1C6B11FF1C6B11FF2E7724D1B3CEB046FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008EB5
              886E206E16DF1C6B11FF1C6B11FF1C670FFF1C680EFF189E36FF15D65EFF16D6
              5EFF16D35DFF17D55EFF17D65FFF17D760FF18D961FF18DB63FF19DD64FF1ADD
              64FF1ADE65FF1AE66BFF1BE168FF1C9732FF1C620AFF1C680FFF1C6B11FF1C6B
              11FF307826CFBCD3B93CFFFFFF00FFFFFF00A9C7A45227721CD91C6B11FF1C6C
              11FF1C680EFF1C660EFF189F36FF15D55EFF15D55EFF16D35DFF17D55EFF17D6
              5FFF17D760FF18D861FF19DA62FF19DC63FF1ADD65FF1ADE65FF1AE66CFF1BE1
              67FF1C9630FF1C5F09FF1C670DFF1C6B11FF1C6B11FF2C7522D3B1CCAD48FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0091B78B6A206D15E11C6B11FF1C6B11FF1C660EFF1C6B11FF17A137FF14D4
              5DFF15D55EFF15D25CFF17D45EFF17D65FFF17D760FF18D861FF18D962FF18DB
              63FF1ADD64FF1ADD65FF1AE66BFF1BDC64FF1B9531FF1C640CFF1C680FFF1C6B
              11FF1C6B11FF327A28CDB2CDAE48FFFFFF00FFFFFF00A6C5A2542B7521D51C6B
              11FF1C6B11FF1C660EFF1C650CFF199B33FF15D45DFF15D55DFF16D25CFF16D3
              5DFF17D55FFF17D760FF18D860FF18D961FF19DB63FF19DD64FF1ADE65FF1AE6
              6BFF1AE268FF1B9833FF1C610AFF1C680FFF1C6B11FF1C6B11FF327A28CDB1CC
              AD48FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0092B88D68206E16DF1C6B11FF1C6B11FF1C660DFF1C6A10FF17AB
              3FFF14D75FFF15D35DFF15D25CFF16D35DFF17D55FFF17D760FF18D861FF18D9
              61FF18DA63FF19DC64FF1ADD65FF1AE86DFF1BD861FF1C8927FF1C620AFF1C6A
              10FF1C6B11FF1C6B11FF3B7F32C3C2D8C036FFFFFF00FFFFFF0092B88D68226F
              18DD1C6B11FF1C6B11FF1C650EFF1C660DFF189E36FF15D55EFF15D55EFF16D2
              5CFF16D45DFF16D55EFF17D760FF18D861FF18D961FF18DA62FF19DC64FF1ADC
              65FF1AE66BFF1ADF66FF1B9831FF1C630CFF1C6A10FF1C6C11FF1C6B11FF347B
              2ACBC2D8C036FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0094B98F66206E16DF1C6B11FF1C6C12FF1C660EFF1C64
              0CFF18A23AFF13DA61FF15D35CFF15D15BFF16D45DFF16D55EFF17D65FFF18D8
              61FF18D961FF18DA63FF19DC63FF19DC63FF1AE86DFF1AE269FF1B8D2AFF1C5F
              08FF1C6A10FF1C6B11FF1C6B11FF3C8033C3C5D9C234FFFFFF00FFFFFF0092B8
              8C6A206E16DF1C6B11FF1C6B11FF1C660EFF1C660DFF189E35FF13D860FF15D6
              5FFF16D15BFF16D45DFF16D55EFF17D65FFF17D860FF18D961FF18DA62FF19DB
              64FF1ADC64FF1AE56BFF1BE167FF1C9730FF1C610AFF1C6A0FFF1C6C11FF1C6B
              11FF2D7623D3B3CEB046FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0092B88D68206D15E11C6B11FF1C6C11FF1C66
              0EFF1C640CFF189B34FF14D45EFF15D45DFF15D15BFF16D45DFF16D55EFF17D5
              5FFF18D761FF18D962FF18DB62FF19DB63FF19DC64FF1AE76CFF1AE469FF1C97
              31FF1C6109FF1C690FFF1C6B11FF1C6B11FF337A29CDC4D9C134FFFFFF00FFFF
              FF00A2C29D58216E17DF1C6B11FF1C6B11FF1C690FFF1C670EFF189E36FF13D6
              5FFF14D45EFF16D15CFF16D45DFF16D55DFF17D75FFF17D860FF18D962FF18DB
              62FF19DC64FF19DB63FF1AE56BFF1BE168FF1C9630FF1C6109FF1C690FFF1C6C
              11FF1C6B11FF2D7623D3AECAAA4CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0093B98E68206E16DF1C6B11FF1C6C
              11FF1C660DFF1C650DFF189C34FF14D45EFF14D55EFF16D15BFF16D25DFF16D4
              5DFF17D55EFF18D660FF18D961FF19DA62FF19DC64FF19DC64FF1AE76CFF1BE3
              69FF1C9832FF1C5F08FF1C670EFF1C6B11FF1C6B11FF29741FD7B0CBAC4AFFFF
              FF00FFFFFF00B0CBAC4A2D7623D31C6B11FF1C6C11FF1C680FFF1C630BFF189B
              34FF14D45DFF15D45DFF15D05AFF16D35DFF17D55EFF17D55FFF17D760FF18D8
              60FF19D962FF19DB63FF19DC63FF1AE66AFF1AE46AFF1C9832FF1C600AFF1C68
              0EFF1C6C11FF1C6B11FF2B7521D5ADCAA94CFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0093B98E68237018DD1C6B
              11FF1C6B11FF1C650DFF1C6A10FF18A339FF14D45DFF15D55EFF15D05BFF16D3
              5DFF16D45EFF17D55FFF17D660FF17D860FF19DA62FF19DB64FF19DC64FF1AE5
              6BFF1AD962FF1B902DFF1C610AFF1C660DFF1C6C12FF1C6B11FF387E2FC7B6CF
              B244FFFFFF00FFFFFF009EC0995C2D7623D31C6B11FF1C6B12FF1C660DFF1C66
              0CFF199930FF14D05AFF15D35CFF15D05AFF15D35DFF17D55EFF17D65EFF17D7
              60FF18D861FF18D962FF19DB63FF19DC63FF1AE66BFF1AE268FF1C9A34FF1C62
              0AFF1C660EFF1C6C11FF1C6B11FF387E2FC7B7D0B342FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0097BB92642370
              18DD1C6B11FF1C6B11FF1C660EFF1C660EFF17A53BFF13D760FF15D35DFF15D1
              5BFF15D25CFF16D45EFF17D55FFF17D65FFF17D760FF18D961FF19DC63FF19DB
              63FF1AE369FF1ADB63FF1B8929FF1C6009FF1C690FFF1C6C11FF1C6B11FF397E
              30C5C1D6BE38FFFFFF00FFFFFF0093B98E68247019DD1C6B11FF1C6B12FF1C66
              0EFF1C640CFF189B33FF13D35CFF15D35CFF15D05BFF15D25CFF16D45DFF16D6
              5EFF17D760FF18D861FF18D962FF18DA62FF19DC64FF1AE46AFF1AE067FF1C98
              32FF1C610AFF1C670EFF1C6B11FF1C6B11FF2D7623D3B6CFB244FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099BC
              9462247019DD1C6B11FF1C6B11FF1C680FFF1C660DFF189B33FF13D55EFF15D4
              5DFF15D05BFF15D35CFF16D45DFF16D65EFF17D65FFF17D861FF18D961FF18D9
              62FF19DA63FF1AE167FF1AE068FF1C9631FF1C610AFF1C6A11FF1C6B11FF1C6B
              11FF387D2EC7C1D6BE38FFFFFF00FFFFFF0098BC9362247019DD1C6B11FF1C6B
              11FF1C670EFF1C640BFF189B34FF13D35DFF15D45DFF15D05BFF15D25CFF16D2
              5CFF16D45EFF17D65FFF17D861FF18DA61FF18DB62FF19DB63FF19E369FF1AE0
              67FF1B9832FF1C6209FF1C680DFF1C6C11FF1C6B11FF29741FD7AAC7A550FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0097BB9264216E17DF1C6B11FF1C6B11FF1C680FFF1C660EFF189A32FF13D2
              5BFF14D35CFF15CF5AFF15D25CFF16D35DFF16D45EFF17D660FF17D860FF18D9
              61FF18DA62FF19DA61FF19E469FF1AE067FF1C9934FF1C640CFF1C6910FF1C6B
              11FF1C6B11FF29741FD7B9D1B540FFFFFF00FFFFFF00AECAAA4C2A7420D51C6B
              11FF1C6B11FF1C680EFF1C660DFF189B33FF13D35CFF14D35CFF15CF5AFF15D2
              5BFF16D25DFF16D45EFF16D65FFF18D760FF18D861FF18DA63FF19DB63FF19E1
              69FF1ADF66FF1B9832FF1C610AFF1C680FFF1C6C11FF1C6B11FF28731ED7AAC7
              A550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0096BB9164216E17DF1C6B11FF1C6B11FF1C680DFF1C6B10FF179B
              33FF14D059FF13D15BFF15CF5AFF15D25CFF16D35DFF16D45DFF16D55EFF17D7
              60FF18D861FF18D962FF18DB62FF19E469FF19DD64FF1C9832FF1C640CFF1C69
              0FFF1C6B11FF1C6B11FF307826CFACC9A84EFFFFFF00FFFFFF00ADCAA94C3078
              26CF1C6B11FF1C6C11FF1C680EFF1C660EFF189631FF13D25BFF13D25CFF15CF
              59FF15D25BFF16D25DFF16D45DFF16D55EFF17D65FFF17D961FF18DA62FF19DB
              63FF19E267FF19DF67FF1B9933FF1C610AFF1C680FFF1C6C11FF1C6B11FF3078
              26CFACC9A84EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0096BB9164216E17DF1C6B11FF1C6B12FF1D650DFF1C69
              0FFF16A53AFF13D25CFF14D05BFF14CF5AFF15D15CFF16D25CFF16D45DFF16D5
              5EFF17D65FFF18D861FF18D962FF18DB63FF19E56BFF1AD962FF1B8C28FF1C5F
              09FF1C680FFF1C6B11FF1C6B11FF387E2FC7BED5BB3AFFFFFF00FFFFFF0099BC
              9462237018DD1C6B11FF1C6B11FF1C670EFF1C660DFF189832FF13D15AFF14D2
              5BFF14CE59FF15D05BFF16D25CFF16D35DFF16D55EFF17D65FFF17D860FF18DA
              61FF19DA63FF19E468FF1AE066FF1B9933FF1C630AFF1C680FFF1C6C11FF1C6B
              11FF307826CFBFD5BC3AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF009BBE9660237018DD1C6B11FF1C6C12FF1C65
              0DFF1C610AFF169E36FF12D45DFF14D05BFF14CE59FF14CF5BFF15D15CFF16D2
              5DFF16D45EFF17D55EFF17D860FF18D962FF18D962FF19E569FF19DF66FF1C8F
              2BFF1C5E07FF1C680FFF1C6B11FF1C6B11FF367C2CC9BFD5BC3AFFFFFF00FFFF
              FF009BBE9660237018DD1C6B11FF1C6C11FF1C660EFF1C640CFF199832FF12D1
              5BFF13D15BFF14CE58FF15D059FF15D25BFF16D35DFF16D45EFF17D55EFF17D6
              5FFF17D862FF19D962FF19E369FF19E167FF1C9933FF1C620BFF1C680FFF1C6B
              11FF1C6B11FF28731ED7ACC9A84EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009DBF985E26711BDB1C6B11FF1C6C
              11FF1C660DFF1C6109FF179730FF12D05BFF14D25CFF14CD58FF15D059FF15D0
              5BFF16D25DFF17D35EFF17D55EFF17D660FF18D861FF18D961FF19E369FF19E2
              67FF1B9934FF1C6109FF1C680EFF1C6C12FF1C6B11FF2C7522D3BBD3B83EFFFF
              FF00FFFFFF00AAC7A55025711ADB1C6B11FF1C6C11FF1C680EFF1C640CFF1898
              31FF13D25BFF13D25BFF14CD58FF15CF5AFF15D05BFF16D25CFF16D55EFF17D6
              5FFF17D75FFF18D861FF18D861FF18E269FF19E169FF1B9A34FF1C630BFF1C68
              0FFF1C6C11FF1C6B11FF28731DD9A3C39F56FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009ABD966027721CD91C6B
              11FF1C6B11FF1D660EFF1C630CFF179730FF12D15AFF13D35CFF15CE59FF15CF
              5AFF15D15BFF16D25CFF16D45DFF17D65FFF18D760FF18D861FF18D860FF19E1
              68FF19DF66FF1A9B34FF1C620AFF1C670EFF1C6C12FF1C6B11FF2B7521D5AAC7
              A550FFFFFF00FFFFFF00B3CEB0462D7623D31C6B11FF1C6C11FF1D690EFF1C63
              0CFF189730FF12D05AFF13D25BFF14CD57FF15CF59FF15D05AFF16D15CFF17D3
              5DFF17D55EFF17D65FFF18D860FF18D961FF19E168FF19E068FF1B9A34FF1C63
              0AFF1C680DFF1C6C11FF1C6B11FF2A7420D5A4C4A056FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0096BB91642470
              19DD1C6B11FF1C6B11FF1C680FFF1C6A0FFF17A038FF12D05BFF13D25CFF14CE
              59FF15D05BFF15D15BFF16D25CFF16D35DFF17D55FFF17D760FF18D961FF18D9
              61FF18E068FF19D760FF1B902CFF1C630AFF1C670DFF1C6C11FF1C6B11FF387D
              2EC7B3CEB046FFFFFF00FFFFFF009EC0995C2D7623D31C6B11FF1C6C11FF1D69
              0FFF1D650CFF179630FF13CE58FF13D25BFF14CE58FF15D05AFF15D15BFF15D2
              5CFF16D35EFF17D55FFF17D760FF18D861FF18D962FF18E066FF19DF66FF1B9B
              33FF1C6209FF1C660DFF1C6B11FF1C6B11FF387E2FC7B9D1B540FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CBF
              975E247019DD1C6B11FF1C6B11FF1C680FFF1D680FFF16A138FF12D25CFF14D1
              5BFF14CD58FF15CF5AFF15D15BFF15D25CFF16D35CFF16D45EFF17D65FFF18D7
              61FF18D861FF18DF66FF19D862FF1B8D2AFF1C610AFF1C680EFF1C6B11FF1C6B
              11FF367C2CC9BBD3B83EFFFFFF00FFFFFF009BBE966027721CD91C6B11FF1C6C
              11FF1C690FFF1D650CFF18962FFF13CD58FF13D15AFF14CD58FF15CF5AFF15D1
              5BFF15D25BFF16D45CFF16D45DFF17D65FFF18D860FF18D961FF18DF66FF19DD
              65FF1B9B35FF1C6209FF1C660DFF1C6B11FF1C6B11FF29741FD7B5CFB244FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF009FC09A5C25711ADB1C6B11FF1C6B11FF1C670FFF1D650DFF18962FFF13CE
              58FF13CF59FF13CC57FF14CE59FF15D15AFF15D15CFF16D35CFF16D45DFF16D5
              5EFF17D761FF18D861FF18E066FF19DF66FF1B9832FF1C620AFF1C6910FF1C6B
              11FF1C6B11FF337A29CDBAD2B640FFFFFF00FFFFFF00A0C19B5A27721CD91C6B
              11FF1C6B11FF1C660EFF1D650BFF17962FFF13CE57FF13D059FF14CC58FF14CE
              59FF15D05BFF15D15BFF16D25CFF16D45DFF17D55FFF17D660FF18D861FF18DF
              65FF18DD65FF1B9B35FF1C630BFF1C680FFF1C6B11FF1C6B11FF25711ADBA2C3
              9E58FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00A2C29D5827721CD91C6B11FF1C6B11FF1C660DFF1D640CFF1794
              2DFF12CC58FF12CE59FF13CC57FF14CD58FF14CF5AFF15D05BFF16D25CFF16D3
              5DFF16D55EFF17D55FFF18D75FFF18E268FF18DF66FF1A9D35FF1C660DFF1C6A
              10FF1C6B11FF1C6B11FF2A7420D5AFCBAB4AFFFFFF00FFFFFF00B3CEB0462D76
              23D31C6B11FF1C6B11FF1C670EFF1D630CFF18952EFF12CE58FF12D15AFF14CC
              57FF14CE59FF14CF5AFF15D15BFF15D25CFF16D35DFF16D45FFF17D55FFF18D7
              60FF18DF65FF18DD64FF1A9C35FF1B640BFF1C6A0FFF1C6C11FF1C6B11FF2772
              1CD9A0C19B5AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00A9C7A45227721CD91C6B11FF1C6B11FF1C690FFF1C6A
              10FF189630FF11CD58FF12D059FF14CB57FF14CE59FF14CF59FF15D15AFF16D2
              5CFF16D45EFF16D55EFF17D55FFF17D760FF18E168FF18DB63FF1B9A33FF1C64
              0CFF1C680FFF1C6B11FF1C6B11FF2F7725D1A5C4A154FFFFFF00FFFFFF00C2D8
              C036367C2CC91C6B11FF1C6B11FF1C6B11FF1C6910FF18922FFF11CE59FF13CF
              5AFF13CB56FF14CE59FF14CF5AFF15D15BFF15D25CFF16D35DFF16D55EFF17D6
              5FFF17D65EFF18DE66FF18DE65FF1B9C35FF1C630CFF1C690FFF1C6C11FF1C6B
              11FF317927CFA5C4A154FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A7F31C51C6B11FF1C6B11FF1C6A
              10FF1C670EFF169E37FF11D35CFF12CF59FF14CB57FF14CE58FF14D059FF15D1
              5BFF15D35CFF16D45DFF16D65EFF17D75FFF17D860FF18E167FF19D761FF1A8E
              2BFF1C5F07FF1C680EFF1C6B11FF1C6B11FF347B2ACBB6CFB244FFFFFF00FFFF
              FF00F3F7F302649A5D991C6B11FF1C6B11FF1C6B11FF1C680FFF18912CFF11D2
              5AFF12CF59FF14CB56FF14CE59FF14D05AFF15D05BFF15D25CFF16D45CFF16D4
              5EFF17D75FFF17D75FFF18DE66FF18E067FF1B9C35FF1C620BFF1C680FFF1C6C
              11FF1C6B11FF2F7725D1B7D0B342FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004C8A43B31C6B
              11FF1C6B11FF1C6A11FF1C670EFF17912CFF13CD57FF13D15AFF14CC58FF14CF
              5AFF15D05BFF15D15CFF16D35CFF17D45DFF17D760FF17D760FF18DF65FF18DD
              64FF1B912DFF1C5E07FF1C660DFF1C6B11FF1C6B11FF327A28CDB8D1B442FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0073A46C891C6B11FF1C6B11FF1C6B11FF1C68
              0FFF1A8523FF13C853FF13D15CFF14CC58FF15CF59FF15D15BFF15D25BFF16D2
              5DFF16D55EFF17D65EFF17D65FFF18DF65FF18DF67FF1A9D36FF1C620BFF1C66
              0DFF1C6B11FF1C6B11FF25711ADBA8C6A452FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00BFD5BC3A2F7725D11C6B11FF1C6B11FF1C6B10FF1C650CFF198D29FF13CC
              58FF14D45DFF15CF5AFF15D15BFF15D25CFF16D45EFF17D55FFF17D760FF18DE
              65FF18DE65FF1A9E35FF1C6109FF1C670EFF1C6C12FF1C6B11FF307826CFB4CE
              B144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2E2D0263F8235C11C6B
              11FF1C6B11FF1C6B11FF1C650DFF198927FF14CE59FF13D65FFF15CF5AFF15D1
              5BFF16D35DFF16D45DFF17D65FFF17D65FFF17DE65FF18DF66FF1A9D35FF1C63
              0BFF1C660DFF1C6B11FF1C6B11FF25711ADB9DBF985EFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B2CDAE48317927CF1C6B11FF1C6C11FF1C68
              0FFF1C630BFF198D2AFF15CD58FF15D65EFF15D25CFF16D35DFF16D55EFF17D6
              5EFF17DC63FF18DB63FF1A9F37FF1C650DFF1C670EFF1C6C11FF1C6B11FF2873
              1ED7A2C29D58FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C2D7BF36397E30C51C6B11FF1C6B11FF1C690FFF1C650CFF1A8E2AFF14D0
              5AFF14D961FF15D25CFF16D35DFF16D55EFF17D65FFF17DB63FF18DC63FF1A9E
              36FF1C630CFF1C660EFF1C6B11FF1C6B11FF29741FD79BBE9660FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1D6BE383E81
              34C11C6B11FF1C6B11FF1C6910FF1C630DFF1A8726FF16CF59FF16DA61FF16D4
              5DFF17D55EFF17DD64FF19D760FF1B932FFF1C660DFF1C690FFF1C6B11FF1C6B
              11FF307826CFABC8A74EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C2D7BF363B7F32C31C6B11FF1C6B11FF1C6A
              0FFF1C620BFF1A8625FF16CB56FF15DB63FF16D45EFF17D55EFF17DB63FF18DD
              64FF1B9C35FF1C630BFF1C680EFF1C6C11FF1C6B11FF327A28CDB2CDAE48FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C6DAC3323C8033C31C6B11FF1C6B11FF1C6910FF1C630BFF1A90
              2CFF15D55EFF16DB62FF17DD64FF18D860FF1B902CFF1C620AFF1C690FFF1C6B
              11FF1C6B11FF317927CFB4CEB144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343A7F
              31C51C6B11FF1C6C11FF1C6A0FFF1C6009FF1A8323FF16CC58FF17DB63FF17DB
              63FF17DD64FF1A9E37FF1C640BFF1C680EFF1C6B11FF1C6B11FF25711ADBB2CD
              AF46FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7D0B3422F7725D11C6B11FF1C6B
              11FF1C6A0FFF1C630CFF1A912EFF17DB62FF17E368FF1A9932FF1C620AFF1C69
              0FFF1C6B11FF1C6B11FF327A28CDB5CFB244FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C5D9C234387E2FC71C6B11FF1C6C12FF1C6A10FF1C6109FF1B87
              25FF17D55FFF17DF67FF1A9E36FF1C630CFF1C680FFF1C6C11FF1C6B11FF2470
              19DD9DBF985EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFCB
              AB4A2E7724D11C6B11FF1C6B11FF1C680EFF1C640DFF1A9932FF1AA139FF1C68
              0FFF1C670EFF1C6B11FF1C6B11FF28731ED7ACC9A84EFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4D9C134347B2ACB1C6B11FF1C6B
              11FF1C690FFF1C630BFF1A9832FF1A9F38FF1C660CFF1C670EFF1C6C11FF1C6B
              11FF26711BDB98BC9362FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00B6CFB2443A7F31C51C6B11FF1C6B11FF1C6A10FF1C66
              0DFF1C650DFF1C690FFF1C6B11FF1C6B11FF2C7522D3A3C39F56FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0D6
              BD38387E2FC71C6B11FF1C6B11FF1C6A10FF1C660DFF1C660DFF1C690FFF1C6C
              11FF1C6B11FF307826CFA2C29D58FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343B7F32C31C6B
              11FF1C6B11FF1C6A11FF1C6910FF1C6B11FF1C6B11FF2C7522D3AECAAA4CFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C2D8C036397E30C51C6B11FF1C6B11FF1C6A10FF1C6A
              10FF1C6B11FF1C6B11FF2C7522D3B2CDAE48FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C0D6BD382F7725D11C6B11FF1C6B11FF1C6B11FF1C6B11FF2E7724D1B0CB
              AC4AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2D7BF36387E2FC71C6B
              11FF1C6B11FF1C6B11FF1C6B11FF206E16DFA0C19B5AFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00AECAAA4C29741FD71C6B11FF1C6B11FF2F77
              25D1B0CBAC4AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C2D7BF36387D2EC71C6B11FF1C6B11FF206D15E196BB9164FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5CFB2444385
              3AFF3B7F32FFAECAAA4CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C4D9C1344B8A42FF3F8235FFA4C4A056FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00}
            Stretch = True
            Transparent = True
          end
          object img88: TImage
            Left = 340
            Top = 32
            Width = 80
            Height = 60
            Picture.Data = {
              0B54504E4747726170686963B6700000424DB670000000000000360000002800
              00005A0000005000000001002000000000008070000000000000000000000000
              000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C5D9C2344F8C46FF26711BFF699D62FFE6EFE517FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2E2D03654904CFF2D76
              23FF5B9453FFD3E3D135FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C1D6BE383A7F31C51C6B11FF1C6B11FF1C6B11FF5E9656E2E6EF
              E517FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D7E5D52E4B8A
              42FF1C6B11FF1C6B11FF1C6B11FF4A8942FFDBE7D929FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00D2E1CF263D8034C11C6B11FF1C6B11FF1C6B11FF1C6B
              11FF1C6B11FF5E9656E2E7EFE617FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D8E5
              D62E4B8A42FF1C6B11FF1C6B11FF1C6B11FF1C6B11FF1C6B11FF54904CF6E9F0
              E815FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00D9E6D71E4A8942B31C6B11FF1C6B11FF1C6B
              11FF1D6A10FF1C6B11FF1C6B11FF1C6B11FF5D9555E5E5EEE41AFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D7E5D52E4A8942FF1C6B11FF1C6B11FF1C6A11FF1D6910FF1C6B11FF1C6B
              11FF1C6B11FF5F9757E8E7EFE617FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9DCC6304A8942B31C6B11FF1C6B
              11FF1C6B11FF1D6A10FF1D6B11FF1D6A11FF1C6B11FF1C6B11FF1C6B11FF5D95
              55E5E4EEE31AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00D0E0CE3945863CFF1C6B11FF1C6B11FF1C6B11FF1D6910FF1B6B
              12FF1D6A10FF1C6B11FF1C6B11FF1C6B11FF599351F0D9E6D72CFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4D9C1343C8033C31C6B
              11FF1C6B11FF1D6A10FF1F670EFF147919FF088D25FF177416FF1E670FFF1C6B
              11FF1C6B11FF1C6B11FF5F9757E2E8F0E714FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00DAE7D82B46863DFF1C6B11FF1C6B11FF1D6B10FF1F68
              0EFF147819FF078C27FF167317FF1E670FFF1D6B10FF1C6B11FF1C6B11FF4B8A
              42FFD8E5D62FFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C8DBC5303D80
              34C11C6B11FF1C6B11FF1C6A11FF1E680FFF157518FF03932BFF009D30FF078D
              25FF1A6D12FF1E680FFF1C6B11FF1C6B11FF1C6B11FF62995BDDE7EFE617FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00DAE7D82B4D8B44FC1C6B11FF1C6B11FF1C6B
              11FF1F670EFF177115FF04922AFF009B30FF059028FF177215FF1E670FFF1C6B
              11FF1C6B11FF1C6B11FF508D47FFE3ECE11DFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAE7
              D81E498941B51C6B11FF1C6B11FF1C6B11FF1F670FFF167617FF03932AFF0099
              2EFF00962CFF009A2FFF078B25FF1A6D13FF1E680FFF1C6B11FF1C6B11FF1C6B
              11FF62995BDDE9F0E814FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00DAE7D82B508D47F91C6B11FF1C6B
              11FF1C6B11FF1F660EFF187015FF059028FF00982DFF00962CFF00992EFF0590
              28FF187015FF1E670EFF1C6B11FF1C6B11FF1C6B11FF63995CDFEBF2EA12FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D5E4D3224E8C45B11C6B11FF1C6B11FF1C6B11FF1F680FFF177316FF0492
              29FF009A2EFF00962CFF00962CFF00962DFF009C30FF078D28FF197014FF1D68
              0FFF1C6B11FF1C6B11FF1C6B11FF619859DFE3EDE21DFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D4E3D2344D8B44FC1C6B
              11FF1C6B11FF1C6A11FF1F680FFF177216FF059028FF009A2EFF00962CFF0096
              2CFF00972CFF009B2FFF078F29FF1A6F13FF1E670FFF1C6A11FF1C6B11FF1C6B
              11FF61985AE2E2ECE020FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C8DBC530418338BD1C6B11FF1C6B11FF1D6A10FF1F670EFF1674
              16FF03922AFF00992EFF00962CFF00962CFF00962CFF01972DFF01992FFF009D
              32FF06942BFF197316FF1F670DFF1C6B11FF1C6B11FF1C6B11FF5C9554E5EBF2
              EA11FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3E3D1344787
              3EFF1C6B11FF1C6B11FF1C6A11FF1E680FFF167517FF03932BFF009A2FFF0097
              2CFF00962CFF00962CFF00972DFF019A2EFF009E32FF06942CFF177215FF1F65
              0DFF1C6A11FF1C6B11FF1C6B11FF528E4AF9D8E5D62FFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00D6E4D422408236BF1C6B11FF1C6B11FF1C6A11FF1E68
              0FFF167417FF03922AFF009A2FFF00962CFF00962CFF00962CFF00972CFF0198
              2DFF019A2FFF029C30FF00A234FF08962DFF1A6F14FF1F650DFF1C6B11FF1C6B
              11FF1C6B11FF659B5ED7ECF3EB0EFFFFFF00FFFFFF00FFFFFF00FFFFFF00E6EF
              E517538F4BF41C6B11FF1C6B11FF1C6B11FF1D6910FF167416FF03932AFF009A
              2FFF00962CFF00962CFF00962CFF00962CFF01982EFF019A2FFF019B31FF00A2
              35FF07962DFF187215FF1E660EFF1C6B11FF1C6B11FF1C6B11FF4F8C46FFDDE9
              DC26FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007CAA76811C6B11FF1C6B11FF1C6B
              11FF1D680FFF157518FF03942BFF00992EFF00962CFF00962CFF00962CFF0096
              2CFF00982DFF019A2FFF029B31FF029C31FF029E32FF01A537FF0A932BFF1C6C
              13FF1E650DFF1C6B11FF1C6B11FF1C6B11FF669B5ED7EBF2EA11FFFFFF00FFFF
              FF00FFFFFF009BBE968A1C6B11FF1C6B11FF1C6B11FF1D6B10FF177215FF0491
              2AFF009A2FFF00952CFF00962CFF00962CFF00962CFF00972EFF01992EFF019A
              2FFF029C30FF039E32FF01A537FF07982EFF197215FF1E660EFF1C6B11FF1C6B
              11FF1C6B11FF5C9554EAEBF2EA12FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF007AA974811C6B
              11FF1C6B11FF1C6B11FF1E680FFF157718FF02962CFF009A2FFF00962CFF0096
              2CFF00962DFF00962DFF01982EFF029A2FFF029B31FF029E32FF039E32FF02A1
              35FF01A839FF0B932CFF1B6C12FF1E650DFF1C6B11FF1C6B11FF1C6B11FF679C
              5FD7EAF1E911FFFFFF00FFFFFF009ABD958A1C6B11FF1C6B11FF1C6B11FF1D6A
              10FF177215FF03932BFF009B2FFF00962CFF00962CFF00962CFF00972DFF0198
              2EFF029A30FF029B31FF029D31FF039E32FF039F33FF01A73AFF099830FF1A6E
              14FF1D660EFF1C6B11FF1C6B11FF1C6B11FF699D62D6EAF1E912FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00D7E5D520498941B51C6B11FF1C6B11FF1C6A11FF1E690FFF167517FF0590
              28FF00992EFF00962CFF00972DFF01982EFF029A2FFF029B31FF039D32FF039F
              33FF039F33FF04A035FF04A337FF03AA3BFF0B992FFF197216FF1D670EFF1C6B
              11FF1C6B11FF1C6B11FF619859DFE7EFE617FFFFFF00E7EFE617609758FF1C6B
              11FF1C6B11FF1C6B11FF1D6910FF167517FF059229FF009B2FFF00962CFF0198
              2DFF01992EFF019A2FFF029C31FF039D31FF039E32FF039F33FF04A135FF04A2
              37FF03A83BFF0B972FFF197215FF1E660DFF1C6B11FF1C6B11FF1C6B11FF6097
              58E5DDE9DC26FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00D4E3D2244A8942B31C6B11FF1C6B11FF1D6A
              10FF1F670EFF187215FF059028FF009A2EFF01992EFF019A2FFF029C31FF039E
              32FF039F33FF03A034FF04A135FF04A235FF05A337FF06A639FF03AD3DFF0A9E
              33FF197317FF1E670FFF1C6B11FF1C6B11FF1C6B11FF659B5ED7ECF3EB0EFFFF
              FF00DFEADD1B4F8C46C11C6B11FF1C6B11FF1C6A11FF1F670EFF167316FF0490
              29FF009A2FFF01992EFF019A30FF029C30FF029E32FF039E33FF03A034FF04A2
              34FF04A235FF05A337FF05A638FF05AC3CFF0A9C33FF1A7316FF1E660DFF1C6B
              11FF1C6B11FF1C6B11FF528E4AF9DBE7D929FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D3E3D1244989
              41B51C6B11FF1C6B11FF1C6B11FF1E680FFF187416FF04942CFF009C31FF029A
              2FFF029C31FF039E33FF03A033FF04A134FF04A235FF04A337FF05A538FF06A6
              38FF06A83AFF05AE3FFF0D9B31FF1B6F13FF1D680FFF1C6B11FF1C6B11FF1C6B
              11FF6B9F64FFEDF3EC0BFFFFFF00D2E2D00A48873FFF1C6B11FF1C6B11FF1C6B
              11FF1E680FFF177316FF05932AFF009D30FF029B30FF029C31FF039E33FF039F
              33FF03A034FF04A135FF05A337FF05A638FF06A639FF06A83AFF05AD3EFF0B9E
              34FF197315FF1E650DFF1C6B11FF1C6B11FF1C6B11FF57914FF3E3ECE11DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00D3E3D12444853BBB1C6B11FF1C6B11FF1C6B11FF1E6910FF1678
              1AFF02992EFF00A033FF029D32FF039E33FF04A034FF04A235FF04A236FF05A5
              37FF05A638FF06A63AFF07A83BFF07AA3CFF06B041FF0D9931FF1B6E13FF1E66
              0DFF1C6B11FF1C6B11FF1C6B11FF6A9E63A2ECF3EB01FFFFFF00CFE0CD2D4787
              3EFF1C6B11FF1C6B11FF1C6B11FF1F670EFF177316FF04952CFF00A033FF029D
              31FF039F33FF03A034FF04A135FF04A236FF05A337FF06A538FF06A739FF06A8
              3BFF07AA3BFF05B140FF0CA035FF1A7115FF1D640CFF1C6B11FF1C6B11FF1C6B
              11FF6B9F64D3EEF4ED0CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C3D8C0363E8134C11C6B11FF1C6B
              11FF1D6A10FF1E680FFF15781AFF059930FF01A336FF03A134FF04A135FF04A2
              36FF05A336FF05A437FF06A639FF06A83BFF07AA3BFF07AA3CFF08AC3EFF06B2
              42FF0E9B33FF1A7014FF1E660DFF1C6A10FF1C6B11FF1C6B11FF699D62FFE3ED
              E20BFFFFFF00D0E0CE594F8C46FF1C6B11FF1C6B11FF1C6B11FF1F670DFF1675
              17FF05972EFF01A336FF03A134FF04A134FF04A335FF04A336FF05A439FF06A6
              39FF06A83AFF07A93BFF07AA3CFF07AC3EFF06B342FF0D9F35FF1A7015FF1E65
              0DFF1C6A10FF1C6B11FF1C6B11FF6B9F64D3E6EFE517FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0E0
              CE2847873EB71C6B11FF1C6B11FF1C6A10FF1E660EFF187417FF069A2FFF01A5
              38FF04A336FF05A437FF05A538FF05A639FF06A83AFF07A93CFF07AB3DFF07AC
              3EFF08AD3EFF09AF41FF08B745FF0DA439FF1A7216FF1E650CFF1C6B11FF1C6B
              11FF1C6B11FF5F9757FFEDF3EC16FFFFFF00DFEADDFF55904DFF1C6B11FF1C6B
              11FF1D6B11FF1F660EFF177417FF069A30FF02A638FF04A236FF04A437FF05A5
              38FF05A63AFF06A83AFF07A93CFF07AB3DFF07AC3EFF08AD3EFF08AF40FF08B7
              45FF0DA439FF1A7316FF1E640CFF1C6B11FF1C6B11FF1C6B11FF599250F0DEEA
              DC26FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00D4E3D22446863DB91C6B11FF1C6B11FF1D6A11FF1F64
              0CFF177316FF059D32FF02A839FF05A538FF05A739FF06A839FF07AA3BFF07AA
              3CFF08AB3EFF08AE3EFF08AE40FF09B041FF0AB242FF07BA48FF0DA53AFF1B6F
              13FF1E640BFF1C6B11FF1C6B11FF1C6B11FF6A9E63FFFFFFFF00FFFFFF0CDAE7
              D81C45863CFF1C6B11FF1C6B11FF1C6B11FF1F650DFF177417FF069D31FF02A8
              3AFF05A437FF05A638FF06A83AFF07A83CFF07AA3CFF08AC3DFF08AE3EFF08AF
              3FFF09AF40FF0AB242FF07BB49FF0DA73AFF1A7316FF1E650DFF1C6B11FF1C6B
              11FF1C6B11FF538F4BF9E0EBDE23FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2E2D02644853BBB1C6B
              11FF1C6B11FF1C6A10FF20640CFF167A1BFF06A337FF04A93BFF06A739FF06A8
              3AFF07AA3DFF08AC3EFF08AE3FFF09AE3FFF09B040FF0AB242FF0AB243FF0AB5
              45FF09BD4BFF11A136FF1B6C11FF1D650CFF1C6B11FF1C6B11FF1C6B11FF6FA1
              68FFFFFFFF00FFFFFF0CD1E1CEFF43853AFF1C6B11FF1C6B11FF1C6A11FF1F65
              0DFF177618FF079E33FF04AB3CFF06A739FF07A83BFF07AA3CFF08AC3DFF08AC
              3EFF08AE3FFF09AF40FF09B141FF0AB242FF0AB443FF09BD4AFF0FA73BFF1B72
              16FF1D650DFF1C6C11FF1C6B11FF1C6B11FF61985AE2EEF4ED0CFFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CDDECB2A387D2EC71C6B11FF1C6B11FF1D6A10FF1E660EFF157E1DFF07A4
              37FF05AB3DFF07A93AFF07AB3DFF08AC3EFF08AE3FFF09AF40FF09B041FF0AB2
              42FF0AB343FF0BB444FF0BB847FF0AC04BFF11A037FF1B6D13FF1D650CFF1C6B
              11FF1C6B11FF1C6B11FF6EA067FFFFFFFF00FFFFFF00CCDECA4246863DFF1C6B
              11FF1C6B11FF1D6B10FF1E660DFF177619FF08A135FF04AE3EFF07A93BFF08AB
              3DFF08AD3EFF08AE3FFF09AF40FF09B041FF09B242FF0BB443FF0BB444FF0BB6
              45FF0ABE4BFF10A73CFF1B7014FF1D650DFF1C6C11FF1C6B11FF1C6B11FF71A3
              6BCAEEF4ED0CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00CADDC82E428439BD1C6B11FF1C6B11FF1C6A
              10FF1D680FFF17791BFF09A136FF05AF3FFF08AC3EFF08AD3EFF09AF40FF09B0
              41FF0AB142FF0AB343FF0BB544FF0BB645FF0BB646FF0BBB49FF0CC04DFF11A8
              3CFF1A7417FF1D660DFF1C6B11FF1C6B11FF1C6B11FF5F9757FFE6EFE518FFFF
              FF00DBE7D92A55904DFF1C6B11FF1C6B11FF1C6A11FF1E670DFF17781AFF08A3
              37FF05B140FF08AC3EFF08AD3FFF09AF40FF09B041FF09B142FF0AB343FF0BB5
              44FF0BB646FF0CB646FF0CB948FF0BBF4BFF11A83CFF1B7217FF1D640DFF1C6B
              11FF1C6B11FF1D6C12FF619859E5E3EDE21DFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D0E0CE284385
              3ABB1C6B11FF1C6B11FF1C6A11FF1D670FFF187719FF09A638FF06B242FF09AF
              40FF09B041FF09B142FF0AB242FF0BB445FF0BB546FF0BB646FF0CB747FF0CB9
              47FF0EBA4AFF0DC24FFF11AD40FF1B7317FF1D670EFF1C6C11FF1C6B11FF1C6B
              11FF6C9F65D8FFFFFF00FFFFFF00DDE9DC15498840FF1C6B11FF1C6B11FF1C6B
              11FF1E660EFF187719FF09A639FF06B342FF09AE3FFF09AF40FF09B241FF0AB2
              42FF0AB444FF0BB544FF0CB746FF0CB847FF0CB948FF0DBB48FF0DC34EFF11AD
              3FFF1A7316FF1D630CFF1C6B11FF1C6B11FF1C6B11FF599250F0E3ECE11DFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00CFE0CD2843853ABB1C6B11FF1C6B11FF1C6B11FF1D650DFF1779
              1AFF0AAC3DFF07B545FF0AB141FF0AB342FF0AB443FF0BB645FF0CB746FF0CB8
              47FF0CB948FF0DBB49FF0EBC4AFF0EBE4AFF0DC552FF13A93EFF1D6D13FF1D65
              0EFF1C6C11FF1C6B11FF1C6B11FF71A26AFFFFFFFF00FFFFFF0DCCDECAFF4284
              39FF1C6B11FF1C6B11FF1C6B11FF1E640DFF17781AFF0BA73AFF07B444FF0AB0
              42FF0AB242FF0AB242FF0BB444FF0BB547FF0CB748FF0DBA48FF0DBB48FF0DBB
              4AFF0EBE4CFF0DC651FF12AE40FF1B7316FF1D640BFF1C6A11FF1C6B11FF1C6B
              11FF599351F0E5EEE41AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CCDECA2C3E8134C11C6B11FF1C6B
              11FF1D6A10FF1E650DFF16811FFF09B040FF08B745FF0AB343FF0BB444FF0BB6
              46FF0CB747FF0CB948FF0DBA48FF0DBB4AFF0EBE4BFF0EBF4CFF0FC04DFF0FC7
              53FF14A53BFF1C6B11FF1D640CFF1C6B11FF1C6B11FF1C6B11FF72A36CFFFFFF
              FF00FFFFFF00CBDDC962418338FF1C6B11FF1C6B11FF1C6A10FF1E630CFF1879
              1AFF0BA93CFF08B646FF0AB343FF0BB444FF0BB645FF0CB846FF0CB948FF0DBA
              49FF0DBB4AFF0EBC4BFF0EBE4CFF0FC14EFF0EC954FF13B042FF1B7316FF1D63
              0BFF1C6A11FF1C6B11FF1C6B11FF6C9F65D3F3F7F303FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00BFD5
              BC3A3C8033C31C6B11FF1C6B11FF1D6910FF1E640CFF168120FF0BAE40FF09BA
              48FF0BB645FF0CB747FF0CB847FF0CB948FF0DBA49FF0EBC4BFF0EBF4CFF0FBF
              4DFF0FC14EFF0FC450FF0FCA55FF15A93DFF1C7015FF1D630CFF1C6A11FF1C6B
              11FF1C6B11FF70A269FFE8F0E71FFFFFFF00CCDECA624A8942FF1C6B11FF1C6B
              11FF1D6A11FF1E640CFF187A1CFF0BAC3EFF09B947FF0BB544FF0BB646FF0CB8
              48FF0DBA48FF0DBB49FF0DBC4AFF0EBD4BFF0FBF4DFF0FC04DFF0FC34FFF0FCD
              56FF13AF42FF1C7115FF1D630CFF1C6B11FF1C6B11FF1C6B11FF71A26ACAEAF1
              E912FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00CDDECB2A408337BF1C6B11FF1C6B11FF1D6910FF1E63
              0BFF187A1CFF0DAE40FF0ABD4AFF0CB847FF0CBA48FF0DBA49FF0DBB4AFF0EBC
              4BFF0FBE4CFF0FC04DFF0FC24FFF10C24FFF11C652FF10D05AFF14B446FF1B72
              17FF1D640CFF1C6B11FF1C6B11FF1C6B11FF62995BFFF0F5EF0DFFFFFF00DDE9
              DCFF4E8C45FF1C6B11FF1C6B11FF1C6B11FF1E640DFF187B1DFF0CAE41FF0ABC
              4AFF0CB747FF0CB948FF0DBB4AFF0DBC4BFF0EBE4CFF0EBE4CFF0FC04DFF0FC1
              4EFF10C24FFF10C551FF10CE59FF14B244FF1B7316FF1D630BFF1C6B11FF1C6B
              11FF1C6B11FF5F9757E8E6EFE517FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFE0CD28408236BF1C6B
              11FF1C6B11FF1C6A10FF1E620BFF187A1BFF0DB243FF0BBF4DFF0DB948FF0DBC
              49FF0EBD4AFF0FBE4DFF0FC04EFF10C24FFF10C350FF10C451FF11C551FF10C7
              54FF10D35CFF14B545FF1C6F14FF1C640CFF1C6C11FF1C6B11FF1C6B11FF72A3
              6CFFFFFFFF00FFFFFF08D2E2D031408236FF1C6B11FF1C6B11FF1C6A11FF1D64
              0DFF187B1DFF0DB143FF0BC14EFF0DB948FF0EBB49FF0EBD4BFF0EBE4CFF0FBE
              4DFF10C04EFF10C350FF10C350FF11C451FF12C752FF10D05BFF14B446FF1B72
              16FF1C630BFF1C6C11FF1C6B11FF1C6B11FF5D9555EAE7EFE617FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00CDDECB2A418338BD1C6B11FF1C6B11FF1C6B10FF1E630BFF188120FF0DBA
              4AFF0CC04EFF0EBC4AFF0EBD4CFF0FC04EFF10C14FFF10C250FF11C450FF11C5
              51FF11C653FF12C652FF12CB55FF12D55EFF16AC41FF1C6A11FF1C650CFF1C6C
              11FF1C6B11FF1C6B11FF75A56EF7FFFFFF00FFFFFF00CADCC742408236FF1C6B
              11FF1C6B11FF1C6A10FF1E630CFF187D1DFF0EB545FF0CC24FFF0EBD4AFF0FBE
              4CFF0FBF4DFF0FC04DFF10C24FFF10C351FF11C551FF11C653FF12C753FF12C9
              56FF11D35CFF14B646FF1B7316FF1C630CFF1C6C12FF1C6B11FF1C6B11FF669B
              5EDCF1F6F009FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C6DAC332387D2EC71C6B11FF1C6C11FF1D6A
              10FF1D650CFF178725FF0DBC4AFF0DC24FFF0FBE4DFF0FC04DFF10C24FFF10C4
              51FF11C552FF11C653FF12C753FF12C955FF13C956FF13CD58FF13D55EFF17AB
              3FFF1B6C12FF1C670DFF1C6B11FF1C6B11FF1D6C12FF75A56EF7FFFFFF00FFFF
              FF00C9DCC602408337BF1C6B11F01C6B11FF1C6A10FF1E630BFF197D1EFF0FB6
              47FF0DC450FF0FBF4DFF0FC14EFF10C24FFF10C350FF11C551FF11C652FF11C7
              53FF13C955FF13CA56FF13CC58FF13D55FFF16B747FF1B7116FF1C630BFF1C6B
              11FF1C6B11FF1C6B11FF75A56EC4F3F7F206FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343E81
              34C11C6B11FF1C6B11FF1C690FFF1D660DFF188020FF0FB747FF0EC651FF10C1
              4EFF10C350FF11C552FF11C652FF11C753FF12C854FF12CA56FF13CC57FF14CC
              57FF14D15AFF14D65EFF17B547FF1B7418FF1C650CFF1C6C11FF1C6B11FF1E6C
              13FF659B5ED7E7EFE617FFFFFF00FFFFFF00508D47AA1C6B11FF1C6B11FF1C69
              10FF1D630CFF187D1FFF0FB847FF0EC652FF0FC14FFF10C350FF11C551FF11C6
              52FF11C753FF12C855FF13CA55FF13CC56FF14CD58FF14D05BFF14D761FF16B7
              48FF1B7217FF1C620BFF1C6B11FF1C6B11FF1E6C13FF669B5EDCE6EFE517FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C9DCC6303E8134C11C6B11FF1C6B11FF1C6A11FF1D640DFF187F
              1FFF10BA49FF0FC854FF11C450FF11C552FF11C653FF12C853FF12C955FF13CB
              56FF13CD58FF14CE58FF14CF59FF15D15BFF15DA62FF18BA4BFF1C7317FF1C64
              0CFF1C6C11FF1C6B11FF1C6B11FF75A56EFFF3F7F21AFFFFFF00FFFFFF004485
              3BBB1C6B11FF1C6B11FF1C6A10FF1D630BFF197F1FFF10BA49FF0FC954FF10C3
              50FF11C552FF11C653FF12C754FF12C854FF13CA56FF14CD58FF14CD59FF14CE
              59FF15D15BFF15DA62FF17BA4BFF1B7216FF1C620BFF1C6B11FF1C6B11FF1C6B
              11FF61985AE2EAF1E912FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C7DAC4323E8134C11C6B11FF1C6B
              11FF1C6A10FF1D640DFF188020FF11C24EFF10CD57FF11C652FF12C753FF12C8
              54FF12CA55FF13CC57FF14CE58FF14CE58FF15CF5AFF15D15BFF15D35DFF16DC
              64FF18B749FF1C6A11FF1C630BFF1C6C11FF1C6B11FF1C6B11FF79A772FFFFFF
              FF00FFFFFF00C5D9C2103B7F32FF1C6B11FF1C6B11FF1C6A11FF1D630CFF1880
              20FF11BE4CFF10CC56FF11C652FF12C753FF12C854FF12C956FF13CB56FF14CD
              57FF14CE59FF15CF5AFF15D05BFF15D25DFF16DD64FF19BA4CFF1C7217FF1C62
              0AFF1C6B11FF1C6B11FF1C6B11FF63995CDFEFF5EE0CFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C9DC
              C6303B7F32C31C6B11FF1C6B11FF1C6A10FF1E630AFF198A28FF11C954FF11CF
              59FF12C954FF12CA55FF13CB56FF13CD57FF14CF59FF15CF5AFF15D15BFF15D2
              5CFF16D25EFF16D65EFF17DF65FF19B043FF1C680FFF1C610AFF1C6C12FF1C6C
              12FF1C6B11FF79A87379FFFFFF00FFFFFF00C6DAC3FF3C8033FF1C6B11FF1C6B
              11FF1C6A11FF1C620BFF198120FF12C14DFF11CF59FF12C854FF12CA55FF13CB
              56FF14CD57FF14CF59FF14D05AFF15D15BFF15D25BFF16D35DFF16D65FFF17E2
              68FF19BD4DFF1B7116FF1C610AFF1C6B11FF1C6B11FF1C6B11FF71A26ACAF2F6
              F106FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C2D7BF363A7F31C51C6B11FF1C6C11FF1D6810FF1E61
              0BFF188826FF13C352FF13D15BFF13CC56FF13CD57FF14CF58FF14D15AFF15D2
              5BFF16D25CFF16D35DFF16D55EFF17D65FFF17DB63FF18E369FF19B648FF1B70
              15FF1C620AFF1C6B11FF1C6B11FF1C6B11FF71A36BFBFFFFFF00FFFFFF00CBDD
              C906498840B51C6B11FF1C6B11FF1C6A10FF1E620AFF1A8020FF13C14FFF11D2
              5BFF13CA56FF13CD57FF14CF58FF15D15AFF15D25CFF15D35DFF16D45CFF16D6
              5EFF17D660FF17D961FF17E46AFF19BD4EFF1C7115FF1C620AFF1C6B11FF1C6B
              11FF1C6B11FF71A36BCAEAF1E912FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343A7F31C51C6B
              11FF1C6B11FF1C670EFF1D6008FF1A8221FF14C552FF13D25CFF14CD58FF14D0
              5AFF15D15BFF16D25BFF16D45DFF17D55EFF17D560FF18D860FF18D861FF18DE
              65FF18E96EFF19C150FF1C7215FF1C630BFF1C6B11FF1C6B11FF1C6B11FF6A9E
              6387FFFFFF00FFFFFF00D7E5D5204A8942B31C6B11FF1C6B11FF1C6910FF1D61
              0AFF1A8222FF13C652FF12D45CFF14CC57FF15CE5AFF15D05CFF16D35CFF16D4
              5DFF16D55EFF17D760FF17D861FF18D860FF19DC63FF19E76CFF1AC04FFF1C70
              15FF1C620AFF1C6B12FF1C6B11FF1C6B11FF649A5DDFEAF1E912FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C8DBC5303A7F31C51C6B11FF1C6C11FF1C690FFF1D630BFF1A8422FF14C5
              53FF14D15BFF15D05AFF15D15BFF16D35CFF16D55EFF17D55FFF17D860FF18D8
              61FF18D962FF19DA62FF19DE65FF19EA6EFF1BC151FF1C7014FF1C640BFF1C6B
              11FF1C6B11FF1D6C12D77BA9753BFFFFFF00FFFFFF00CADDC82E3A7F31C51C6B
              11FF1C6B11FF1C6910FF1D640BFF198424FF14C754FF14D45DFF15CF5AFF16D1
              5CFF16D35DFF16D45EFF17D55FFF17D75FFF18D862FF19D962FF19DA62FF19DF
              65FF1AE86DFF1BC04FFF1C7116FF1C620AFF1C6B11FF1C6B11FF1C6B11FF659B
              5EDCEBF2EA12FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343E8134C11C6B11FF1C6B11FF1C6A
              10FF1C640BFF188F2BFF14D25CFF15D15BFF16D25CFF16D45EFF17D55FFF17D6
              60FF17D761FF18D962FF19DA63FF19DC64FF19DB64FF1AE068FF1BEB70FF1CB6
              48FF1C6E14FF1C6910FF1C6B11FF1C6B11FF1F6D14E192B88D68FFFFFF00FFFF
              FF00C1D6BE383E8134C11C6B11FF1C6B11FF1C6910FF1C630BFF198B28FF15CE
              59FF14D65DFF16D25CFF16D45EFF17D55EFF17D65FFF17D860FF18D961FF19DB
              63FF19DC64FF1ADC65FF1AE066FF1BE96DFF1BC151FF1C7417FF1C670EFF1C6B
              11FF1C6B11FF1C6B11FF78A771FFFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1D6BE383078
              26FF1C6B11FF1C6B11FF1C680FFF1C7015FF16C350FF15D861FF16D25DFF17D5
              5DFF17D65FFF17D760FF18D862FF18DA62FF19DB63FF19DC64FF1ADD66FF1ADD
              67FF1BE169FF1BF073FF1CB043FF1C680FFF1C6A10FF1C6B11FF1C6B11FF4485
              3BBBE3ECE114FFFFFF00FFFFFF00C0D6BD382F7725FF1C6B11FF1C6B11FF1C66
              0DFF1C6A10FF17B446FF15DB63FF16D35DFF16D65EFF17D660FF17D760FF17D9
              60FF18DA62FF19DC64FF19DD65FF1ADE65FF1ADF66FF1BE269FF1BF072FF1CC1
              51FF1C6C11FF1C670EFF1C6B11FF1C6B11FF347B2AFFFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0092B88D6826711BFF1C6B11FF1C6B11FF1C660EFF1C7719FF17CB57FF16D8
              60FF16D45DFF17D760FF18D861FF18D962FF18DA62FF19DC64FF19DD65FF1ADE
              66FF1AE067FF1BDF66FF1CEA6FFF1CD961FF1C8F2CFF1C690FFF1C6A10FF1C6B
              11FF1C6B11FF659B5E97EEF4ED08FFFFFF00FFFFFF0092B88D6826711BFF1C6B
              11FF1C6C11FF1C640CFF1B6F15FF17BE4DFF15DB63FF17D45DFF17D65EFF17D6
              60FF18D960FF18DB63FF19DC65FF1ADE65FF1ADF65FF1AE067FF1BE067FF1CE8
              6EFF1CE168FF1C9B34FF1C6910FF1C6910FF1C6B11FF1C6B11FF498941FFFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0089B284721C6B11E51C6B11FF1C6C11FF1C660EFF1C690FFF18A7
              3CFF15D860FF16D35DFF17D55FFF17D760FF18D961FF18DA62FF19DC63FF19DD
              65FF1ADE65FF1ADF66FF1BE067FF1BEB70FF1CE269FF1C8C29FF1C6009FF1C6A
              10FF1C6B11FF1C6B11FF43853ABBCFE0CD28FFFFFF00FFFFFF0089B284721F6D
              14E11C6B11FF1C6C11FF1C660EFF1C690FFF18A53BFF15D760FF17D55FFF17D5
              5EFF17D760FF18D861FF18D962FF18DA63FF19DD64FF1ADF66FF1ADF67FF1BE0
              67FF1BE96EFF1CE168FF1C922EFF1C6008FF1C690FFF1C6B11FF1C6B11FF2E77
              24D1BBD3B83EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF008BB486701C6B11E51C6B11FF1C6B11FF1C650DFF1C66
              0EFF18A138FF15D85FFF16D45EFF16D55EFF17D760FF18D861FF18D962FF19DB
              63FF19DD64FF1ADD65FF1ADE66FF1AE168FF1BEC71FF1BE46AFF1C932FFF1C61
              0BFF1C690FFF1C6B11FF1C6B11FF397E30C5CADCC72EFFFFFF00FFFFFF009ABD
              9660206D15E11C6B11FF1C6B11FF1C670DFF1C680FFF18A43AFF15D961FF16D6
              5FFF17D45EFF17D860FF18D861FF18D962FF18DA62FF19DC64FF19DD65FF1ADF
              67FF1BDF67FF1BEA6EFF1BE269FF1C922EFF1C6109FF1C690FFF1C6C11FF1C6B
              11FF307826CFB5CFB244FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF008DB5886E1E6C13E31C6B11FF1C6B11FF1C63
              0BFF1C640CFF19A238FF15D960FF16D65FFF16D45DFF16D660FF18D961FF18D9
              61FF18DA62FF19DB63FF19DC64FF1ADE66FF1AE067FF1BED70FF1BE36AFF1C93
              30FF1C5F08FF1C680FFF1C6B11FF1C6B11FF307826CFB4CEB144FFFFFF00FFFF
              FF00A7C6A3522A7420D51C6B11FF1C6C11FF1C650EFF1C620AFF189F37FF15DA
              62FF15D660FF16D35DFF17D65FFF17D761FF18DA61FF18DA62FF19DA64FF19DE
              64FF1ADF65FF1ADF66FF1BEA6FFF1BE56BFF1C932FFF1C6009FF1C690FFF1C6B
              11FF1C6B11FF317927CFB4CEB144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0090B68A6C216E17DF1C6B11FF1C6C
              11FF1C650CFF1C6A11FF18A73DFF15D961FF16D75FFF16D35DFF17D65FFF17D8
              60FF17D962FF19DB63FF19DC64FF19DD64FF1ADE65FF1ADF66FF1BEA6EFF1BDB
              62FF1C8E2BFF1C6009FF1C670EFF1C6C11FF1C6B11FF3A7F31C5BAD2B640FFFF
              FF00FFFFFF0096BB91642A7420D51C6B11FF1C6C12FF1C660DFF1C650DFF189C
              35FF15D55EFF16D860FF16D45EFF17D55FFF18D660FF18D862FF18DA62FF19DA
              64FF19DB64FF1ADD65FF1ADE66FF1BEA6FFF1BE369FF1C9A33FF1C620AFF1C69
              0FFF1C6C11FF1C6B11FF3A7F31C5BDD4BA3CFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008EB5886E237018DD1C6B
              11FF1C6B11FF1C660DFF1C670EFF18AA3FFF15DE64FF16D760FF16D35DFF17D5
              5EFF17D75FFF18D861FF18DA62FF19DC64FF1ADD64FF1ADD65FF1ADF65FF1BE8
              6DFF1BDE65FF1C8626FF1C5D07FF1C680FFF1C6C12FF1C6B11FF3E8134C1C7DA
              C432FFFFFF00FFFFFF008CB4876E226F18DD1C6B11FF1C6C11FF1C670FFF1C66
              0EFF18A138FF14D960FF16D660FF16D35DFF17D65EFF17D75FFF18D861FF19DB
              62FF19DB63FF19DC64FF1ADD64FF1ADD66FF1BE86EFF1CE369FF1C9430FF1C60
              0AFF1C680EFF1C6C11FF1C6B11FF307826CFBCD3B93CFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008DB5886E226F
              18DD1C6B11FF1C6B11FF1C680FFF1B670DFF19A037FF15D960FF16D65FFF16D3
              5DFF17D55EFF17D760FF18D861FF18DA62FF19DC64FF19DD64FF1ADE65FF1ADE
              66FF1BE66BFF1BE169FF1C932FFF1C5F08FF1C6810FF1C6C12FF1C6B11FF4183
              38BDC8DBC530FFFFFF00FFFFFF0091B78B6A216E17DF1C6B11FF1C6C11FF1C67
              0EFF1C660DFF18A138FF15D65EFF15D75FFF16D25DFF17D55EFF17D65FFF17D7
              60FF19D962FF19DB64FF19DD64FF1ADE65FF1ADE65FF1AE76CFF1BE268FF1C95
              2FFF1C6009FF1C670EFF1C6B11FF1C6B11FF2E7724D1B3CEB046FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008EB5
              886E206E16DF1C6B11FF1C6B11FF1C670FFF1C680EFF189E36FF15D65EFF16D6
              5EFF16D35DFF17D55EFF17D65FFF17D760FF18D961FF18DB63FF19DD64FF1ADD
              64FF1ADE65FF1AE66BFF1BE168FF1C9732FF1C620AFF1C680FFF1C6B11FF1C6B
              11FF307826CFBCD3B93CFFFFFF00FFFFFF00A9C7A45227721CD91C6B11FF1C6C
              11FF1C680EFF1C660EFF189F36FF15D55EFF15D55EFF16D35DFF17D55EFF17D6
              5FFF17D760FF18D861FF19DA62FF19DC63FF1ADD65FF1ADE65FF1AE66CFF1BE1
              67FF1C9630FF1C5F09FF1C670DFF1C6B11FF1C6B11FF2C7522D3B1CCAD48FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0091B78B6A206D15E11C6B11FF1C6B11FF1C660EFF1C6B11FF17A137FF14D4
              5DFF15D55EFF15D25CFF17D45EFF17D65FFF17D760FF18D861FF18D962FF18DB
              63FF1ADD64FF1ADD65FF1AE66BFF1BDC64FF1B9531FF1C640CFF1C680FFF1C6B
              11FF1C6B11FF327A28CDB2CDAE48FFFFFF00FFFFFF00A6C5A2542B7521D51C6B
              11FF1C6B11FF1C660EFF1C650CFF199B33FF15D45DFF15D55DFF16D25CFF16D3
              5DFF17D55FFF17D760FF18D860FF18D961FF19DB63FF19DD64FF1ADE65FF1AE6
              6BFF1AE268FF1B9833FF1C610AFF1C680FFF1C6B11FF1C6B11FF327A28CDB1CC
              AD48FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0092B88D68206E16DF1C6B11FF1C6B11FF1C660DFF1C6A10FF17AB
              3FFF14D75FFF15D35DFF15D25CFF16D35DFF17D55FFF17D760FF18D861FF18D9
              61FF18DA63FF19DC64FF1ADD65FF1AE86DFF1BD861FF1C8927FF1C620AFF1C6A
              10FF1C6B11FF1C6B11FF3B7F32C3C2D8C036FFFFFF00FFFFFF0092B88D68226F
              18DD1C6B11FF1C6B11FF1C650EFF1C660DFF189E36FF15D55EFF15D55EFF16D2
              5CFF16D45DFF16D55EFF17D760FF18D861FF18D961FF18DA62FF19DC64FF1ADC
              65FF1AE66BFF1ADF66FF1B9831FF1C630CFF1C6A10FF1C6C11FF1C6B11FF347B
              2ACBC2D8C036FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0094B98F66206E16DF1C6B11FF1C6C12FF1C660EFF1C64
              0CFF18A23AFF13DA61FF15D35CFF15D15BFF16D45DFF16D55EFF17D65FFF18D8
              61FF18D961FF18DA63FF19DC63FF19DC63FF1AE86DFF1AE269FF1B8D2AFF1C5F
              08FF1C6A10FF1C6B11FF1C6B11FF3C8033C3C5D9C234FFFFFF00FFFFFF0092B8
              8C6A206E16DF1C6B11FF1C6B11FF1C660EFF1C660DFF189E35FF13D860FF15D6
              5FFF16D15BFF16D45DFF16D55EFF17D65FFF17D860FF18D961FF18DA62FF19DB
              64FF1ADC64FF1AE56BFF1BE167FF1C9730FF1C610AFF1C6A0FFF1C6C11FF1C6B
              11FF2D7623D3B3CEB046FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0092B88D68206D15E11C6B11FF1C6C11FF1C66
              0EFF1C640CFF189B34FF14D45EFF15D45DFF15D15BFF16D45DFF16D55EFF17D5
              5FFF18D761FF18D962FF18DB62FF19DB63FF19DC64FF1AE76CFF1AE469FF1C97
              31FF1C6109FF1C690FFF1C6B11FF1C6B11FF337A29CDC4D9C134FFFFFF00FFFF
              FF00A2C29D58216E17DF1C6B11FF1C6B11FF1C690FFF1C670EFF189E36FF13D6
              5FFF14D45EFF16D15CFF16D45DFF16D55DFF17D75FFF17D860FF18D962FF18DB
              62FF19DC64FF19DB63FF1AE56BFF1BE168FF1C9630FF1C6109FF1C690FFF1C6C
              11FF1C6B11FF2D7623D3AECAAA4CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0093B98E68206E16DF1C6B11FF1C6C
              11FF1C660DFF1C650DFF189C34FF14D45EFF14D55EFF16D15BFF16D25DFF16D4
              5DFF17D55EFF18D660FF18D961FF19DA62FF19DC64FF19DC64FF1AE76CFF1BE3
              69FF1C9832FF1C5F08FF1C670EFF1C6B11FF1C6B11FF29741FD7B0CBAC4AFFFF
              FF00FFFFFF00B0CBAC4A2D7623D31C6B11FF1C6C11FF1C680FFF1C630BFF189B
              34FF14D45DFF15D45DFF15D05AFF16D35DFF17D55EFF17D55FFF17D760FF18D8
              60FF19D962FF19DB63FF19DC63FF1AE66AFF1AE46AFF1C9832FF1C600AFF1C68
              0EFF1C6C11FF1C6B11FF2B7521D5ADCAA94CFFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0093B98E68237018DD1C6B
              11FF1C6B11FF1C650DFF1C6A10FF18A339FF14D45DFF15D55EFF15D05BFF16D3
              5DFF16D45EFF17D55FFF17D660FF17D860FF19DA62FF19DB64FF19DC64FF1AE5
              6BFF1AD962FF1B902DFF1C610AFF1C660DFF1C6C12FF1C6B11FF387E2FC7B6CF
              B244FFFFFF00FFFFFF009EC0995C2D7623D31C6B11FF1C6B12FF1C660DFF1C66
              0CFF199930FF14D05AFF15D35CFF15D05AFF15D35DFF17D55EFF17D65EFF17D7
              60FF18D861FF18D962FF19DB63FF19DC63FF1AE66BFF1AE268FF1C9A34FF1C62
              0AFF1C660EFF1C6C11FF1C6B11FF387E2FC7B7D0B342FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0097BB92642370
              18DD1C6B11FF1C6B11FF1C660EFF1C660EFF17A53BFF13D760FF15D35DFF15D1
              5BFF15D25CFF16D45EFF17D55FFF17D65FFF17D760FF18D961FF19DC63FF19DB
              63FF1AE369FF1ADB63FF1B8929FF1C6009FF1C690FFF1C6C11FF1C6B11FF397E
              30C5C1D6BE38FFFFFF00FFFFFF0093B98E68247019DD1C6B11FF1C6B12FF1C66
              0EFF1C640CFF189B33FF13D35CFF15D35CFF15D05BFF15D25CFF16D45DFF16D6
              5EFF17D760FF18D861FF18D962FF18DA62FF19DC64FF1AE46AFF1AE067FF1C98
              32FF1C610AFF1C670EFF1C6B11FF1C6B11FF2D7623D3B6CFB244FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0099BC
              9462247019DD1C6B11FF1C6B11FF1C680FFF1C660DFF189B33FF13D55EFF15D4
              5DFF15D05BFF15D35CFF16D45DFF16D65EFF17D65FFF17D861FF18D961FF18D9
              62FF19DA63FF1AE167FF1AE068FF1C9631FF1C610AFF1C6A11FF1C6B11FF1C6B
              11FF387D2EC7C1D6BE38FFFFFF00FFFFFF0098BC9362247019DD1C6B11FF1C6B
              11FF1C670EFF1C640BFF189B34FF13D35DFF15D45DFF15D05BFF15D25CFF16D2
              5CFF16D45EFF17D65FFF17D861FF18DA61FF18DB62FF19DB63FF19E369FF1AE0
              67FF1B9832FF1C6209FF1C680DFF1C6C11FF1C6B11FF29741FD7AAC7A550FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF0097BB9264216E17DF1C6B11FF1C6B11FF1C680FFF1C660EFF189A32FF13D2
              5BFF14D35CFF15CF5AFF15D25CFF16D35DFF16D45EFF17D660FF17D860FF18D9
              61FF18DA62FF19DA61FF19E469FF1AE067FF1C9934FF1C640CFF1C6910FF1C6B
              11FF1C6B11FF29741FD7B9D1B540FFFFFF00FFFFFF00AECAAA4C2A7420D51C6B
              11FF1C6B11FF1C680EFF1C660DFF189B33FF13D35CFF14D35CFF15CF5AFF15D2
              5BFF16D25DFF16D45EFF16D65FFF18D760FF18D861FF18DA63FF19DB63FF19E1
              69FF1ADF66FF1B9832FF1C610AFF1C680FFF1C6C11FF1C6B11FF28731ED7AAC7
              A550FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF0096BB9164216E17DF1C6B11FF1C6B11FF1C680DFF1C6B10FF179B
              33FF14D059FF13D15BFF15CF5AFF15D25CFF16D35DFF16D45DFF16D55EFF17D7
              60FF18D861FF18D962FF18DB62FF19E469FF19DD64FF1C9832FF1C640CFF1C69
              0FFF1C6B11FF1C6B11FF307826CFACC9A84EFFFFFF00FFFFFF00ADCAA94C3078
              26CF1C6B11FF1C6C11FF1C680EFF1C660EFF189631FF13D25BFF13D25CFF15CF
              59FF15D25BFF16D25DFF16D45DFF16D55EFF17D65FFF17D961FF18DA62FF19DB
              63FF19E267FF19DF67FF1B9933FF1C610AFF1C680FFF1C6C11FF1C6B11FF3078
              26CFACC9A84EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0096BB9164216E17DF1C6B11FF1C6B12FF1D650DFF1C69
              0FFF16A53AFF13D25CFF14D05BFF14CF5AFF15D15CFF16D25CFF16D45DFF16D5
              5EFF17D65FFF18D861FF18D962FF18DB63FF19E56BFF1AD962FF1B8C28FF1C5F
              09FF1C680FFF1C6B11FF1C6B11FF387E2FC7BED5BB3AFFFFFF00FFFFFF0099BC
              9462237018DD1C6B11FF1C6B11FF1C670EFF1C660DFF189832FF13D15AFF14D2
              5BFF14CE59FF15D05BFF16D25CFF16D35DFF16D55EFF17D65FFF17D860FF18DA
              61FF19DA63FF19E468FF1AE066FF1B9933FF1C630AFF1C680FFF1C6C11FF1C6B
              11FF307826CFBFD5BC3AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF009BBE9660237018DD1C6B11FF1C6C12FF1C65
              0DFF1C610AFF169E36FF12D45DFF14D05BFF14CE59FF14CF5BFF15D15CFF16D2
              5DFF16D45EFF17D55EFF17D860FF18D962FF18D962FF19E569FF19DF66FF1C8F
              2BFF1C5E07FF1C680FFF1C6B11FF1C6B11FF367C2CC9BFD5BC3AFFFFFF00FFFF
              FF009BBE9660237018DD1C6B11FF1C6C11FF1C660EFF1C640CFF199832FF12D1
              5BFF13D15BFF14CE58FF15D059FF15D25BFF16D35DFF16D45EFF17D55EFF17D6
              5FFF17D862FF19D962FF19E369FF19E167FF1C9933FF1C620BFF1C680FFF1C6B
              11FF1C6B11FF28731ED7ACC9A84EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009DBF985E26711BDB1C6B11FF1C6C
              11FF1C660DFF1C6109FF179730FF12D05BFF14D25CFF14CD58FF15D059FF15D0
              5BFF16D25DFF17D35EFF17D55EFF17D660FF18D861FF18D961FF19E369FF19E2
              67FF1B9934FF1C6109FF1C680EFF1C6C12FF1C6B11FF2C7522D3BBD3B83EFFFF
              FF00FFFFFF00AAC7A55025711ADB1C6B11FF1C6C11FF1C680EFF1C640CFF1898
              31FF13D25BFF13D25BFF14CD58FF15CF5AFF15D05BFF16D25CFF16D55EFF17D6
              5FFF17D75FFF18D861FF18D861FF18E269FF19E169FF1B9A34FF1C630BFF1C68
              0FFF1C6C11FF1C6B11FF28731DD9A3C39F56FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009ABD966027721CD91C6B
              11FF1C6B11FF1D660EFF1C630CFF179730FF12D15AFF13D35CFF15CE59FF15CF
              5AFF15D15BFF16D25CFF16D45DFF17D65FFF18D760FF18D861FF18D860FF19E1
              68FF19DF66FF1A9B34FF1C620AFF1C670EFF1C6C12FF1C6B11FF2B7521D5AAC7
              A550FFFFFF00FFFFFF00B3CEB0462D7623D31C6B11FF1C6C11FF1D690EFF1C63
              0CFF189730FF12D05AFF13D25BFF14CD57FF15CF59FF15D05AFF16D15CFF17D3
              5DFF17D55EFF17D65FFF18D860FF18D961FF19E168FF19E068FF1B9A34FF1C63
              0AFF1C680DFF1C6C11FF1C6B11FF2A7420D5A4C4A056FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0096BB91642470
              19DD1C6B11FF1C6B11FF1C680FFF1C6A0FFF17A038FF12D05BFF13D25CFF14CE
              59FF15D05BFF15D15BFF16D25CFF16D35DFF17D55FFF17D760FF18D961FF18D9
              61FF18E068FF19D760FF1B902CFF1C630AFF1C670DFF1C6C11FF1C6B11FF387D
              2EC7B3CEB046FFFFFF00FFFFFF009EC0995C2D7623D31C6B11FF1C6C11FF1D69
              0FFF1D650CFF179630FF13CE58FF13D25BFF14CE58FF15D05AFF15D15BFF15D2
              5CFF16D35EFF17D55FFF17D760FF18D861FF18D962FF18E066FF19DF66FF1B9B
              33FF1C6209FF1C660DFF1C6B11FF1C6B11FF387E2FC7B9D1B540FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CBF
              975E247019DD1C6B11FF1C6B11FF1C680FFF1D680FFF16A138FF12D25CFF14D1
              5BFF14CD58FF15CF5AFF15D15BFF15D25CFF16D35CFF16D45EFF17D65FFF18D7
              61FF18D861FF18DF66FF19D862FF1B8D2AFF1C610AFF1C680EFF1C6B11FF1C6B
              11FF367C2CC9BBD3B83EFFFFFF00FFFFFF009BBE966027721CD91C6B11FF1C6C
              11FF1C690FFF1D650CFF18962FFF13CD58FF13D15AFF14CD58FF15CF5AFF15D1
              5BFF15D25BFF16D45CFF16D45DFF17D65FFF18D860FF18D961FF18DF66FF19DD
              65FF1B9B35FF1C6209FF1C660DFF1C6B11FF1C6B11FF29741FD7B5CFB244FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF009FC09A5C25711ADB1C6B11FF1C6B11FF1C670FFF1D650DFF18962FFF13CE
              58FF13CF59FF13CC57FF14CE59FF15D15AFF15D15CFF16D35CFF16D45DFF16D5
              5EFF17D761FF18D861FF18E066FF19DF66FF1B9832FF1C620AFF1C6910FF1C6B
              11FF1C6B11FF337A29CDBAD2B640FFFFFF00FFFFFF00A0C19B5A27721CD91C6B
              11FF1C6B11FF1C660EFF1D650BFF17962FFF13CE57FF13D059FF14CC58FF14CE
              59FF15D05BFF15D15BFF16D25CFF16D45DFF17D55FFF17D660FF18D861FF18DF
              65FF18DD65FF1B9B35FF1C630BFF1C680FFF1C6B11FF1C6B11FF25711ADBA2C3
              9E58FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00A2C29D5827721CD91C6B11FF1C6B11FF1C660DFF1D640CFF1794
              2DFF12CC58FF12CE59FF13CC57FF14CD58FF14CF5AFF15D05BFF16D25CFF16D3
              5DFF16D55EFF17D55FFF18D75FFF18E268FF18DF66FF1A9D35FF1C660DFF1C6A
              10FF1C6B11FF1C6B11FF2A7420D5AFCBAB4AFFFFFF00FFFFFF00B3CEB0462D76
              23D31C6B11FF1C6B11FF1C670EFF1D630CFF18952EFF12CE58FF12D15AFF14CC
              57FF14CE59FF14CF5AFF15D15BFF15D25CFF16D35DFF16D45FFF17D55FFF18D7
              60FF18DF65FF18DD64FF1A9C35FF1B640BFF1C6A0FFF1C6C11FF1C6B11FF2772
              1CD9A0C19B5AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00A9C7A45227721CD91C6B11FF1C6B11FF1C690FFF1C6A
              10FF189630FF11CD58FF12D059FF14CB57FF14CE59FF14CF59FF15D15AFF16D2
              5CFF16D45EFF16D55EFF17D55FFF17D760FF18E168FF18DB63FF1B9A33FF1C64
              0CFF1C680FFF1C6B11FF1C6B11FF2F7725D1A5C4A154FFFFFF00FFFFFF00C2D8
              C036367C2CC91C6B11FF1C6B11FF1C6B11FF1C6910FF18922FFF11CE59FF13CF
              5AFF13CB56FF14CE59FF14CF5AFF15D15BFF15D25CFF16D35DFF16D55EFF17D6
              5FFF17D65EFF18DE66FF18DE65FF1B9C35FF1C630CFF1C690FFF1C6C11FF1C6B
              11FF317927CFA5C4A154FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF003A7F31C51C6B11FF1C6B11FF1C6A
              10FF1C670EFF169E37FF11D35CFF12CF59FF14CB57FF14CE58FF14D059FF15D1
              5BFF15D35CFF16D45DFF16D65EFF17D75FFF17D860FF18E167FF19D761FF1A8E
              2BFF1C5F07FF1C680EFF1C6B11FF1C6B11FF347B2ACBB6CFB244FFFFFF00FFFF
              FF00F3F7F302649A5D991C6B11FF1C6B11FF1C6B11FF1C680FFF18912CFF11D2
              5AFF12CF59FF14CB56FF14CE59FF14D05AFF15D05BFF15D25CFF16D45CFF16D4
              5EFF17D75FFF17D75FFF18DE66FF18E067FF1B9C35FF1C620BFF1C680FFF1C6C
              11FF1C6B11FF2F7725D1B7D0B342FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004C8A43B31C6B
              11FF1C6B11FF1C6A11FF1C670EFF17912CFF13CD57FF13D15AFF14CC58FF14CF
              5AFF15D05BFF15D15CFF16D35CFF17D45DFF17D760FF17D760FF18DF65FF18DD
              64FF1B912DFF1C5E07FF1C660DFF1C6B11FF1C6B11FF327A28CDB8D1B442FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0073A46C891C6B11FF1C6B11FF1C6B11FF1C68
              0FFF1A8523FF13C853FF13D15CFF14CC58FF15CF59FF15D15BFF15D25BFF16D2
              5DFF16D55EFF17D65EFF17D65FFF18DF65FF18DF67FF1A9D36FF1C620BFF1C66
              0DFF1C6B11FF1C6B11FF25711ADBA8C6A452FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00BFD5BC3A2F7725D11C6B11FF1C6B11FF1C6B10FF1C650CFF198D29FF13CC
              58FF14D45DFF15CF5AFF15D15BFF15D25CFF16D45EFF17D55FFF17D760FF18DE
              65FF18DE65FF1A9E35FF1C6109FF1C670EFF1C6C12FF1C6B11FF307826CFB4CE
              B144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00D2E2D0263F8235C11C6B
              11FF1C6B11FF1C6B11FF1C650DFF198927FF14CE59FF13D65FFF15CF5AFF15D1
              5BFF16D35DFF16D45DFF17D65FFF17D65FFF17DE65FF18DF66FF1A9D35FF1C63
              0BFF1C660DFF1C6B11FF1C6B11FF25711ADB9DBF985EFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00B2CDAE48317927CF1C6B11FF1C6C11FF1C68
              0FFF1C630BFF198D2AFF15CD58FF15D65EFF15D25CFF16D35DFF16D55EFF17D6
              5EFF17DC63FF18DB63FF1A9F37FF1C650DFF1C670EFF1C6C11FF1C6B11FF2873
              1ED7A2C29D58FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C2D7BF36397E30C51C6B11FF1C6B11FF1C690FFF1C650CFF1A8E2AFF14D0
              5AFF14D961FF15D25CFF16D35DFF16D55EFF17D65FFF17DB63FF18DC63FF1A9E
              36FF1C630CFF1C660EFF1C6B11FF1C6B11FF29741FD79BBE9660FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C1D6BE383E81
              34C11C6B11FF1C6B11FF1C6910FF1C630DFF1A8726FF16CF59FF16DA61FF16D4
              5DFF17D55EFF17DD64FF19D760FF1B932FFF1C660DFF1C690FFF1C6B11FF1C6B
              11FF307826CFABC8A74EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C2D7BF363B7F32C31C6B11FF1C6B11FF1C6A
              0FFF1C620BFF1A8625FF16CB56FF15DB63FF16D45EFF17D55EFF17DB63FF18DD
              64FF1B9C35FF1C630BFF1C680EFF1C6C11FF1C6B11FF327A28CDB2CDAE48FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C6DAC3323C8033C31C6B11FF1C6B11FF1C6910FF1C630BFF1A90
              2CFF15D55EFF16DB62FF17DD64FF18D860FF1B902CFF1C620AFF1C690FFF1C6B
              11FF1C6B11FF317927CFB4CEB144FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343A7F
              31C51C6B11FF1C6C11FF1C6A0FFF1C6009FF1A8323FF16CC58FF17DB63FF17DB
              63FF17DD64FF1A9E37FF1C640BFF1C680EFF1C6B11FF1C6B11FF25711ADBB2CD
              AF46FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B7D0B3422F7725D11C6B11FF1C6B
              11FF1C6A0FFF1C630CFF1A912EFF17DB62FF17E368FF1A9932FF1C620AFF1C69
              0FFF1C6B11FF1C6B11FF327A28CDB5CFB244FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00C5D9C234387E2FC71C6B11FF1C6C12FF1C6A10FF1C6109FF1B87
              25FF17D55FFF17DF67FF1A9E36FF1C630CFF1C680FFF1C6C11FF1C6B11FF2470
              19DD9DBF985EFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00AFCB
              AB4A2E7724D11C6B11FF1C6B11FF1C680EFF1C640DFF1A9932FF1AA139FF1C68
              0FFF1C670EFF1C6B11FF1C6B11FF28731ED7ACC9A84EFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C4D9C134347B2ACB1C6B11FF1C6B
              11FF1C690FFF1C630BFF1A9832FF1A9F38FF1C660CFF1C670EFF1C6C11FF1C6B
              11FF26711BDB98BC9362FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00B6CFB2443A7F31C51C6B11FF1C6B11FF1C6A10FF1C66
              0DFF1C650DFF1C690FFF1C6B11FF1C6B11FF2C7522D3A3C39F56FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C0D6
              BD38387E2FC71C6B11FF1C6B11FF1C6A10FF1C660DFF1C660DFF1C690FFF1C6C
              11FF1C6B11FF307826CFA2C29D58FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C5D9C2343B7F32C31C6B
              11FF1C6B11FF1C6A11FF1C6910FF1C6B11FF1C6B11FF2C7522D3AECAAA4CFFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00C2D8C036397E30C51C6B11FF1C6B11FF1C6A10FF1C6A
              10FF1C6B11FF1C6B11FF2C7522D3B2CDAE48FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C0D6BD382F7725D11C6B11FF1C6B11FF1C6B11FF1C6B11FF2E7724D1B0CB
              AC4AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C2D7BF36387E2FC71C6B
              11FF1C6B11FF1C6B11FF1C6B11FF206E16DFA0C19B5AFFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00AECAAA4C29741FD71C6B11FF1C6B11FF2F77
              25D1B0CBAC4AFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00C2D7BF36387D2EC71C6B11FF1C6B11FF206D15E196BB9164FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00B5CFB2444385
              3AFF3B7F32FFAECAAA4CFFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00C4D9C1344B8A42FF3F8235FFA4C4A056FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00}
            Stretch = True
            Transparent = True
          end
          object sEdit125: TsEdit
            Left = 19
            Top = 74
            Width = 165
            Height = 21
            ReadOnly = True
            TabOrder = 0
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Caption = 'Select Font from Directory'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclTopLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn103: TsBitBtn
            Left = 188
            Top = 74
            Width = 25
            Height = 21
            Hint = 'Tools_find_font'
            TabOrder = 1
            OnClick = Mame_ManageBuilds
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
          object sBitBtn104: TsBitBtn
            Left = 419
            Top = 53
            Width = 100
            Height = 25
            Hint = 'Tools_create_font'
            Caption = 'Create Font'
            TabOrder = 2
            OnClick = Mame_ManageBuilds
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 19
            Images = InBitBtn_Imagelist
          end
          object LMDFontComboBox1: TLMDFontComboBox
            Left = 19
            Top = 32
            Width = 195
            Height = 20
            Hint = 'Tools_change_font'
            Color = clWhite
            ExampleText = 'Abc'
            Options = [foScreenFonts, foTrueTypeOnly, foDisplaySymbol, foDisplaySelectedFont]
            TabOrder = 3
            OnChange = Mame_ManageBuilds
          end
          object LMDFontSizeComboBox1: TLMDFontSizeComboBox
            Left = 293
            Top = 53
            Width = 56
            Height = 21
            Hint = 'Tools_change_font_size'
            Color = clWhite
            TabOrder = 4
            OnChange = Mame_ManageBuilds
          end
          object rb56: TRadioButton
            Left = 5
            Top = 34
            Width = 15
            Height = 17
            Hint = 'System font'
            TabOrder = 5
            OnClick = Mame_ManageBuilds
          end
          object rb57: TRadioButton
            Left = 5
            Top = 76
            Width = 15
            Height = 17
            Hint = 'Directory font'
            TabOrder = 6
            OnClick = Mame_ManageBuilds
          end
        end
      end
      object PBuilds_MameBuilds: TsPanel
        Left = 10
        Top = 50
        Width = 550
        Height = 524
        TabOrder = 0
        SkinData.SkinSection = 'PANEL'
        object PBuilds_MameXT: TPanel
          Left = 10
          Top = 26
          Width = 530
          Height = 485
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object sLabel36: TsLabel
            Left = 11
            Top = 100
            Width = 163
            Height = 13
            Caption = 'User Interface Transparency'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sLabel37: TsLabel
            Left = 234
            Top = 99
            Width = 21
            Height = 13
            Caption = '215'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sCheckBox44: TsCheckBox
            Left = 5
            Top = 20
            Width = 161
            Height = 20
            Caption = 'Quit Confirutation on Exit'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox128: TsCheckBox
            Left = 5
            Top = 40
            Width = 122
            Height = 20
            Caption = 'Enable Audio Sync'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object grp119: TGroupBox
            Left = 184
            Top = 9
            Width = 340
            Height = 88
            Caption = 'HiScore.Dat'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            object sLabel103: TsLabel
              Left = 198
              Top = 72
              Width = 133
              Height = 13
              Caption = 'HiScore.dat not Found!!!'
              Color = clBtnFace
              ParentColor = False
              ParentFont = False
              Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              UseSkinColor = False
            end
            object sCheckBox129: TsCheckBox
              Left = 177
              Top = 15
              Width = 151
              Height = 20
              Hint = 'Mxt_check_hiscore'
              Caption = 'Enable HiScore Support'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sEdit16: TsEdit
              Left = 7
              Top = 50
              Width = 293
              Height = 21
              TabOrder = 1
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Active = True
              BoundLabel.Caption = 'Hiscore.dat Directory'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = [fsBold]
              BoundLabel.Layout = sclTopLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
            object sBitBtn99: TsBitBtn
              Left = 305
              Top = 50
              Width = 25
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 2
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'BUTTON'
              ImageIndex = 15
              Images = InBitBtn_Imagelist
            end
          end
          object sbar_Mame_UITransparent_MameXT: TsScrollBar
            Left = 10
            Top = 116
            Width = 245
            Height = 13
            Hint = 'Mxt_change_ui_transparent'
            Max = 255
            PageSize = 0
            Position = 215
            TabOrder = 3
            OnChange = Mame_ManageBuilds
            SkinManager = SkinM
          end
          object grp120: TGroupBox
            Left = 8
            Top = 144
            Width = 518
            Height = 248
            Caption = 'IPS!'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            object sLabel38: TsLabel
              Left = 7
              Top = 68
              Width = 77
              Height = 13
              Caption = 'IPS Collection'
            end
            object sGauge_IPSMameXT: TsGauge
              Left = 7
              Top = 40
              Width = 180
              Height = 21
              Visible = False
              SkinData.SkinSection = 'GAUGE'
              ForeColor = clBlack
              Progress = 0
              Suffix = '%'
            end
            object sLabel111: TsLabel
              Left = 8
              Top = 24
              Width = 57
              Height = 13
              Caption = 'sLabel111'
              Visible = False
            end
            object nxtgrd_ips_mamext: TNextGrid
              Left = 7
              Top = 85
              Width = 502
              Height = 155
              Caption = 'I Have no Data to Show'
              TabOrder = 0
              TabStop = True
              OnCellClick = nxtgrd_ips_mamextCellClick
              OnExpand = nxtgrd_ips_mamextExpand
            end
            object sCheckBox130: TsCheckBox
              Left = 373
              Top = 11
              Width = 137
              Height = 20
              Hint = 'Mxt_enable_ips'
              Caption = 'Enable IPS Collection'
              TabOrder = 1
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sEdit17: TsEdit
              Left = 193
              Top = 40
              Width = 285
              Height = 21
              TabOrder = 2
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Active = True
              BoundLabel.Caption = 'IPS Directory'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = [fsBold]
              BoundLabel.Layout = sclTopLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
            object sBitBtn100: TsBitBtn
              Left = 483
              Top = 40
              Width = 25
              Height = 21
              Hint = 'Mxt_find_ips'
              TabOrder = 3
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'BUTTON'
              ImageIndex = 15
              Images = InBitBtn_Imagelist
            end
          end
          object grp121: TGroupBox
            Left = 8
            Top = 395
            Width = 518
            Height = 78
            Caption = 'Game Info'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            object sLabel39: TsLabel
              Left = 345
              Top = 24
              Width = 76
              Height = 13
              Caption = 'Play Count : 0'
            end
            object sLabel40: TsLabel
              Left = 345
              Top = 48
              Width = 71
              Height = 13
              Caption = 'Play Time : 0'
            end
            object sComboBox76: TsComboBox
              Left = 16
              Top = 35
              Width = 272
              Height = 21
              Hint = 'Mxt_get_games_count_times'
              Alignment = taLeftJustify
              BoundLabel.Active = True
              BoundLabel.Caption = 'Game'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = [fsBold]
              BoundLabel.Layout = sclTopLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
              SkinData.SkinSection = 'COMBOBOX'
              ItemHeight = 15
              ItemIndex = -1
              TabOrder = 0
              OnChange = Mame_ManageBuilds
            end
            object sBitBtn101: TsBitBtn
              Left = 484
              Top = 33
              Width = 25
              Height = 21
              Hint = 'Mxt_zero_games_count_times'
              Enabled = False
              TabOrder = 1
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'BUTTON'
              ImageIndex = 10
              Images = InBitBtn_Imagelist
            end
          end
        end
        object PBuilds_MamePlus: TPanel
          Left = 10
          Top = 26
          Width = 530
          Height = 485
          Alignment = taRightJustify
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object sLabel33: TsLabel
            Left = 11
            Top = 100
            Width = 163
            Height = 13
            Caption = 'User Interface Transparency'
            ParentFont = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
          end
          object sLabel34: TsLabel
            Left = 234
            Top = 99
            Width = 21
            Height = 13
            Caption = '215'
          end
          object grp118: TGroupBox
            Left = 8
            Top = 144
            Width = 518
            Height = 248
            Caption = 'IPS!'
            TabOrder = 4
            object sLabel35: TsLabel
              Left = 7
              Top = 68
              Width = 77
              Height = 13
              Caption = 'IPS Collection'
            end
            object sGauge_IPSMamePlus: TsGauge
              Left = 7
              Top = 40
              Width = 180
              Height = 21
              Visible = False
              SkinData.SkinSection = 'GAUGE'
              ForeColor = clBlack
              Progress = 0
              Suffix = '%'
            end
            object sLabel110: TsLabel
              Left = 8
              Top = 24
              Width = 57
              Height = 13
              Caption = 'sLabel110'
              Visible = False
            end
            object nxtgrd_ips_mameplus: TNextGrid
              Left = 7
              Top = 85
              Width = 502
              Height = 155
              Caption = 'I Have no Data to Show'
              Options = [goGrid, goHeader, goRowResizing]
              TabOrder = 0
              TabStop = True
              OnCellClick = nxtgrd_ips_mameplusCellClick
              OnExpand = nxtgrd_ips_mameplusExpand
            end
            object sCheckBox34: TsCheckBox
              Left = 373
              Top = 11
              Width = 137
              Height = 20
              Hint = 'Mplus_enable_ips'
              Caption = 'Enable IPS Collection'
              TabOrder = 1
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sEdit13: TsEdit
              Left = 193
              Top = 40
              Width = 285
              Height = 21
              ReadOnly = True
              TabOrder = 2
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Active = True
              BoundLabel.Caption = 'IPS Directory'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = [fsBold]
              BoundLabel.Layout = sclTopLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
            object sBitBtn98: TsBitBtn
              Left = 483
              Top = 40
              Width = 25
              Height = 21
              Hint = 'Mplus_find_ips'
              TabOrder = 3
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'BUTTON'
              ImageIndex = 15
              Images = InBitBtn_Imagelist
            end
          end
          object sCheckBox10: TsCheckBox
            Left = 5
            Top = 40
            Width = 122
            Height = 20
            Caption = 'Enable Audio Sync'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox32: TsCheckBox
            Left = 5
            Top = 20
            Width = 161
            Height = 20
            Caption = 'Quit Confirutation on Exit'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sbar_Mame_UITransparent_MamePlus: TsScrollBar
            Left = 10
            Top = 116
            Width = 245
            Height = 13
            Hint = 'Mplus_change_ui_transparent'
            Max = 255
            PageSize = 0
            Position = 215
            TabOrder = 2
            OnChange = Mame_ManageBuilds
            SkinManager = SkinM
          end
          object grp117: TGroupBox
            Left = 184
            Top = 9
            Width = 340
            Height = 88
            Caption = 'HiScore.Dat'
            TabOrder = 3
            object sLabel102: TsLabel
              Left = 198
              Top = 72
              Width = 133
              Height = 13
              Caption = 'HiScore.dat not Found!!!'
              Color = clBtnFace
              ParentColor = False
              ParentFont = False
              Visible = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              UseSkinColor = False
            end
            object sCheckBox33: TsCheckBox
              Left = 177
              Top = 15
              Width = 151
              Height = 20
              Hint = 'Mplus_check_hiscore'
              Caption = 'Enable HiScore Support'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sEdit12: TsEdit
              Left = 7
              Top = 50
              Width = 293
              Height = 21
              TabOrder = 1
              SkinData.SkinSection = 'EDIT'
              BoundLabel.Active = True
              BoundLabel.Caption = 'Hiscore.dat Directory'
              BoundLabel.Indent = 0
              BoundLabel.Font.Charset = DEFAULT_CHARSET
              BoundLabel.Font.Color = clWindowText
              BoundLabel.Font.Height = -11
              BoundLabel.Font.Name = 'Tahoma'
              BoundLabel.Font.Style = [fsBold]
              BoundLabel.Layout = sclTopLeft
              BoundLabel.MaxWidth = 0
              BoundLabel.UseSkinColor = True
            end
            object sBitBtn1: TsBitBtn
              Left = 305
              Top = 50
              Width = 25
              Height = 21
              Hint = 'Mplus_find_hiscore'
              TabOrder = 2
              OnClick = Mame_ManageBuilds
              SkinData.SkinSection = 'BUTTON'
              ImageIndex = 15
              Images = InBitBtn_Imagelist
            end
          end
        end
        object sBitBtn45: TsBitBtn
          Left = 13
          Top = 9
          Width = 75
          Height = 18
          Hint = 'MamePlus'
          Caption = 'MamePlus'
          TabOrder = 0
          OnClick = Mame_ManageBuilds
          SkinData.SkinSection = 'BUTTON'
        end
        object sBitBtn46: TsBitBtn
          Left = 88
          Top = 9
          Width = 75
          Height = 18
          Hint = 'MameXT'
          Caption = 'MameXT'
          TabOrder = 1
          OnClick = Mame_ManageBuilds
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sBitBtn43: TsBitBtn
        Left = 280
        Top = 26
        Width = 75
        Height = 25
        Hint = 'Tools'
        Caption = 'Tools'
        TabOrder = 1
        OnClick = Mame_ManageBuilds
        SkinData.SkinSection = 'BUTTON'
      end
      object sBitBtn44: TsBitBtn
        Left = 205
        Top = 26
        Width = 75
        Height = 25
        Hint = 'Builds'
        Caption = 'Builds'
        TabOrder = 2
        OnClick = Mame_ManageBuilds
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton8: TsButton
        Left = 567
        Top = 318
        Width = 156
        Height = 26
        Hint = 'Mame_save_topic_builds_button'
        Caption = 'Default Topic Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        WordWrap = False
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
      object sButton9: TsButton
        Left = 567
        Top = 352
        Width = 156
        Height = 26
        Hint = 'Mame_save_global_button'
        Caption = 'Default Mame Settings'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        WordWrap = False
        OnClick = Mame_GlobalOrTopicSave
        SkinData.CustomColor = True
        SkinData.CustomFont = True
        SkinData.SkinSection = 'BUTTON'
        ImageAlignment = iaCenter
        Reflected = True
      end
    end
    object Pem_mame_database: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      SkinData.SkinSection = 'PANEL'
      object sGauge_MameData: TsGauge
        Left = 20
        Top = 77
        Width = 540
        Height = 25
        SkinData.SkinSection = 'GAUGE'
        ForeColor = clBlack
        Progress = 0
        Suffix = '%'
      end
      object sLabel109: TsLabel
        Left = 20
        Top = 59
        Width = 68
        Height = 16
        Caption = 'Completed'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object nxtgrd_mame: TNextGrid
        Left = 20
        Top = 108
        Width = 540
        Height = 407
        Caption = 'I have no data to show'
        Options = [goGrid, goHeader, goSelectFullRow]
        TabOrder = 0
        TabStop = True
      end
      object sComboBox72: TsComboBox
        Left = 20
        Top = 36
        Width = 543
        Height = 21
        Hint = 'Show_statistics'
        Alignment = taLeftJustify
        BoundLabel.Active = True
        BoundLabel.Caption = 'State'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 15
        ItemIndex = 0
        ParentFont = False
        TabOrder = 2
        Text = 'Overall Roms'
        OnChange = Mame_ManageDatabase
        Items.Strings = (
          'Overall Roms'
          'Missing Roms')
      end
      object grp115: TGroupBox
        Left = 147
        Top = 522
        Width = 414
        Height = 129
        Caption = 'Mame Info'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sWebLabel3: TsWebLabel
          Left = 102
          Top = 52
          Width = 3
          Height = 13
          ParentFont = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold, fsItalic]
          HoverFont.Charset = DEFAULT_CHARSET
          HoverFont.Color = clWindowText
          HoverFont.Height = -11
          HoverFont.Name = 'Tahoma'
          HoverFont.Style = []
        end
        object sLabel104: TsLabel
          Left = 16
          Top = 24
          Width = 129
          Height = 13
          Caption = 'Mame Version (Build) : '
        end
        object sLabel105: TsLabel
          Left = 16
          Top = 52
          Width = 79
          Height = 13
          Caption = 'Mame Name : '
        end
        object sLabel106: TsLabel
          Left = 16
          Top = 80
          Width = 105
          Height = 13
          Caption = 'Overall Emulated : '
        end
        object sLabel107: TsLabel
          Left = 16
          Top = 108
          Width = 78
          Height = 13
          Caption = 'Roms Found : '
        end
      end
      object sBitBtn102: TsBitBtn
        Left = 410
        Top = 13
        Width = 151
        Height = 17
        Hint = 'Erase_dir_data'
        Caption = 'Delete Rom Directory'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        Visible = False
        OnClick = Mame_ManageDatabase
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 33
        Images = InBitBtn_Imagelist
      end
    end
    object Pwg_weather: TsPanel
      Left = 1
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 9
      SkinData.SkinSection = 'PANEL'
      object sLabel61: TsLabel
        Left = 16
        Top = 38
        Width = 96
        Height = 13
        Caption = 'Your Selections...'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object grp31: TGroupBox
        Left = 368
        Top = 48
        Width = 353
        Height = 336
        TabOrder = 3
        Visible = False
        object sEdit31: TsEdit
          Left = 8
          Top = 24
          Width = 249
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnKeyPress = sEdit31KeyPress
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Write your Town...'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object rb8: TRadioButton
          Left = 315
          Top = 24
          Width = 30
          Height = 17
          Caption = 'F'
          TabOrder = 1
          Visible = False
        end
        object rb7: TRadioButton
          Left = 275
          Top = 24
          Width = 30
          Height = 17
          Caption = 'C'
          Checked = True
          TabOrder = 2
          TabStop = True
          Visible = False
        end
        object sListBox1: TsListBox
          Left = 8
          Top = 64
          Width = 334
          Height = 97
          Hint = 'Weather_ClickedTownInfo'
          ItemHeight = 16
          TabOrder = 3
          OnClick = Weather_Config
          BoundLabel.Active = True
          BoundLabel.Caption = 'Select..'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'EDIT'
        end
        object sButton20: TsButton
          Left = 8
          Top = 184
          Width = 337
          Height = 137
          Hint = 'Weather_ClickToAddTownInfo'
          TabOrder = 4
          OnClick = Weather_Config
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object sButton18: TsButton
        Left = 688
        Top = 24
        Width = 20
        Height = 20
        Hint = 'Weather_AddSelection'
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = Weather_Config
        SkinData.SkinSection = 'BUTTON'
      end
      object ScrollBox1: TScrollBox
        Left = 16
        Top = 56
        Width = 350
        Height = 425
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 1
      end
      object sButton19: TsButton
        Left = 632
        Top = 24
        Width = 50
        Height = 20
        Hint = 'Weather_CancelAdd'
        Caption = 'Cancel'
        TabOrder = 2
        Visible = False
        OnClick = Weather_Config
        SkinData.SkinSection = 'BUTTON'
      end
    end
    object Pwg_timedate: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 10
      SkinData.SkinSection = 'PANEL'
    end
    object Pexf_configuration: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 11
      SkinData.SkinSection = 'PANEL'
    end
    object Pem_zinc_paths: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 13
      SkinData.SkinSection = 'PANEL'
      object sEdit53: TsEdit
        Left = 20
        Top = 50
        Width = 265
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Zinc Execution File'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn47: TsBitBtn
        Left = 286
        Top = 50
        Width = 25
        Height = 21
        Hint = 'Zinc_exe'
        TabOrder = 1
        OnClick = Zinc_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object sEdit54: TsEdit
        Left = 20
        Top = 100
        Width = 265
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Roms'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn48: TsBitBtn
        Left = 286
        Top = 100
        Width = 25
        Height = 21
        Hint = 'Zinc_roms'
        TabOrder = 3
        OnClick = Zinc_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object sEdit55: TsEdit
        Left = 20
        Top = 135
        Width = 265
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Snapshots'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn49: TsBitBtn
        Left = 286
        Top = 135
        Width = 25
        Height = 21
        Hint = 'Zinc_snaps'
        TabOrder = 5
        OnClick = Zinc_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
    end
    object Pem_zinc_graphics: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 14
      SkinData.SkinSection = 'PANEL'
      object grp19: TGroupBox
        Left = 20
        Top = 60
        Width = 253
        Height = 400
        Caption = 'OpenGL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object grp21: TGroupBox
          Left = 3
          Top = 20
          Width = 246
          Height = 139
          Caption = 'Screen'
          TabOrder = 0
          object rb3: TRadioButton
            Left = 3
            Top = 20
            Width = 79
            Height = 17
            Caption = 'Fullscreen'
            TabOrder = 0
          end
          object rb4: TRadioButton
            Left = 170
            Top = 20
            Width = 66
            Height = 17
            Caption = 'Window'
            TabOrder = 1
          end
          object sComboBox26: TsComboBox
            Left = 5
            Top = 50
            Width = 228
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 9
            TabOrder = 2
            Text = '640X480_32bit Color'
            Items.Strings = (
              '320X240_16bit Color'
              '320X240_32bit Color'
              '480X640_16bit Color'
              '480X640_32bit Color'
              '512X384_16bit Color'
              '512X384_32bit Color'
              '512X480_16bit Color'
              '512X480_32bit Color'
              '640X480_16bit Color'
              '640X480_32bit Color'
              '800X600_16bit Color'
              '800X600_32bit Color'
              '1024X768_16bit Color'
              '1024X768_32bit Color'
              '1280X1024_16bit Color'
              '1280X1024_32bit Color')
          end
          object sCheckBox48: TsCheckBox
            Left = 83
            Top = 81
            Width = 72
            Height = 20
            Caption = 'Dithering'
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sComboBox27: TsComboBox
            Left = 5
            Top = 109
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Blending'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopCenter
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 4
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2')
          end
          object sComboBox28: TsComboBox
            Left = 187
            Top = 108
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Scanlines'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopCenter
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 5
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2')
          end
        end
        object grp22: TGroupBox
          Left = 3
          Top = 175
          Width = 246
          Height = 87
          Caption = 'Framerate'
          TabOrder = 1
          object sCheckBox49: TsCheckBox
            Left = 3
            Top = 20
            Width = 73
            Height = 20
            Caption = 'Show FPS'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox50: TsCheckBox
            Left = 3
            Top = 40
            Width = 75
            Height = 20
            Caption = 'Detection'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox51: TsCheckBox
            Left = 154
            Top = 20
            Width = 79
            Height = 20
            Caption = 'Frameskip'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox52: TsCheckBox
            Left = 154
            Top = 40
            Width = 81
            Height = 20
            Caption = 'Framelimit'
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sEdit65: TsEdit
            Left = 131
            Top = 61
            Width = 30
            Height = 21
            TabOrder = 4
            Text = '60'
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Frame Rate'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
        end
        object grp23: TGroupBox
          Left = 3
          Top = 270
          Width = 246
          Height = 74
          Caption = 'Texture'
          TabOrder = 2
          object sComboBox29: TsComboBox
            Left = 120
            Top = 20
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Filtering'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 0
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2'
              '3')
          end
          object sComboBox30: TsComboBox
            Left = 193
            Top = 45
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Quality'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 1
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2')
          end
          object sComboBox31: TsComboBox
            Left = 50
            Top = 45
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Caching'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 2
            Text = '0'
            Items.Strings = (
              '0'
              '4'
              '5'
              '8')
          end
        end
        object grp24: TGroupBox
          Left = 3
          Top = 352
          Width = 246
          Height = 43
          Caption = 'Misc'
          TabOrder = 3
          object sCheckBox53: TsCheckBox
            Left = 51
            Top = 20
            Width = 143
            Height = 20
            Caption = 'Enable Renderer Keys'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object grp25: TGroupBox
        Left = 312
        Top = 60
        Width = 253
        Height = 400
        Caption = 'Direct3D'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object grp26: TGroupBox
          Left = 3
          Top = 20
          Width = 246
          Height = 139
          Caption = 'Screen'
          TabOrder = 0
          object rb5: TRadioButton
            Left = 3
            Top = 20
            Width = 79
            Height = 17
            Caption = 'Fullscreen'
            TabOrder = 0
          end
          object rb6: TRadioButton
            Left = 170
            Top = 20
            Width = 66
            Height = 17
            Caption = 'Window'
            TabOrder = 1
          end
          object sComboBox32: TsComboBox
            Left = 5
            Top = 50
            Width = 228
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'MS Sans Serif'
            BoundLabel.Font.Style = []
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 9
            TabOrder = 2
            Text = '640X480_32bit Color'
            Items.Strings = (
              '320X240_16bit Color'
              '320X240_32bit Color'
              '480X640_16bit Color'
              '480X640_32bit Color'
              '512X384_16bit Color'
              '512X384_32bit Color'
              '512X480_16bit Color'
              '512X480_32bit Color'
              '640X480_16bit Color'
              '640X480_32bit Color'
              '800X600_16bit Color'
              '800X600_32bit Color'
              '1024X768_16bit Color'
              '1024X768_32bit Color'
              '1280X1024_16bit Color'
              '1280X1024_32bit Color')
          end
          object sCheckBox54: TsCheckBox
            Left = 83
            Top = 81
            Width = 72
            Height = 20
            Caption = 'Dithering'
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sComboBox33: TsComboBox
            Left = 5
            Top = 109
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Blending'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopCenter
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 4
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2')
          end
          object sComboBox34: TsComboBox
            Left = 187
            Top = 108
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Scanlines'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclTopCenter
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 5
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2')
          end
        end
        object grp27: TGroupBox
          Left = 3
          Top = 175
          Width = 246
          Height = 87
          Caption = 'Framerate'
          TabOrder = 1
          object sCheckBox55: TsCheckBox
            Left = 3
            Top = 20
            Width = 73
            Height = 20
            Caption = 'Show FPS'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox56: TsCheckBox
            Left = 3
            Top = 40
            Width = 75
            Height = 20
            Caption = 'Detection'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox57: TsCheckBox
            Left = 154
            Top = 20
            Width = 79
            Height = 20
            Caption = 'Frameskip'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox58: TsCheckBox
            Left = 154
            Top = 40
            Width = 81
            Height = 20
            Caption = 'Framelimit'
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sEdit66: TsEdit
            Left = 131
            Top = 61
            Width = 30
            Height = 21
            TabOrder = 4
            Text = '60'
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Frame Rate'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
        end
        object grp28: TGroupBox
          Left = 3
          Top = 270
          Width = 246
          Height = 74
          Caption = 'Texture'
          TabOrder = 2
          object sComboBox35: TsComboBox
            Left = 120
            Top = 12
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Filtering'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 0
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2'
              '3')
          end
          object sComboBox36: TsComboBox
            Left = 193
            Top = 45
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Quality'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 1
            Text = '0'
            Items.Strings = (
              '0'
              '1'
              '2')
          end
          object sComboBox37: TsComboBox
            Left = 50
            Top = 45
            Width = 45
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Caching'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 0
            TabOrder = 2
            Text = '0'
            Items.Strings = (
              '0'
              '4'
              '5'
              '8')
          end
        end
        object grp29: TGroupBox
          Left = 3
          Top = 352
          Width = 246
          Height = 43
          Caption = 'Misc'
          TabOrder = 3
          object sCheckBox59: TsCheckBox
            Left = 59
            Top = 20
            Width = 143
            Height = 20
            Caption = 'Enable Renderer Keys'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object grp1: TGroupBox
        Left = 139
        Top = 6
        Width = 294
        Height = 43
        Caption = 'Graphics State'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object rb9: TRadioButton
          Left = 5
          Top = 20
          Width = 68
          Height = 17
          Hint = 'OpenGL'
          Caption = 'OpenGL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          OnClick = Zinc_ClickGraphicsState
        end
        object rb10: TRadioButton
          Left = 189
          Top = 20
          Width = 68
          Height = 17
          Hint = 'D3D'
          Caption = 'Direct3D'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = Zinc_ClickGraphicsState
        end
      end
    end
    object Pem_hatari_system: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 16
      SkinData.SkinSection = 'PANEL'
      object sLabel21: TsLabel
        Left = 482
        Top = 640
        Width = 75
        Height = 13
        Caption = '* Incomplete'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object grp36: TGroupBox
        Left = 19
        Top = 1
        Width = 580
        Height = 192
        Caption = 'System'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object grp38: TGroupBox
          Left = 6
          Top = 20
          Width = 140
          Height = 125
          Caption = 'Machine'
          TabOrder = 0
          object rb13: TRadioButton
            Left = 5
            Top = 25
            Width = 113
            Height = 17
            Caption = 'Atari ST/STFM'
            TabOrder = 0
          end
          object rb14: TRadioButton
            Left = 5
            Top = 50
            Width = 113
            Height = 17
            Caption = 'Atari STE'
            TabOrder = 1
          end
          object rb15: TRadioButton
            Left = 5
            Top = 75
            Width = 113
            Height = 17
            Caption = 'Atari TT*'
            TabOrder = 2
          end
          object rb16: TRadioButton
            Left = 5
            Top = 100
            Width = 113
            Height = 17
            Caption = 'Atari Falcon*'
            TabOrder = 3
          end
        end
        object grp39: TGroupBox
          Left = 150
          Top = 20
          Width = 140
          Height = 150
          Caption = 'Cpu Type'
          TabOrder = 1
          object rb17: TRadioButton
            Left = 5
            Top = 25
            Width = 113
            Height = 17
            Caption = '68000'
            TabOrder = 0
          end
          object rb18: TRadioButton
            Left = 5
            Top = 50
            Width = 113
            Height = 17
            Caption = '68010'
            TabOrder = 1
          end
          object rb19: TRadioButton
            Left = 5
            Top = 75
            Width = 113
            Height = 17
            Caption = '68020'
            TabOrder = 2
          end
          object rb20: TRadioButton
            Left = 5
            Top = 100
            Width = 113
            Height = 17
            Caption = '68EC030 + FPU'
            TabOrder = 3
          end
          object rb21: TRadioButton
            Left = 5
            Top = 128
            Width = 125
            Height = 17
            Caption = '68040'
            TabOrder = 4
          end
        end
        object grp40: TGroupBox
          Left = 293
          Top = 20
          Width = 250
          Height = 149
          Caption = 'Emulator Cpu Configs'
          TabOrder = 2
          object sCheckBox86: TsCheckBox
            Left = 5
            Top = 25
            Width = 204
            Height = 20
            Caption = 'Slower But More Compatible CPU'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox87: TsCheckBox
            Left = 5
            Top = 50
            Width = 114
            Height = 20
            Caption = 'Blitter Emulation'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox88: TsCheckBox
            Left = 5
            Top = 75
            Width = 168
            Height = 20
            Caption = 'Real Time Clock Emulation'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox89: TsCheckBox
            Left = 5
            Top = 100
            Width = 101
            Height = 20
            Caption = 'Patch Timer-D'
            TabOrder = 3
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox60: TsCheckBox
            Left = 5
            Top = 124
            Width = 166
            Height = 20
            Caption = 'Patch TOS For Faster Boot'
            TabOrder = 4
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
        object sComboBox43: TsComboBox
          Left = 102
          Top = 168
          Width = 45
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'CPU Clock (Mhz)'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 3
          Text = '8'
          Items.Strings = (
            '8'
            '16'
            '32')
        end
        object sComboBox45: TsComboBox
          Left = 469
          Top = 168
          Width = 75
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Falcon DSP'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 4
          Text = 'Off'
          Items.Strings = (
            'Off'
            'Dummy'
            'On')
        end
      end
      object grp37: TGroupBox
        Left = 20
        Top = 192
        Width = 580
        Height = 113
        Caption = 'Memory'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object grp41: TGroupBox
          Left = 5
          Top = 20
          Width = 185
          Height = 93
          Caption = 'Ram - Size'
          TabOrder = 0
          object rb22: TRadioButton
            Left = 5
            Top = 20
            Width = 70
            Height = 17
            Caption = '512 (Kb)'
            TabOrder = 0
          end
          object rb23: TRadioButton
            Left = 5
            Top = 45
            Width = 70
            Height = 17
            Caption = '1 (Mb)'
            TabOrder = 1
          end
          object rb24: TRadioButton
            Left = 5
            Top = 70
            Width = 70
            Height = 17
            Caption = '2 (Mb)'
            TabOrder = 2
          end
          object rb25: TRadioButton
            Left = 90
            Top = 20
            Width = 70
            Height = 17
            Caption = '4 (Mb)'
            TabOrder = 3
          end
          object rb26: TRadioButton
            Left = 90
            Top = 45
            Width = 70
            Height = 17
            Caption = '8(Mb)'
            TabOrder = 4
          end
          object rb27: TRadioButton
            Left = 90
            Top = 70
            Width = 70
            Height = 17
            Caption = '14(Mb)'
            TabOrder = 5
          end
        end
        object grp42: TGroupBox
          Left = 195
          Top = 20
          Width = 378
          Height = 93
          Caption = 'Memory State Save'
          TabOrder = 1
          object sLabel22: TsLabel
            Left = 10
            Top = 20
            Width = 360
            Height = 20
            AutoSize = False
            Caption = 'c:/progr'
          end
          object sCheckBox91: TsCheckBox
            Left = 155
            Top = 61
            Width = 217
            Height = 20
            Hint = 'Auto_memory_state'
            Caption = 'Load / Save State At StartUp / Exit'
            TabOrder = 0
            OnClick = Hatari_ConfigSystem
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object grp45: TGroupBox
        Left = 78
        Top = 306
        Width = 480
        Height = 289
        Caption = 'Devices'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object grp46: TGroupBox
          Left = 5
          Top = 20
          Width = 470
          Height = 63
          Caption = 'Printer'
          TabOrder = 0
          object sLabel23: TsLabel
            Left = 5
            Top = 45
            Width = 46
            Height = 13
            Caption = 'c:/progr'
          end
          object sLabel24: TsLabel
            Left = 5
            Top = 26
            Width = 66
            Height = 13
            Caption = 'Print To File'
          end
          object sCheckBox92: TsCheckBox
            Left = 300
            Top = 10
            Width = 158
            Height = 20
            Caption = 'Enable Printer Emulation'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
        object grp47: TGroupBox
          Left = 5
          Top = 83
          Width = 470
          Height = 101
          Caption = 'RS232'
          TabOrder = 1
          object sLabel25: TsLabel
            Left = 5
            Top = 26
            Width = 109
            Height = 13
            Caption = 'Write RS232 To File'
          end
          object sLabel26: TsLabel
            Left = 5
            Top = 45
            Width = 46
            Height = 13
            Caption = 'c:/progr'
          end
          object sLabel27: TsLabel
            Left = 5
            Top = 66
            Width = 107
            Height = 13
            Caption = 'Read RS232 To File'
          end
          object sLabel53: TsLabel
            Left = 5
            Top = 85
            Width = 46
            Height = 13
            Caption = 'c:/progr'
          end
          object sCheckBox93: TsCheckBox
            Left = 300
            Top = 10
            Width = 155
            Height = 20
            Caption = 'Enable RS232 Emulation'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
        object grp48: TGroupBox
          Left = 5
          Top = 184
          Width = 470
          Height = 101
          Caption = 'Midi'
          TabOrder = 2
          object sLabel54: TsLabel
            Left = 5
            Top = 26
            Width = 96
            Height = 13
            Caption = 'Write Midi To File'
          end
          object sLabel55: TsLabel
            Left = 5
            Top = 45
            Width = 46
            Height = 13
            Caption = 'c:/progr'
          end
          object sLabel56: TsLabel
            Left = 5
            Top = 66
            Width = 94
            Height = 13
            Caption = 'Read Midi To File'
          end
          object sLabel57: TsLabel
            Left = 5
            Top = 85
            Width = 46
            Height = 13
            Caption = 'c:/progr'
          end
          object sCheckBox94: TsCheckBox
            Left = 300
            Top = 10
            Width = 142
            Height = 20
            Caption = 'Enable Midi Emulation'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
    end
    object Pem_psx_paths: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 20
      SkinData.SkinSection = 'PANEL'
      object sWebLabel2: TsWebLabel
        Left = 531
        Top = 637
        Width = 28
        Height = 13
        Caption = 'Here'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HoverFont.Charset = DEFAULT_CHARSET
        HoverFont.Color = clWindowText
        HoverFont.Height = -11
        HoverFont.Name = 'MS Sans Serif'
        HoverFont.Style = []
      end
      object sWebLabel1: TsWebLabel
        Left = 474
        Top = 616
        Width = 28
        Height = 13
        Caption = 'Here'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HoverFont.Charset = DEFAULT_CHARSET
        HoverFont.Color = clWindowText
        HoverFont.Height = -11
        HoverFont.Name = 'MS Sans Serif'
        HoverFont.Style = []
      end
      object sLabel82: TsLabel
        Left = 250
        Top = 616
        Width = 223
        Height = 13
        Caption = 'Download An Empty Memory Card From'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sLabel83: TsLabel
        Left = 250
        Top = 637
        Width = 280
        Height = 13
        Caption = 'Download The Missing Dll File (d3dx9_26.dll) From'
        ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
      end
      object sEdit81: TsEdit
        Left = 20
        Top = 50
        Width = 395
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Execution pSX File'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn76: TsBitBtn
        Left = 421
        Top = 50
        Width = 25
        Height = 21
        Hint = 'pSX_exe'
        TabOrder = 1
        OnClick = pSX_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object sEdit82: TsEdit
        Left = 20
        Top = 100
        Width = 395
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Rom File (scph1001.bin)'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn77: TsBitBtn
        Left = 421
        Top = 100
        Width = 25
        Height = 21
        Hint = 'pSX_bios'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = pSX_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object grp62: TGroupBox
        Left = 20
        Top = 160
        Width = 469
        Height = 140
        Caption = 'More Paths'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object sEdit83: TsEdit
          Left = 90
          Top = 30
          Width = 340
          Height = 21
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Screenshots'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit84: TsEdit
          Left = 90
          Top = 55
          Width = 340
          Height = 21
          ReadOnly = True
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'CD Images'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit85: TsEdit
          Left = 90
          Top = 80
          Width = 340
          Height = 21
          ReadOnly = True
          TabOrder = 2
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Save States'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit86: TsEdit
          Left = 90
          Top = 105
          Width = 340
          Height = 21
          ReadOnly = True
          TabOrder = 3
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Memory Cards'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBitBtn78: TsBitBtn
          Left = 434
          Top = 30
          Width = 25
          Height = 21
          Hint = 'pSX_screenshotsdir'
          TabOrder = 4
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn79: TsBitBtn
          Left = 434
          Top = 55
          Width = 25
          Height = 21
          Hint = 'pSX_cdimagesdir'
          TabOrder = 5
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn80: TsBitBtn
          Left = 434
          Top = 80
          Width = 25
          Height = 21
          Hint = 'pSX_savestatesdir'
          TabOrder = 6
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn81: TsBitBtn
          Left = 434
          Top = 105
          Width = 25
          Height = 21
          Hint = 'pSX_memorycardsdir'
          TabOrder = 7
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
      end
      object grp63: TGroupBox
        Left = 20
        Top = 300
        Width = 469
        Height = 105
        Caption = 'Memory Cards'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object sEdit87: TsEdit
          Left = 90
          Top = 30
          Width = 310
          Height = 21
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'MC - Slot 1'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit88: TsEdit
          Left = 90
          Top = 55
          Width = 310
          Height = 21
          ReadOnly = True
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'MC - Slot 2'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBitBtn82: TsBitBtn
          Left = 404
          Top = 30
          Width = 25
          Height = 21
          Hint = 'pSX_mcard1'
          TabOrder = 2
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn83: TsBitBtn
          Left = 404
          Top = 55
          Width = 25
          Height = 21
          Hint = 'pSX_mcard2'
          TabOrder = 3
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn84: TsBitBtn
          Left = 434
          Top = 55
          Width = 25
          Height = 21
          Hint = 'pSX_ejectmcard2'
          TabOrder = 4
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
        object sBitBtn85: TsBitBtn
          Left = 434
          Top = 30
          Width = 25
          Height = 21
          Hint = 'pSX_ejectmcard1'
          TabOrder = 5
          OnClick = pSX_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
      end
    end
    object Pem_psx_screen: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 21
      SkinData.SkinSection = 'PANEL'
      object sCheckBox103: TsCheckBox
        Left = 20
        Top = 50
        Width = 140
        Height = 20
        Caption = 'Bilinear Interpolation'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox104: TsCheckBox
        Left = 20
        Top = 70
        Width = 107
        Height = 20
        Caption = 'Frame Skipping'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox105: TsCheckBox
        Left = 20
        Top = 90
        Width = 160
        Height = 20
        Caption = 'Pause When Not Focused'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object sCheckBox106: TsCheckBox
        Left = 20
        Top = 110
        Width = 91
        Height = 20
        Caption = 'Status Icons'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
      object grp64: TGroupBox
        Left = 20
        Top = 135
        Width = 400
        Height = 165
        Caption = 'Fullscreen'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object sComboBox58: TsComboBox
          Left = 42
          Top = 30
          Width = 128
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'PAL :  '
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 0
          Text = 'Default'
          Items.Strings = (
            'Default')
        end
        object sComboBox59: TsComboBox
          Left = 42
          Top = 55
          Width = 128
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'NTSC :'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 1
          Text = 'Default'
          Items.Strings = (
            'Default')
        end
        object sComboBox60: TsComboBox
          Left = 52
          Top = 106
          Width = 342
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Monitor'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = -1
          TabOrder = 2
        end
        object sComboBox61: TsComboBox
          Left = 290
          Top = 30
          Width = 105
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Aspect Ratio'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = -1
          TabOrder = 3
          Text = 'No Correction'
          Items.Strings = (
            'No Correction'
            'Auto'
            '3:4'
            '5:4'
            '16:9'
            '16:10')
        end
        object sCheckBox107: TsCheckBox
          Left = 298
          Top = 140
          Width = 93
          Height = 20
          Caption = 'Vertical Sync'
          TabOrder = 4
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp65: TGroupBox
        Left = 20
        Top = 300
        Width = 400
        Height = 64
        Caption = 'Windowed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object sCheckBox108: TsCheckBox
          Left = 5
          Top = 20
          Width = 111
          Height = 20
          Caption = 'Sleep When Idle'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox109: TsCheckBox
          Left = 5
          Top = 40
          Width = 54
          Height = 20
          Caption = 'VSync'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp66: TGroupBox
        Left = 20
        Top = 364
        Width = 400
        Height = 121
        Caption = 'Display Adjustments'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        object sLabel84: TsLabel
          Left = 5
          Top = 46
          Width = 44
          Height = 13
          Caption = 'Gamma'
        end
        object sLabel85: TsLabel
          Left = 5
          Top = 71
          Width = 60
          Height = 13
          Caption = 'Brightness'
        end
        object sLabel86: TsLabel
          Left = 5
          Top = 96
          Width = 49
          Height = 13
          Caption = 'Contrast'
        end
        object sLabel87: TsLabel
          Left = 365
          Top = 46
          Width = 29
          Height = 13
          Caption = '-1.00'
        end
        object sLabel88: TsLabel
          Left = 365
          Top = 71
          Width = 29
          Height = 13
          Caption = '-1.00'
        end
        object sLabel89: TsLabel
          Left = 365
          Top = 96
          Width = 29
          Height = 13
          Caption = '-1.00'
        end
        object sbar_psx_gamma: TsScrollBar
          Left = 70
          Top = 46
          Width = 290
          Height = 13
          Hint = 'pSX_gamma'
          Max = 500
          PageSize = 0
          TabOrder = 0
          OnChange = pSX_ConfigScreen
          SkinManager = SkinM
        end
        object sbar_psx_brightness: TsScrollBar
          Left = 70
          Top = 71
          Width = 290
          Height = 13
          Hint = 'pSX_brightness'
          Min = -100
          PageSize = 0
          TabOrder = 1
          OnChange = pSX_ConfigScreen
          SkinManager = SkinM
        end
        object sbar_psx_contrast: TsScrollBar
          Left = 70
          Top = 96
          Width = 290
          Height = 13
          Hint = 'pSX_contrast'
          Min = -100
          PageSize = 0
          TabOrder = 2
          OnChange = pSX_ConfigScreen
          SkinManager = SkinM
        end
        object sBitBtn86: TsBitBtn
          Left = 368
          Top = 10
          Width = 25
          Height = 21
          Hint = 'pSX_resetgraphics_to_default'
          TabOrder = 3
          OnClick = pSX_ConfigScreen
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 10
          Images = InBitBtn_Imagelist
        end
      end
    end
    object Pem_psx_sound: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 22
      SkinData.SkinSection = 'PANEL'
      object grp11: TGroupBox
        Left = 5
        Top = 135
        Width = 580
        Height = 455
        Caption = 'Controllers'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sComboBox21: TsComboBox
          Left = 430
          Top = 26
          Width = 145
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Device'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'None'
          Items.Strings = (
            'None')
        end
        object sComboBox22: TsComboBox
          Left = 430
          Top = 53
          Width = 145
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Type'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'None'
          Items.Strings = (
            'None'
            'SCPH-1010: Normal Pad'
            'SCPH-1150: Analog + Rumble'
            'SCPH-1200: DualShock'
            'SCPH-0034: GunCon')
        end
        object grp12: TGroupBox
          Left = 5
          Top = 71
          Width = 570
          Height = 371
          Caption = 'Controller Setup = Joystick 1'
          TabOrder = 2
          object sLabel108: TsLabel
            Left = 284
            Top = 352
            Width = 3
            Height = 13
            Alignment = taCenter
          end
          object sCheckBox47: TsCheckBox
            Left = 502
            Top = 347
            Width = 63
            Height = 20
            Caption = 'Rumble'
            Alignment = taLeftJustify
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sPanel: TsPanel
            Left = 16
            Top = 32
            Width = 84
            Height = 19
            Hint = 'L1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel2: TsPanel
            Left = 104
            Top = 32
            Width = 84
            Height = 19
            Hint = 'L2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel3: TsPanel
            Left = 200
            Top = 32
            Width = 84
            Height = 19
            Hint = 'Select'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel4: TsPanel
            Left = 288
            Top = 32
            Width = 84
            Height = 19
            Hint = 'Start'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 4
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel5: TsPanel
            Left = 384
            Top = 32
            Width = 84
            Height = 19
            Hint = 'R1'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel6: TsPanel
            Left = 472
            Top = 32
            Width = 84
            Height = 19
            Hint = 'R2'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel7: TsPanel
            Left = 3
            Top = 101
            Width = 84
            Height = 19
            Hint = 'Digital Pad UP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel8: TsPanel
            Left = 3
            Top = 134
            Width = 84
            Height = 19
            Hint = 'Digital Pad LEFT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 8
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel9: TsPanel
            Left = 3
            Top = 162
            Width = 84
            Height = 19
            Hint = 'Digital Pad RIGHT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel10: TsPanel
            Left = 3
            Top = 197
            Width = 84
            Height = 19
            Hint = 'Digital Pad DOWN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 10
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel11: TsPanel
            Left = 3
            Top = 232
            Width = 84
            Height = 19
            Hint = 'Analog Joystick UP'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 11
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel12: TsPanel
            Left = 3
            Top = 256
            Width = 84
            Height = 19
            Hint = 'Analog Joystick LEFT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 12
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel13: TsPanel
            Left = 488
            Top = 96
            Width = 84
            Height = 19
            Hint = 'Triangle '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 13
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel14: TsPanel
            Left = 488
            Top = 130
            Width = 84
            Height = 19
            Hint = 'Circle'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 14
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel15: TsPanel
            Left = 488
            Top = 163
            Width = 84
            Height = 19
            Hint = 'Square'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 15
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel16: TsPanel
            Left = 488
            Top = 200
            Width = 84
            Height = 19
            Hint = 'Cross'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 16
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel17: TsPanel
            Left = 197
            Top = 272
            Width = 84
            Height = 19
            Hint = 'L3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 17
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel18: TsPanel
            Left = 291
            Top = 272
            Width = 84
            Height = 19
            Hint = 'R3'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 18
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel19: TsPanel
            Left = 3
            Top = 280
            Width = 84
            Height = 19
            Hint = 'Analog Joystick RIGHT'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 19
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel20: TsPanel
            Left = 3
            Top = 304
            Width = 84
            Height = 19
            Hint = 'Analog Joystick DOWN'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 20
            OnClick = CheckUpKey
            SkinData.CustomColor = True
            SkinData.SkinSection = 'PANEL'
          end
        end
        object sComboBox62: TsComboBox
          Left = 183
          Top = 35
          Width = 74
          Height = 21
          Hint = 'pSX_joystick'
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Joystick'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 3
          Text = ' Port 1'
          OnChange = pSX_ConfigSound
          Items.Strings = (
            ' Port 1'
            ' Port 2')
        end
      end
      object grp67: TGroupBox
        Left = 5
        Top = 10
        Width = 440
        Height = 125
        Caption = 'Sound'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sComboBox63: TsComboBox
          Left = 84
          Top = 11
          Width = 145
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Device'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 0
          Text = 'Disabled'
          Items.Strings = (
            'Disabled')
        end
        object sComboBox64: TsComboBox
          Left = 355
          Top = 64
          Width = 80
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Frequency'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopCenter
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = -1
          TabOrder = 1
          Text = '44100 Hz'
          Items.Strings = (
            '8000 Hz'
            '11025 Hz'
            '22050 Hz'
            '44100 Hz'
            '48000 Hz')
        end
        object sCheckBox25: TsCheckBox
          Left = 5
          Top = 45
          Width = 61
          Height = 20
          Caption = 'Reverb'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox42: TsCheckBox
          Left = 5
          Top = 86
          Width = 85
          Height = 20
          Caption = 'Interpolate'
          TabOrder = 3
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox45: TsCheckBox
          Left = 261
          Top = 25
          Width = 175
          Height = 20
          Hint = 'pSX_same'
          Caption = 'Same As Emulated Machine'
          TabOrder = 4
          OnClick = pSX_ConfigSound
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox46: TsCheckBox
          Left = 5
          Top = 65
          Width = 85
          Height = 20
          Caption = 'Sync Sound'
          TabOrder = 5
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object grp68: TGroupBox
          Left = 94
          Top = 42
          Width = 259
          Height = 81
          TabOrder = 6
          object sLabel90: TsLabel
            Left = 210
            Top = 58
            Width = 41
            Height = 13
            Caption = '150 ms'
          end
          object sLabel91: TsLabel
            Left = 83
            Top = 42
            Width = 63
            Height = 13
            Caption = 'XA Latency'
          end
          object sLabel93: TsLabel
            Left = 87
            Top = 8
            Width = 45
            Height = 13
            Caption = 'Latency'
          end
          object sLabel92: TsLabel
            Left = 212
            Top = 25
            Width = 41
            Height = 13
            Caption = '150 ms'
          end
          object sbar_psx_latency: TsScrollBar
            Left = 4
            Top = 25
            Width = 203
            Height = 13
            Hint = 'pSX_latancy'
            Max = 150
            PageSize = 0
            TabOrder = 0
            OnChange = pSX_ConfigSound
            SkinManager = SkinM
          end
          object sbar_psx_xalatency: TsScrollBar
            Left = 4
            Top = 58
            Width = 203
            Height = 13
            Hint = 'pSX_xalatancy'
            Max = 150
            PageSize = 0
            TabOrder = 1
            OnChange = pSX_ConfigSound
            SkinManager = SkinM
          end
        end
      end
    end
    object Pem_psx_others: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 23
      SkinData.SkinSection = 'PANEL'
      object grp13: TGroupBox
        Left = 20
        Top = 30
        Width = 400
        Height = 95
        Caption = 'CD-Rom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object sComboBox23: TsComboBox
          Left = 45
          Top = 30
          Width = 140
          Height = 21
          Alignment = taRightJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Driver'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'Auto Detect'
          Items.Strings = (
            'Auto Detect'
            'IoControl'
            'ASPI')
        end
        object sComboBox24: TsComboBox
          Left = 253
          Top = 65
          Width = 140
          Height = 21
          Alignment = taRightJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Subcode Reading'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 1
          Text = 'Auto'
          Items.Strings = (
            'Auto'
            'Full Subcode'
            'Sub-Q Only'
            'Disabled')
        end
      end
      object grp14: TGroupBox
        Left = 113
        Top = 137
        Width = 400
        Height = 510
        Caption = 'Misc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sLabel113: TsLabel
          Left = 40
          Top = 20
          Width = 131
          Height = 13
          Alignment = taRightJustify
          Caption = 'Toggle Status Display : '
        end
        object sLabel114: TsLabel
          Left = 95
          Top = 60
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mute Sound : '
        end
        object sLabel115: TsLabel
          Left = 67
          Top = 84
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Caption = 'Increase Volume : '
        end
        object sLabel116: TsLabel
          Left = 64
          Top = 108
          Width = 107
          Height = 13
          Alignment = taRightJustify
          Caption = 'Decrease Volume : '
        end
        object sLabel117: TsLabel
          Left = 49
          Top = 132
          Width = 122
          Height = 13
          Alignment = taRightJustify
          Caption = 'Increase XA Volume : '
        end
        object sLabel118: TsLabel
          Left = 46
          Top = 156
          Width = 125
          Height = 13
          Alignment = taRightJustify
          Caption = 'Decrease XA Volume : '
        end
        object sLabel119: TsLabel
          Left = 46
          Top = 188
          Width = 125
          Height = 13
          Alignment = taRightJustify
          Caption = 'Toggle Sound Status : '
        end
        object sLabel120: TsLabel
          Left = 89
          Top = 212
          Width = 82
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fast Forward : '
        end
        object sLabel121: TsLabel
          Left = 65
          Top = 268
          Width = 106
          Height = 13
          Alignment = taRightJustify
          Caption = 'Increase Gamma : '
        end
        object sLabel122: TsLabel
          Left = 62
          Top = 292
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = 'Decrease Gamma : '
        end
        object sLabel123: TsLabel
          Left = 49
          Top = 316
          Width = 122
          Height = 13
          Alignment = taRightJustify
          Caption = 'Increase Brightness : '
        end
        object sLabel124: TsLabel
          Left = 46
          Top = 340
          Width = 125
          Height = 13
          Alignment = taRightJustify
          Caption = 'Decrease Brightness : '
        end
        object sLabel125: TsLabel
          Left = 60
          Top = 364
          Width = 111
          Height = 13
          Alignment = taRightJustify
          Caption = 'Increase Contrast : '
        end
        object sLabel126: TsLabel
          Left = 57
          Top = 388
          Width = 114
          Height = 13
          Alignment = taRightJustify
          Caption = 'Decrease Contrast : '
        end
        object sLabel127: TsLabel
          Left = 98
          Top = 420
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Screenshot : '
        end
        object sLabel128: TsLabel
          Left = 96
          Top = 236
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Show VRAM : '
        end
        object sLabel129: TsLabel
          Left = 271
          Top = 38
          Width = 126
          Height = 13
          Caption = 'This key already used.'
          Visible = False
        end
        object sComboBox25: TsComboBox
          Left = 214
          Top = 440
          Width = 57
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Screenshot Format'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ItemHeight = 15
          ItemIndex = 0
          ParentFont = False
          TabOrder = 0
          Text = 'png'
          Items.Strings = (
            'png'
            'jpg'
            'bmp')
        end
        object sComboBox65: TsComboBox
          Left = 125
          Top = 472
          Width = 148
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'ESC'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 1
          Text = 'Quit'
          Items.Strings = (
            'Quit'
            'Exit Fullscreen')
        end
        object sPanel21: TsPanel
          Left = 180
          Top = 16
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel22: TsPanel
          Left = 180
          Top = 56
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel23: TsPanel
          Left = 180
          Top = 80
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel24: TsPanel
          Left = 180
          Top = 104
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel25: TsPanel
          Left = 180
          Top = 128
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel26: TsPanel
          Left = 180
          Top = 152
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 7
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel27: TsPanel
          Left = 180
          Top = 184
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel28: TsPanel
          Left = 180
          Top = 208
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel29: TsPanel
          Left = 180
          Top = 264
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 10
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel30: TsPanel
          Left = 180
          Top = 288
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 11
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel31: TsPanel
          Left = 180
          Top = 312
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 12
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel32: TsPanel
          Left = 180
          Top = 336
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 13
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel33: TsPanel
          Left = 180
          Top = 360
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel34: TsPanel
          Left = 180
          Top = 384
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel35: TsPanel
          Left = 180
          Top = 416
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel36: TsPanel
          Left = 180
          Top = 232
          Width = 89
          Height = 19
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 17
          OnClick = CheckUpKey
          SkinData.CustomColor = True
          SkinData.SkinSection = 'PANEL'
        end
      end
    end
    object Pem_kigb_paths: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 24
      SkinData.SkinSection = 'PANEL'
      object sEdit89: TsEdit
        Left = 20
        Top = 45
        Width = 370
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Execution Kigb '
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn87: TsBitBtn
        Left = 398
        Top = 45
        Width = 25
        Height = 21
        Hint = 'Kigb_getkigb'
        TabOrder = 1
        OnClick = Kigb_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object grp69: TGroupBox
        Left = 20
        Top = 77
        Width = 405
        Height = 268
        Caption = 'Directories'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object sEdit90: TsEdit
          Left = 5
          Top = 35
          Width = 365
          Height = 21
          ReadOnly = True
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Roms'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit91: TsEdit
          Left = 5
          Top = 75
          Width = 365
          Height = 21
          ReadOnly = True
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Snapshots'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit92: TsEdit
          Left = 5
          Top = 115
          Width = 365
          Height = 21
          ReadOnly = True
          TabOrder = 2
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Save'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit93: TsEdit
          Left = 5
          Top = 155
          Width = 365
          Height = 21
          ReadOnly = True
          TabOrder = 3
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Savestate'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit94: TsEdit
          Left = 5
          Top = 195
          Width = 365
          Height = 21
          ReadOnly = True
          TabOrder = 4
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Input'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit95: TsEdit
          Left = 5
          Top = 235
          Width = 365
          Height = 21
          ReadOnly = True
          TabOrder = 5
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Configure'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclTopLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBitBtn88: TsBitBtn
          Left = 376
          Top = 35
          Width = 25
          Height = 21
          Hint = 'Kigb_rompath'
          TabOrder = 6
          OnClick = Kigb_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn89: TsBitBtn
          Left = 376
          Top = 75
          Width = 25
          Height = 21
          Hint = 'Kigb_snappath'
          TabOrder = 7
          OnClick = Kigb_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn90: TsBitBtn
          Left = 376
          Top = 115
          Width = 25
          Height = 21
          Hint = 'Kigb_savepath'
          TabOrder = 8
          OnClick = Kigb_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn91: TsBitBtn
          Left = 376
          Top = 155
          Width = 25
          Height = 21
          Hint = 'Kigb_savestatepath'
          TabOrder = 9
          OnClick = Kigb_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn92: TsBitBtn
          Left = 376
          Top = 195
          Width = 25
          Height = 21
          Hint = 'Kigb_inputpath'
          TabOrder = 10
          OnClick = Kigb_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn93: TsBitBtn
          Left = 376
          Top = 235
          Width = 25
          Height = 21
          Hint = 'Kigb_configurepath'
          TabOrder = 11
          OnClick = Kigb_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
      end
      object grp70: TGroupBox
        Left = 20
        Top = 345
        Width = 315
        Height = 196
        Caption = 'System'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object grp71: TGroupBox
          Left = 5
          Top = 25
          Width = 150
          Height = 142
          Caption = 'Type Setup'
          TabOrder = 0
          object sCheckBox110: TsCheckBox
            Left = 5
            Top = 25
            Width = 74
            Height = 20
            Caption = 'Gameboy'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox111: TsCheckBox
            Left = 5
            Top = 50
            Width = 106
            Height = 20
            Caption = 'Gameboy Color'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox112: TsCheckBox
            Left = 5
            Top = 75
            Width = 110
            Height = 20
            Caption = 'Super Gameboy'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object rb1: TRadioButton
            Left = 50
            Top = 95
            Width = 70
            Height = 17
            Caption = 'SBG'
            TabOrder = 3
          end
          object rb2: TRadioButton
            Left = 50
            Top = 115
            Width = 70
            Height = 17
            Caption = 'SBG2'
            TabOrder = 4
          end
        end
        object grp72: TGroupBox
          Left = 160
          Top = 25
          Width = 150
          Height = 142
          Caption = 'Preference'
          TabOrder = 1
          object rb31: TRadioButton
            Left = 5
            Top = 25
            Width = 128
            Height = 17
            Caption = 'GBC (SGB Border)'
            TabOrder = 0
          end
          object rb32: TRadioButton
            Left = 5
            Top = 50
            Width = 137
            Height = 17
            Caption = 'GBC -> SGB -> GB'
            TabOrder = 1
          end
          object rb33: TRadioButton
            Left = 5
            Top = 75
            Width = 143
            Height = 17
            Caption = 'SGB -> GBC -> BG'
            TabOrder = 2
          end
        end
        object sCheckBox113: TsCheckBox
          Left = 5
          Top = 172
          Width = 150
          Height = 20
          Caption = 'Run GBC Games In GBA'
          TabOrder = 2
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp73: TGroupBox
        Left = 340
        Top = 345
        Width = 240
        Height = 196
        Caption = 'System Config'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object grp74: TGroupBox
          Left = 5
          Top = 25
          Width = 230
          Height = 67
          Caption = 'Speed'
          TabOrder = 0
          object sComboBox66: TsComboBox
            Left = 131
            Top = 24
            Width = 73
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Emulation Speed'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = -1
            TabOrder = 0
            Items.Strings = (
              '25 %'
              '50 %'
              '100 %'
              '200 %'
              '400 %')
          end
        end
        object grp75: TGroupBox
          Left = 5
          Top = 92
          Width = 230
          Height = 99
          Caption = 'Boot Rom'
          TabOrder = 1
          object sCheckBox63: TsCheckBox
            Left = 88
            Top = 24
            Width = 35
            Height = 20
            Caption = 'GB'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox64: TsCheckBox
            Left = 88
            Top = 56
            Width = 42
            Height = 20
            Caption = 'GBC'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object sCheckBox115: TsCheckBox
        Left = 428
        Top = 319
        Width = 154
        Height = 20
        Caption = 'Per Game Configuration'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        SkinData.SkinSection = 'CHECKBOX'
        ImgChecked = 0
        ImgUnchecked = 0
      end
    end
    object Pem_kigb_screen: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 25
      SkinData.SkinSection = 'PANEL'
      object grp78: TGroupBox
        Left = 20
        Top = 30
        Width = 103
        Height = 195
        Caption = 'Video'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object rb39: TRadioButton
          Left = 5
          Top = 30
          Width = 80
          Height = 17
          Caption = '1x1'
          TabOrder = 0
        end
        object rb40: TRadioButton
          Left = 5
          Top = 55
          Width = 80
          Height = 17
          Caption = '2x2'
          TabOrder = 1
        end
        object rb41: TRadioButton
          Left = 5
          Top = 80
          Width = 80
          Height = 17
          Caption = '3x3'
          TabOrder = 2
        end
        object rb42: TRadioButton
          Left = 5
          Top = 105
          Width = 80
          Height = 17
          Caption = 'Fullscreen'
          TabOrder = 3
        end
      end
      object grp79: TGroupBox
        Left = 131
        Top = 30
        Width = 201
        Height = 195
        Caption = 'Options'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object grp17: TGroupBox
          Left = 8
          Top = 48
          Width = 185
          Height = 105
          TabOrder = 2
          object sCheckBox117: TsCheckBox
            Left = 40
            Top = 19
            Width = 87
            Height = 20
            Caption = 'Background'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox119: TsCheckBox
            Left = 40
            Top = 46
            Width = 64
            Height = 20
            Caption = 'Window'
            TabOrder = 1
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sCheckBox120: TsCheckBox
            Left = 40
            Top = 77
            Width = 54
            Height = 20
            Caption = 'Sprite'
            TabOrder = 2
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
        object sCheckBox116: TsCheckBox
          Left = 5
          Top = 22
          Width = 64
          Height = 20
          Caption = 'Shadow'
          TabOrder = 0
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
        object sCheckBox118: TsCheckBox
          Left = 11
          Top = 160
          Width = 79
          Height = 20
          Caption = 'Mix Frame'
          TabOrder = 1
          SkinData.SkinSection = 'CHECKBOX'
          ImgChecked = 0
          ImgUnchecked = 0
        end
      end
      object grp80: TGroupBox
        Left = 24
        Top = 254
        Width = 505
        Height = 323
        Caption = 'Pallete'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object rb43: TRadioButton
          Left = 5
          Top = 30
          Width = 80
          Height = 17
          Hint = 'Kigb_otherthancustom'
          Caption = 'Classic GB'
          TabOrder = 0
          OnClick = Kigb_ConfigScreen
        end
        object rb44: TRadioButton
          Left = 85
          Top = 31
          Width = 80
          Height = 17
          Hint = 'Kigb_otherthancustom'
          Caption = 'GB Pocket'
          TabOrder = 1
          OnClick = Kigb_ConfigScreen
        end
        object rb45: TRadioButton
          Left = 165
          Top = 32
          Width = 80
          Height = 17
          Hint = 'Kigb_otherthancustom'
          Caption = 'No$GMB'
          TabOrder = 2
          OnClick = Kigb_ConfigScreen
        end
        object rb46: TRadioButton
          Left = 237
          Top = 33
          Width = 80
          Height = 17
          Hint = 'Kigb_otherthancustom'
          Caption = 'Bgb'
          TabOrder = 3
          OnClick = Kigb_ConfigScreen
        end
        object rb47: TRadioButton
          Left = 397
          Top = 34
          Width = 80
          Height = 17
          Hint = 'Kigb_custom'
          Caption = 'Costum'
          TabOrder = 4
          OnClick = Kigb_ConfigScreen
        end
        object grp81: TGroupBox
          Left = 6
          Top = 64
          Width = 475
          Height = 81
          Caption = 'Costumize'
          TabOrder = 5
          Visible = False
          object sLabel94: TsLabel
            Left = 270
            Top = 17
            Width = 39
            Height = 13
            Caption = 'Color 2'
          end
          object sLabel95: TsLabel
            Left = 15
            Top = 15
            Width = 39
            Height = 13
            Caption = 'Color 0'
          end
          object sLabel96: TsLabel
            Left = 137
            Top = 15
            Width = 39
            Height = 13
            Caption = 'Color 1'
          end
          object sLabel97: TsLabel
            Left = 392
            Top = 17
            Width = 39
            Height = 13
            Caption = 'Color 3'
          end
          object pnl1: TPanel
            Left = 20
            Top = 30
            Width = 30
            Height = 30
            Hint = 'Kigb_color'
            BorderWidth = 2
            Color = clLime
            TabOrder = 0
            OnClick = Kigb_ConfigScreen
          end
          object pnl2: TPanel
            Tag = 1
            Left = 140
            Top = 30
            Width = 30
            Height = 30
            Hint = 'Kigb_color'
            BorderWidth = 2
            Color = clLime
            TabOrder = 1
            OnClick = Kigb_ConfigScreen
          end
          object pnl3: TPanel
            Tag = 2
            Left = 273
            Top = 32
            Width = 30
            Height = 30
            Hint = 'Kigb_color'
            BorderWidth = 2
            Color = clLime
            TabOrder = 2
            OnClick = Kigb_ConfigScreen
          end
          object pnl4: TPanel
            Tag = 3
            Left = 396
            Top = 32
            Width = 30
            Height = 30
            Hint = 'Kigb_color'
            BorderWidth = 2
            Color = clLime
            TabOrder = 3
            OnClick = Kigb_ConfigScreen
          end
        end
        object JvOfficeColorPanel1: TJvOfficeColorPanel
          Left = 152
          Top = 152
          Width = 152
          Height = 162
          Hint = 'Kigb_setcolor'
          SelectedColor = clDefault
          HotTrackFont.Charset = DEFAULT_CHARSET
          HotTrackFont.Color = clWindowText
          HotTrackFont.Height = -11
          HotTrackFont.Name = 'MS Sans Serif'
          HotTrackFont.Style = []
          TabOrder = 6
          Visible = False
          Properties.NoneColorCaption = 'No Color'
          Properties.DefaultColorCaption = 'Automatic'
          Properties.CustomColorCaption = 'Other Colors...'
          Properties.NoneColorHint = 'No Color'
          Properties.DefaultColorHint = 'Automatic'
          Properties.CustomColorHint = 'Other Colors...'
          Properties.NoneColorFont.Charset = DEFAULT_CHARSET
          Properties.NoneColorFont.Color = clWindowText
          Properties.NoneColorFont.Height = -11
          Properties.NoneColorFont.Name = 'MS Sans Serif'
          Properties.NoneColorFont.Style = []
          Properties.DefaultColorFont.Charset = DEFAULT_CHARSET
          Properties.DefaultColorFont.Color = clWindowText
          Properties.DefaultColorFont.Height = -11
          Properties.DefaultColorFont.Name = 'MS Sans Serif'
          Properties.DefaultColorFont.Style = []
          Properties.CustomColorFont.Charset = DEFAULT_CHARSET
          Properties.CustomColorFont.Color = clWindowText
          Properties.CustomColorFont.Height = -11
          Properties.CustomColorFont.Name = 'MS Sans Serif'
          Properties.CustomColorFont.Style = []
          OnColorChange = Kigb_ConfigScreen
        end
      end
      object grp82: TGroupBox
        Left = 340
        Top = 36
        Width = 189
        Height = 187
        Caption = 'Filtres'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object rb48: TRadioButton
          Left = 5
          Top = 30
          Width = 113
          Height = 17
          Caption = 'None'
          TabOrder = 0
        end
        object rb49: TRadioButton
          Left = 5
          Top = 55
          Width = 113
          Height = 17
          Caption = 'Super 2xSai'
          TabOrder = 1
        end
        object rb50: TRadioButton
          Left = 5
          Top = 80
          Width = 113
          Height = 17
          Caption = 'Super Eagle'
          TabOrder = 2
        end
        object rb51: TRadioButton
          Left = 5
          Top = 105
          Width = 113
          Height = 17
          Caption = 'Scanlines 100%'
          TabOrder = 3
        end
        object rb52: TRadioButton
          Left = 5
          Top = 130
          Width = 113
          Height = 17
          Caption = 'Scanlines 50%'
          TabOrder = 4
        end
        object rb53: TRadioButton
          Left = 5
          Top = 155
          Width = 113
          Height = 17
          Caption = 'Bilinear'
          TabOrder = 5
        end
      end
    end
    object Pem_kigb_others: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 27
      SkinData.SkinSection = 'PANEL'
      object grp76: TGroupBox
        Left = 20
        Top = 30
        Width = 474
        Height = 140
        Caption = 'External Device'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object rb36: TRadioButton
          Left = 13
          Top = 30
          Width = 113
          Height = 17
          Hint = 'Kigb_GBD_None'
          Caption = 'None'
          TabOrder = 0
          OnClick = Kigb_ConfigOthers
        end
        object rb37: TRadioButton
          Left = 13
          Top = 60
          Width = 113
          Height = 17
          Hint = 'Kigb_GBD_BGPrinter'
          Caption = 'BG Printer'
          TabOrder = 1
          OnClick = Kigb_ConfigOthers
        end
        object rb38: TRadioButton
          Left = 13
          Top = 90
          Width = 113
          Height = 17
          Hint = 'Kigb_GBD_BarcodeBoy'
          Caption = 'Barcode Boy'
          TabOrder = 2
          OnClick = Kigb_ConfigOthers
        end
        object grp77: TGroupBox
          Left = 164
          Top = 20
          Width = 298
          Height = 110
          Caption = 'Barcode Options'
          TabOrder = 3
          object sCheckBox114: TsCheckBox
            Left = 130
            Top = 12
            Width = 165
            Height = 20
            Caption = 'Random Codes Genarator'
            TabOrder = 0
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
          object sEdit96: TsEdit
            Left = 85
            Top = 33
            Width = 207
            Height = 21
            TabOrder = 1
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Current Code'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sEdit97: TsEdit
            Left = 85
            Top = 61
            Width = 207
            Height = 21
            TabOrder = 2
            SkinData.SkinSection = 'EDIT'
            BoundLabel.Active = True
            BoundLabel.Caption = 'Description'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
          end
          object sBitBtn94: TsBitBtn
            Left = 239
            Top = 84
            Width = 25
            Height = 21
            TabOrder = 3
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 7
            Images = InBitBtn_Imagelist
          end
          object sBitBtn95: TsBitBtn
            Left = 193
            Top = 84
            Width = 25
            Height = 21
            TabOrder = 4
            SkinData.SkinSection = 'BUTTON'
            ImageIndex = 15
            Images = InBitBtn_Imagelist
          end
        end
      end
    end
    object Pem_kigb_sound: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 26
      SkinData.SkinSection = 'PANEL'
      object sLabel60: TsLabel
        Left = 8
        Top = 392
        Width = 123
        Height = 13
        Caption = 'This Key already set...'
        ParentFont = False
        Visible = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        UseSkinColor = False
      end
      object grp83: TGroupBox
        Left = 20
        Top = 30
        Width = 430
        Height = 167
        Caption = 'Sound'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object rb54: TRadioButton
          Left = 340
          Top = 10
          Width = 40
          Height = 17
          Caption = 'On'
          TabOrder = 0
        end
        object rb55: TRadioButton
          Left = 385
          Top = 10
          Width = 40
          Height = 17
          Caption = 'Off'
          TabOrder = 1
        end
        object grp84: TGroupBox
          Left = 5
          Top = 28
          Width = 420
          Height = 133
          Caption = 'Options'
          TabOrder = 2
          object grp85: TGroupBox
            Left = 230
            Top = 10
            Width = 185
            Height = 43
            Caption = 'Volume'
            TabOrder = 0
            object sLabel98: TsLabel
              Left = 5
              Top = 27
              Width = 29
              Height = 13
              Caption = 'Mute'
            end
            object sLabel99: TsLabel
              Left = 156
              Top = 27
              Width = 24
              Height = 13
              Caption = 'Max'
            end
            object sbar_kigb_soundvolume: TsScrollBar
              Left = 5
              Top = 13
              Width = 175
              Height = 13
              Max = 255
              PageSize = 0
              TabOrder = 0
              SkinManager = SkinM
            end
          end
          object grp86: TGroupBox
            Left = 230
            Top = 53
            Width = 185
            Height = 43
            Caption = 'Pan'
            TabOrder = 1
            object sLabel100: TsLabel
              Left = 5
              Top = 27
              Width = 22
              Height = 13
              Caption = 'Left'
            end
            object sLabel101: TsLabel
              Left = 150
              Top = 27
              Width = 30
              Height = 13
              Caption = 'Right'
            end
            object sbar_kigb_soundpan: TsScrollBar
              Left = 5
              Top = 13
              Width = 175
              Height = 13
              Max = 255
              PageSize = 0
              TabOrder = 0
              SkinManager = SkinM
            end
          end
          object sComboBox67: TsComboBox
            Left = 145
            Top = 15
            Width = 80
            Height = 21
            Alignment = taLeftJustify
            BoundLabel.Active = True
            BoundLabel.Caption = 'Frequency'
            BoundLabel.Indent = 0
            BoundLabel.Font.Charset = DEFAULT_CHARSET
            BoundLabel.Font.Color = clWindowText
            BoundLabel.Font.Height = -11
            BoundLabel.Font.Name = 'Tahoma'
            BoundLabel.Font.Style = [fsBold]
            BoundLabel.Layout = sclLeft
            BoundLabel.MaxWidth = 0
            BoundLabel.UseSkinColor = True
            SkinData.SkinSection = 'COMBOBOX'
            ItemHeight = 15
            ItemIndex = 2
            TabOrder = 2
            Text = '44100 Hz'
            Items.Strings = (
              '11025 Hz'
              '22050 Hz'
              '44100 Hz')
          end
          object grp87: TGroupBox
            Left = 5
            Top = 37
            Width = 219
            Height = 90
            Caption = 'Channels'
            TabOrder = 3
            object sCheckBox121: TsCheckBox
              Left = 5
              Top = 20
              Width = 75
              Height = 20
              Caption = 'Channel 0'
              TabOrder = 0
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sCheckBox122: TsCheckBox
              Left = 5
              Top = 40
              Width = 75
              Height = 20
              Caption = 'Channel 1'
              TabOrder = 1
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sCheckBox123: TsCheckBox
              Left = 5
              Top = 60
              Width = 75
              Height = 20
              Caption = 'Channel 2'
              TabOrder = 2
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sCheckBox124: TsCheckBox
              Left = 125
              Top = 20
              Width = 75
              Height = 20
              Caption = 'Channel 4'
              TabOrder = 3
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
            object sCheckBox125: TsCheckBox
              Left = 125
              Top = 40
              Width = 74
              Height = 20
              Caption = 'Digital On'
              TabOrder = 4
              SkinData.SkinSection = 'CHECKBOX'
              ImgChecked = 0
              ImgUnchecked = 0
            end
          end
          object sCheckBox126: TsCheckBox
            Left = 230
            Top = 103
            Width = 58
            Height = 20
            Caption = 'Stereo'
            TabOrder = 4
            SkinData.SkinSection = 'CHECKBOX'
            ImgChecked = 0
            ImgUnchecked = 0
          end
        end
      end
      object grp88: TGroupBox
        Left = 140
        Top = 197
        Width = 195
        Height = 280
        Caption = 'Keyboard Keys'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object sComboBox68: TsComboBox
          Left = 110
          Top = 18
          Width = 81
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Player'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 0
          Text = 'Player 1'
          Items.Strings = (
            'Player 1'
            'Player 2'
            'Player 3'
            'Player 4')
        end
        object grp89: TGroupBox
          Left = 5
          Top = 78
          Width = 185
          Height = 169
          Caption = 'Keys'
          TabOrder = 1
          object sPanel45: TsPanel
            Left = 5
            Top = 35
            Width = 85
            Height = 21
            TabOrder = 0
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel46: TsPanel
            Left = 5
            Top = 70
            Width = 85
            Height = 21
            TabOrder = 1
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel47: TsPanel
            Left = 5
            Top = 105
            Width = 85
            Height = 21
            TabOrder = 2
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel48: TsPanel
            Left = 5
            Top = 140
            Width = 85
            Height = 21
            TabOrder = 3
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel49: TsPanel
            Left = 95
            Top = 35
            Width = 85
            Height = 21
            TabOrder = 4
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel50: TsPanel
            Left = 95
            Top = 70
            Width = 85
            Height = 21
            TabOrder = 5
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel51: TsPanel
            Left = 95
            Top = 105
            Width = 85
            Height = 21
            TabOrder = 6
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel52: TsPanel
            Left = 95
            Top = 140
            Width = 85
            Height = 21
            TabOrder = 7
            OnClick = CheckUpKey
            SkinData.SkinSection = 'PANEL'
          end
        end
        object sBitBtn96: TsBitBtn
          Left = 5
          Top = 251
          Width = 185
          Height = 21
          Caption = 'Set To Default'
          TabOrder = 2
          SkinData.SkinSection = 'BUTTON'
        end
      end
      object grp90: TGroupBox
        Left = 356
        Top = 197
        Width = 195
        Height = 280
        Caption = 'Joystick/Joypad Keys'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        object sComboBox69: TsComboBox
          Left = 109
          Top = 18
          Width = 81
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Player'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 0
          Text = 'Player 1'
          Items.Strings = (
            'Player 1'
            'Player 2'
            'Player 3'
            'Player 4')
        end
        object grp91: TGroupBox
          Left = 5
          Top = 78
          Width = 185
          Height = 169
          Caption = 'Keys'
          TabOrder = 1
          object sPanel53: TsPanel
            Left = 5
            Top = 35
            Width = 85
            Height = 21
            TabOrder = 0
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel54: TsPanel
            Left = 95
            Top = 35
            Width = 85
            Height = 21
            TabOrder = 1
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel55: TsPanel
            Left = 95
            Top = 70
            Width = 85
            Height = 21
            TabOrder = 2
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel56: TsPanel
            Left = 5
            Top = 70
            Width = 85
            Height = 21
            TabOrder = 3
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel57: TsPanel
            Left = 5
            Top = 105
            Width = 85
            Height = 21
            TabOrder = 4
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel58: TsPanel
            Left = 95
            Top = 105
            Width = 85
            Height = 21
            TabOrder = 5
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel59: TsPanel
            Left = 95
            Top = 140
            Width = 85
            Height = 21
            TabOrder = 6
            SkinData.SkinSection = 'PANEL'
          end
          object sPanel60: TsPanel
            Left = 5
            Top = 140
            Width = 85
            Height = 21
            TabOrder = 7
            SkinData.SkinSection = 'PANEL'
          end
        end
        object sBitBtn97: TsBitBtn
          Left = 5
          Top = 251
          Width = 185
          Height = 21
          Caption = 'Set To Default'
          TabOrder = 2
          SkinData.SkinSection = 'BUTTON'
        end
        object sComboBox70: TsComboBox
          Left = 130
          Top = 50
          Width = 60
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Joystick/Joypad'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 3
          Text = 'None'
          Items.Strings = (
            'None')
        end
      end
      object grp92: TGroupBox
        Left = 140
        Top = 477
        Width = 195
        Height = 175
        Caption = 'Keyboard Motion Sensor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        object sPanel61: TsPanel
          Left = 5
          Top = 45
          Width = 121
          Height = 21
          TabOrder = 0
          OnClick = CheckUpKey
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel62: TsPanel
          Left = 5
          Top = 80
          Width = 121
          Height = 21
          TabOrder = 1
          OnClick = CheckUpKey
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel63: TsPanel
          Left = 5
          Top = 115
          Width = 121
          Height = 21
          TabOrder = 2
          OnClick = CheckUpKey
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel64: TsPanel
          Left = 5
          Top = 150
          Width = 121
          Height = 21
          TabOrder = 3
          OnClick = CheckUpKey
          SkinData.SkinSection = 'PANEL'
        end
      end
      object grp93: TGroupBox
        Left = 356
        Top = 477
        Width = 195
        Height = 175
        Caption = 'Joystick/Joypad Motion Sensor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object sComboBox71: TsComboBox
          Left = 130
          Top = 15
          Width = 60
          Height = 21
          Alignment = taLeftJustify
          BoundLabel.Active = True
          BoundLabel.Caption = 'Joystick/Joypad'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
          SkinData.SkinSection = 'COMBOBOX'
          ItemHeight = 15
          ItemIndex = 0
          TabOrder = 0
          Text = 'None'
          Items.Strings = (
            'None')
        end
        object sPanel65: TsPanel
          Left = 5
          Top = 45
          Width = 121
          Height = 21
          TabOrder = 1
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel66: TsPanel
          Left = 5
          Top = 80
          Width = 121
          Height = 21
          TabOrder = 2
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel67: TsPanel
          Left = 5
          Top = 115
          Width = 121
          Height = 21
          TabOrder = 3
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel68: TsPanel
          Left = 5
          Top = 150
          Width = 121
          Height = 21
          TabOrder = 4
          SkinData.SkinSection = 'PANEL'
        end
      end
      object grp94: TGroupBox
        Left = 20
        Top = 197
        Width = 117
        Height = 180
        Caption = 'System Keys'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object sPanel42: TsPanel
          Left = 24
          Top = 40
          Width = 85
          Height = 20
          TabOrder = 0
          OnClick = CheckUpKey
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel43: TsPanel
          Left = 24
          Top = 88
          Width = 85
          Height = 20
          TabOrder = 1
          OnClick = CheckUpKey
          SkinData.SkinSection = 'PANEL'
        end
        object sPanel44: TsPanel
          Left = 24
          Top = 136
          Width = 85
          Height = 20
          TabOrder = 2
          OnClick = CheckUpKey
          SkinData.SkinSection = 'PANEL'
        end
      end
    end
    object Pce_themes: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      Align = alCustom
      TabOrder = 0
      SkinData.SkinSection = 'PANEL'
      object sLabelFX3: TsLabelFX
        Left = 99
        Top = 285
        Width = 64
        Height = 16
        Caption = 'sLabelFX3'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpFixed
        Font.Style = [fsBold]
        Kind.KindType = ktCustom
        Kind.Color = clSkyBlue
        Shadow.BlurCount = 3
        Shadow.Distance = 3
      end
      object sLabelFX11: TsLabelFX
        Left = 600
        Top = 308
        Width = 64
        Height = 16
        Caption = 'sLabelFX3'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpFixed
        Font.Style = [fsBold]
        Kind.KindType = ktCustom
        Kind.Color = clSkyBlue
        Shadow.BlurCount = 3
        Shadow.Distance = 3
      end
      object sLabelFX12: TsLabelFX
        Left = 600
        Top = 352
        Width = 64
        Height = 16
        Caption = 'sLabelFX3'
        ParentFont = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Pitch = fpFixed
        Font.Style = [fsBold]
        Kind.KindType = ktCustom
        Kind.Color = clSkyBlue
        Shadow.BlurCount = 3
        Shadow.Distance = 3
      end
      object sBB_apply_ce_themes: TsBitBtn
        Left = 138
        Top = 150
        Width = 75
        Height = 25
        Hint = 'Apply_themes'
        Caption = 'Apply'
        Enabled = False
        TabOrder = 0
        OnClick = confEditor_Themes_Set
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 23
        Images = InBitBtn_Imagelist
      end
      object sLB_ce_themes: TsListBox
        Left = 23
        Top = 77
        Width = 191
        Height = 69
        Hint = 'Select_Themes'
        BevelInner = bvNone
        BevelOuter = bvNone
        Ctl3D = False
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 1
        OnClick = confEditor_Themes_Set
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'EDIT'
      end
      object sPanel1: TsPanel
        Left = 229
        Top = 79
        Width = 346
        Height = 247
        BevelInner = bvLowered
        BevelOuter = bvLowered
        BorderWidth = 2
        BorderStyle = bsSingle
        TabOrder = 2
        SkinData.SkinSection = 'PANEL'
        object img_ce_theme: TImage
          Left = 4
          Top = 4
          Width = 334
          Height = 235
          Align = alClient
          Stretch = True
        end
      end
    end
    object Pem_zinc_database: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      TabOrder = 28
      SkinData.SkinSection = 'PANEL'
      object nxtgrd_zinc: TNextGrid
        Left = 24
        Top = 88
        Width = 545
        Height = 401
        Options = [goHeader, goSelectFullRow]
        TabOrder = 0
        TabStop = True
      end
    end
    object Pem_hatari_paths: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      TabOrder = 29
      SkinData.SkinSection = 'PANEL'
      object sEdit14: TsEdit
        Left = 20
        Top = 50
        Width = 430
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Hatari Execution File'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn105: TsBitBtn
        Left = 454
        Top = 50
        Width = 25
        Height = 21
        Hint = 'Hatari_Exe'
        TabOrder = 1
        OnClick = Hatari_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object sEdit18: TsEdit
        Left = 20
        Top = 90
        Width = 430
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        SkinData.SkinSection = 'EDIT'
        BoundLabel.Active = True
        BoundLabel.Caption = 'Path To Hatari Tos File'
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'Tahoma'
        BoundLabel.Font.Style = [fsBold]
        BoundLabel.Layout = sclTopLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
      end
      object sBitBtn106: TsBitBtn
        Left = 454
        Top = 90
        Width = 25
        Height = 21
        Hint = 'Hatari_Tos'
        Enabled = False
        TabOrder = 3
        OnClick = Hatari_ConfigPaths
        SkinData.SkinSection = 'BUTTON'
        ImageIndex = 15
        Images = InBitBtn_Imagelist
      end
      object grp18: TGroupBox
        Left = 24
        Top = 144
        Width = 489
        Height = 369
        Caption = 'Media'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object sEdit19: TsEdit
          Left = 78
          Top = 32
          Width = 360
          Height = 21
          TabOrder = 0
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Snapshots'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit20: TsEdit
          Left = 78
          Top = 56
          Width = 360
          Height = 21
          TabOrder = 1
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Music'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit21: TsEdit
          Left = 78
          Top = 136
          Width = 360
          Height = 21
          TabOrder = 2
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Adverts'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit22: TsEdit
          Left = 78
          Top = 88
          Width = 360
          Height = 21
          TabOrder = 3
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Boxscans'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit23: TsEdit
          Left = 78
          Top = 168
          Width = 360
          Height = 21
          TabOrder = 4
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Cheats'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit24: TsEdit
          Left = 78
          Top = 112
          Width = 360
          Height = 21
          TabOrder = 5
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Discscans'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit25: TsEdit
          Left = 78
          Top = 192
          Width = 360
          Height = 21
          TabOrder = 6
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Hints'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit26: TsEdit
          Left = 78
          Top = 216
          Width = 360
          Height = 21
          TabOrder = 7
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Instructions'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit27: TsEdit
          Left = 78
          Top = 240
          Width = 360
          Height = 21
          TabOrder = 8
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Maps'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit28: TsEdit
          Left = 78
          Top = 336
          Width = 360
          Height = 21
          TabOrder = 9
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Other'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit29: TsEdit
          Left = 78
          Top = 312
          Width = 360
          Height = 21
          TabOrder = 10
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Reviews'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sEdit30: TsEdit
          Left = 78
          Top = 264
          Width = 360
          Height = 21
          TabOrder = 11
          SkinData.SkinSection = 'EDIT'
          BoundLabel.Active = True
          BoundLabel.Caption = 'Solutions'
          BoundLabel.Indent = 0
          BoundLabel.Font.Charset = DEFAULT_CHARSET
          BoundLabel.Font.Color = clWindowText
          BoundLabel.Font.Height = -11
          BoundLabel.Font.Name = 'Tahoma'
          BoundLabel.Font.Style = [fsBold]
          BoundLabel.Layout = sclLeft
          BoundLabel.MaxWidth = 0
          BoundLabel.UseSkinColor = True
        end
        object sBitBtn51: TsBitBtn
          Left = 445
          Top = 32
          Width = 25
          Height = 21
          Hint = 'Hatari_screenshots'
          TabOrder = 12
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn52: TsBitBtn
          Left = 445
          Top = 56
          Width = 25
          Height = 21
          Hint = 'Hatari_music'
          TabOrder = 13
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn53: TsBitBtn
          Left = 445
          Top = 88
          Width = 25
          Height = 21
          Hint = 'Hatari_boxscans'
          TabOrder = 14
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn54: TsBitBtn
          Left = 445
          Top = 112
          Width = 25
          Height = 21
          Hint = 'Hatari_diskscans'
          TabOrder = 15
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn55: TsBitBtn
          Left = 445
          Top = 136
          Width = 25
          Height = 21
          Hint = 'Hatari_adverts'
          TabOrder = 16
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn56: TsBitBtn
          Left = 445
          Top = 168
          Width = 25
          Height = 21
          Hint = 'Hatari_cheats'
          TabOrder = 17
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn57: TsBitBtn
          Left = 445
          Top = 192
          Width = 25
          Height = 21
          Hint = 'Hatari_hints'
          TabOrder = 18
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn58: TsBitBtn
          Left = 445
          Top = 216
          Width = 25
          Height = 21
          Hint = 'Hatari_instructions'
          TabOrder = 19
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn59: TsBitBtn
          Left = 445
          Top = 240
          Width = 25
          Height = 21
          Hint = 'Hatari_maps'
          TabOrder = 20
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn74: TsBitBtn
          Left = 445
          Top = 264
          Width = 25
          Height = 21
          Hint = 'Hatari_solutions'
          TabOrder = 21
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn107: TsBitBtn
          Left = 445
          Top = 312
          Width = 25
          Height = 21
          Hint = 'Hatari_reviews'
          TabOrder = 22
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
        object sBitBtn108: TsBitBtn
          Left = 445
          Top = 336
          Width = 25
          Height = 21
          Hint = 'Hatari_other'
          TabOrder = 23
          OnClick = Hatari_ConfigPaths
          SkinData.SkinSection = 'BUTTON'
          ImageIndex = 15
          Images = InBitBtn_Imagelist
        end
      end
    end
    object Pem_hatari_database: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      TabOrder = 30
      SkinData.SkinSection = 'PANEL'
      object sGauge_HatariData: TsGauge
        Left = 20
        Top = 100
        Width = 540
        Height = 17
        SkinData.SkinSection = 'GAUGE'
        ForeColor = clBlack
        Progress = 0
        Suffix = '%'
      end
      object nxtgrd_hatari: TNextGrid
        Left = 20
        Top = 132
        Width = 540
        Height = 407
        Caption = 'Please select one of the above databases...'
        Options = [goGrid, goHeader, goSelectFullRow]
        TabOrder = 0
        TabStop = True
      end
      object sButton10: TsButton
        Left = 20
        Top = 24
        Width = 100
        Height = 25
        Hint = 'SingleGames'
        Caption = 'Single Games'
        TabOrder = 1
        OnClick = Hatari_ConfigDatabase
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton11: TsButton
        Left = 130
        Top = 24
        Width = 100
        Height = 25
        Hint = 'BigCollections'
        Caption = 'Big Collections'
        TabOrder = 2
        OnClick = Hatari_ConfigDatabase
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton12: TsButton
        Left = 239
        Top = 24
        Width = 100
        Height = 25
        Hint = 'SmallCollections'
        Caption = 'Small Collections'
        TabOrder = 3
        OnClick = Hatari_ConfigDatabase
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton13: TsButton
        Left = 350
        Top = 24
        Width = 100
        Height = 25
        Hint = 'Demos'
        Caption = 'Demos'
        TabOrder = 4
        OnClick = Hatari_ConfigDatabase
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton14: TsButton
        Left = 459
        Top = 24
        Width = 100
        Height = 25
        Hint = 'Applications'
        Caption = 'Applications'
        TabOrder = 5
        OnClick = Hatari_ConfigDatabase
        SkinData.SkinSection = 'BUTTON'
      end
      object sComboBox40: TsComboBox
        Left = 64
        Top = 64
        Width = 169
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Enabled = False
        ItemHeight = 15
        ItemIndex = 0
        TabOrder = 6
        Text = 'Choose Team...'
        Items.Strings = (
          'Choose Team...'
          'Adrenalyn'
          'Automation'
          'Bad Brew Crew'
          'Blue Software'
          'D-Bug'
          'Delicious'
          'Enigma'
          'Flame Of Filand'
          'Fusion'
          'Medway Pirates'
          'Pompey Pirates'
          'Special FX'
          'Supergau'
          'Superior'
          'Vetronix'
          'Zuul')
      end
      object sComboBox41: TsComboBox
        Left = 328
        Top = 64
        Width = 169
        Height = 21
        Alignment = taLeftJustify
        BoundLabel.Indent = 0
        BoundLabel.Font.Charset = DEFAULT_CHARSET
        BoundLabel.Font.Color = clWindowText
        BoundLabel.Font.Height = -11
        BoundLabel.Font.Name = 'MS Sans Serif'
        BoundLabel.Font.Style = []
        BoundLabel.Layout = sclLeft
        BoundLabel.MaxWidth = 0
        BoundLabel.UseSkinColor = True
        SkinData.SkinSection = 'COMBOBOX'
        Enabled = False
        ItemHeight = 15
        ItemIndex = 0
        TabOrder = 7
        Text = 'Choose Team...'
        Items.Strings = (
          'Choose Team...'
          'Atari Force'
          'Awesome'
          'Blues Bros'
          'Compil'
          'Conceptors'
          'Construct'
          'Crazy Boy'
          'Cynix'
          'Delight'
          'F.O.F.T'
          'Games Compil'
          'Gravatics'
          'Guardian Soft Ogik'
          'Impact'
          'Infocom'
          'Klapauzius'
          'Lemmings'
          'Mad Vision'
          'New Order'
          'Nothing Personal'
          'Pulsion'
          'Pure Enegry'
          'Reanimators'
          'Revolution'
          'Section One'
          'Shaolin Masters'
          'Supremacy'
          'Syndicaty'
          'Timelords'
          'Tumult')
      end
    end
    object Pem_psx_database: TsPanel
      Left = 727
      Top = 1
      Width = 727
      Height = 661
      TabOrder = 31
      SkinData.SkinSection = 'PANEL'
      object nxtgrd_pSX: TNextGrid
        Left = 20
        Top = 132
        Width = 540
        Height = 407
        Caption = 'I have no data to show'
        Options = [goGrid, goHeader, goSelectFullRow]
        TabOrder = 0
        TabStop = True
      end
    end
    object Pem_kigb_database: TsPanel
      Left = 727
      Top = 0
      Width = 727
      Height = 661
      TabOrder = 32
      SkinData.SkinSection = 'PANEL'
      object nxtgrd_kigb: TNextGrid
        Left = 20
        Top = 132
        Width = 540
        Height = 407
        Caption = 'Select one of the above database...'
        Options = [goGrid, goHeader, goSelectFullRow]
        TabOrder = 0
        TabStop = True
      end
      object sButton15: TsButton
        Left = 20
        Top = 32
        Width = 125
        Height = 25
        Caption = 'Game Boy'
        TabOrder = 1
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton16: TsButton
        Left = 228
        Top = 32
        Width = 125
        Height = 25
        Caption = 'Game Boy Color'
        TabOrder = 2
        SkinData.SkinSection = 'BUTTON'
      end
      object sButton17: TsButton
        Left = 435
        Top = 32
        Width = 125
        Height = 25
        Caption = 'Super Game Boy'
        TabOrder = 3
        SkinData.SkinSection = 'BUTTON'
      end
    end
  end
  object Menu_Panel: TsPanel
    Left = 0
    Top = 0
    Width = 160
    Height = 660
    Align = alLeft
    BevelInner = bvLowered
    BevelOuter = bvLowered
    BevelWidth = 2
    BorderStyle = bsSingle
    TabOrder = 1
    SkinData.SkinSection = 'PANEL'
    object Menu_Image: TLMDNImage
      Left = 0
      Top = 0
      Width = 154
      Height = 144
      Bevel.StyleOuter = bvLowered
      Bevel.WidthInner = 2
      Bevel.WidthOuter = 2
      Bevel.BorderColor = clSkyBlue
      Bevel.BorderWidth = 2
      Bevel.BorderInnerWidth = 2
      Bevel.EdgeStyle = etRaised
      Bevel.Mode = bmCustom
      Style = sbStretch
    end
    object sBitBtn6: TsBitBtn
      Left = 2
      Top = 150
      Width = 150
      Height = 35
      Hint = 'Button_1'
      Caption = 'confEditor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
      OnMouseEnter = MouseInButtonMenu
      OnMouseLeave = MouseOutButtonMenu
    end
    object sBitBtn7: TsBitBtn
      Left = 2
      Top = 185
      Width = 150
      Height = 35
      Hint = 'Button_2'
      Caption = 'ExtraFe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
      OnMouseEnter = MouseInButtonMenu
      OnMouseLeave = MouseOutButtonMenu
    end
    object sBitBtn8: TsBitBtn
      Left = 2
      Top = 220
      Width = 150
      Height = 35
      Hint = 'Button_3'
      Caption = 'Emulators'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
      OnMouseEnter = MouseInButtonMenu
      OnMouseLeave = MouseOutButtonMenu
    end
    object sBitBtn9: TsBitBtn
      Left = 2
      Top = 255
      Width = 150
      Height = 35
      Hint = 'Button_4'
      Caption = 'Weather'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
      OnMouseEnter = MouseInButtonMenu
      OnMouseLeave = MouseOutButtonMenu
    end
    object sBitBtn10: TsBitBtn
      Left = 2
      Top = 291
      Width = 150
      Height = 35
      Hint = 'Button_5'
      Caption = 'Time/Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
      OnMouseEnter = MouseInButtonMenu
      OnMouseLeave = MouseOutButtonMenu
    end
    object sBitBtn11: TsBitBtn
      Left = 2
      Top = 325
      Width = 150
      Height = 35
      Hint = 'Button_6'
      Caption = 'Button6'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
      OnMouseEnter = MouseInButtonMenu
      OnMouseLeave = MouseOutButtonMenu
    end
    object sBitBtn12: TsBitBtn
      Left = 2
      Top = 360
      Width = 150
      Height = 35
      Hint = 'Button_7'
      Caption = 'Button7'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
    end
    object sBitBtn13: TsBitBtn
      Left = 2
      Top = 395
      Width = 150
      Height = 35
      Hint = 'Button_8'
      Caption = 'Button8'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
    end
    object sBitBtn14: TsBitBtn
      Left = 2
      Top = 430
      Width = 150
      Height = 35
      Hint = 'Button_9'
      Caption = 'Button9'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
    end
    object sBitBtn15: TsBitBtn
      Left = 2
      Top = 465
      Width = 150
      Height = 35
      Hint = 'Button_10'
      Caption = 'Button10'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = HitButtonMenu
      Alignment = taLeftJustify
      SkinData.SkinSection = 'BUTTON'
    end
    object stat1: TStatusBar
      Left = 4
      Top = 632
      Width = 148
      Height = 20
      Panels = <
        item
          Alignment = taCenter
          Width = 50
        end>
    end
    object sBitBtn16: TsBitBtn
      Left = 2
      Top = 596
      Width = 150
      Height = 35
      Hint = 'Button_back'
      Caption = ' Back'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      Visible = False
      OnClick = HitButtonMenu
      Margin = 5
      Alignment = taRightJustify
      SkinData.SkinSection = 'BUTTON'
      ImageIndex = 0
    end
  end
  object Find_Files: TOpenDialog
    Ctl3D = False
    OnClose = Find_FilesClose
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    OnCanClose = Find_FilesCanClose
    Left = 10
    Top = 70
  end
  object SDI1: TSoundDeviceInfo
    Host = '.'
    Active = True
    AllProperties.Strings = (
      
        #10'instance of Win32_SoundDevice'#10'{'#10#9'Caption = "Realtek High Defini' +
        'tion Audio";'#10#9'ConfigManagerErrorCode = 0;'#10#9'ConfigManagerUserConf' +
        'ig = FALSE;'#10#9'CreationClassName = "Win32_SoundDevice";'#10#9'Descripti' +
        'on = "Realtek High Definition Audio";'#10#9'DeviceID = "HDAUDIO\\FUNC' +
        '_01&VEN_10EC&DEV_0880&SUBSYS_08800000&REV_0905\\4&3356750D&0&000' +
        '1";'#10#9'Manufacturer = "Realtek";'#10#9'Name = "Realtek High Definition ' +
        'Audio";'#10#9'PNPDeviceID = "HDAUDIO\\FUNC_01&VEN_10EC&DEV_0880&SUBSY' +
        'S_08800000&REV_0905\\4&3356750D&0&0001";'#10#9'PowerManagementSupport' +
        'ed = FALSE;'#10#9'ProductName = "Realtek High Definition Audio";'#10#9'Sta' +
        'tus = "OK";'#10#9'StatusInfo = 3;'#10#9'SystemCreationClassName = "Win32_C' +
        'omputerSystem";'#10#9'SystemName = "WINDOWS-C72C1D2";'#10'};'#10
      
        #10'instance of Win32_SoundDevice'#10'{'#10#9'Caption = "HD Webcam C270";'#10#9'C' +
        'onfigManagerErrorCode = 0;'#10#9'ConfigManagerUserConfig = FALSE;'#10#9'Cr' +
        'eationClassName = "Win32_SoundDevice";'#10#9'Description = "HD Webcam' +
        ' C270";'#10#9'DeviceID = "USB\\VID_046D&PID_0825&MI_02\\6&ED68547&0&0' +
        '002";'#10#9'Manufacturer = "Logitech";'#10#9'Name = "HD Webcam C270";'#10#9'PNP' +
        'DeviceID = "USB\\VID_046D&PID_0825&MI_02\\6&ED68547&0&0002";'#10#9'Po' +
        'werManagementSupported = FALSE;'#10#9'ProductName = "HD Webcam C270";' +
        #10#9'Status = "OK";'#10#9'StatusInfo = 3;'#10#9'SystemCreationClassName = "Wi' +
        'n32_ComputerSystem";'#10#9'SystemName = "WINDOWS-C72C1D2";'#10'};'#10)
    Left = 10
    Top = 40
  end
  object DMI1: TDesktopMonitorInfo
    Host = '.'
    Active = True
    AllProperties.Strings = (
      
        #10'instance of Win32_DesktopMonitor'#10'{'#10#9'Availability = 3;'#10#9'Caption ' +
        '= "Plug and Play Monitor";'#10#9'ConfigManagerErrorCode = 0;'#10#9'ConfigM' +
        'anagerUserConfig = FALSE;'#10#9'CreationClassName = "Win32_DesktopMon' +
        'itor";'#10#9'Description = "Plug and Play Monitor";'#10#9'DeviceID = "Desk' +
        'topMonitor1";'#10#9'MonitorManufacturer = "(Standard monitor types)";' +
        #10#9'MonitorType = "Plug and Play Monitor";'#10#9'Name = "Plug and Play ' +
        'Monitor";'#10#9'PixelsPerXLogicalInch = 96;'#10#9'PixelsPerYLogicalInch = ' +
        '96;'#10#9'PNPDeviceID = "DISPLAY\\OEM0000\\5&24E36660&0&11335578&04&0' +
        '0";'#10#9'ScreenHeight = 768;'#10#9'ScreenWidth = 1280;'#10#9'Status = "OK";'#10#9'S' +
        'ystemCreationClassName = "Win32_ComputerSystem";'#10#9'SystemName = "' +
        'WINDOWS-C72C1D2";'#10'};'#10)
    Left = 40
    Top = 40
  end
  object InBitBtn_Imagelist: TsAlphaImageList
    DrawingStyle = dsTransparent
    Items = <
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000DC0049DC004900000000000000000000
          0000000000000000000000000000000000000000000000000000DC0049DC0049
          EF1A5FF82065DC00490000000000000000000000000000000000000000000000
          00000000DC0049DC0049EB1E60FF3A78FF3072F8276ADC004900000000000000
          0000000000000000000000000000000000000000DC0049F33370FF4D84FF447E
          FF3A78FF3072DC00499E9E9E9E9E9E9E9E9E9E9E9E9E9E9E0000000000000000
          00000000DC0049F8477EFF4D84FF4D84FF447EFF3A78DC004900DC4900DC4900
          B93D00B93D9E9E9E000000000000000000000000DC0049FD5C8CFF578AFF4D84
          FF447EFF447EDC004900B93D00DC4900DC4900B93D9E9E9E0000000000000000
          00000000DC0049FF6190FF6190FF578AFD6997FE4C83DC004900B93D00DC4900
          DC4900DC499E9E9E000000000000000000000000DC0049FF6A95FF6190FB87AB
          F2F2F2FD5C8EDC0049FFB84800B93D00B93DFFB8489E9E9E0000000000000000
          00000000DC0049FF749BFF6A95FF6190FD719CFE5589DC0049FFB848FFB848FF
          B848FFB8489E9E9E000000000000000000000000DC0049FD6E96FF6A95FF6A95
          FF6190FF578ADC0049FFE676FFE070FFD060FFB8489E9E9E0000000000000000
          00000000DC0049F86690FF749BFF6A95FF6190FF6190DC0049FFEB7BFFEF7FFF
          E070FFB8489E9E9E000000000000000000000000DC0049F35383FF7EA1FF749B
          FF6A95FF6190DC00499E9E9E9E9E9E9E9E9E9E9E9E9E9E9E0000000000000000
          00000000DC0049DC0049EB366FFF749BFF749BF85687DC004900000000000000
          0000000000000000000000000000000000000000000000000000DC0049DC0049
          EF3E75F3467BDC00490000000000000000000000000000000000000000000000
          00000000000000000000000000000000DC0049DC004900000000000000000000
          0000000000000000000000000000FFFF0000FCFF0000F07F0000C07F0000C003
          0000C0030000C0030000C0030000C0030000C0030000C0030000C0030000C003
          0000C07F0000F07F0000FCFF0000280000001000000020000000010020000000
          0000400000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000110000001B0000001B000000090000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000E652A3930DC0049FFDC0049AC652A394F000000170000
          0000000000000000000000000000000000000000000000000000000000000000
          0000652A391ADC0049DFDC0049FFEF1A5FFFF82065FFDC0049C0000000180000
          0000000000000000000000000000000000000000000000000000000000039900
          3371DC0049E2EB1E60FFFF3A78FFFF3072FFF8276AFFDC0049FF000000330000
          003300000033000000330000001100000000000000000000000000000015E00C
          51E2F33370FFFF4D84FFFF447EFFFF3A78FFFF3072FFDC0049FF9E9E9EFF9E9E
          9EFF9E9E9EFF9E9E9EFF9E9E9ECF0000000B000000000000000000000015E417
          58FFF8477EFFFF4D84FFFF4D84FFFF447EFFFF3A78FFDC0049FF00DC49FF00DC
          49FF00B93DFF00B93DFF9E9E9EFF00000011000000000000000000000015EB2E
          67FFFD5C8CFFFF578AFFFF4D84FFFF447EFFFF447EFFDC0049FF00B93DFF00DC
          49FF00DC49FF00B93DFF9E9E9EFF00000011000000000000000000000015EB2E
          67FFFF6190FFFF6190FFFF578AFFFD6997FFFE4C83FFDC0049FF00B93DFF00DC
          49FF00DC49FF00DC49FF9E9E9EFF00000011000000000000000000000015EB2E
          67FFFF6A95FFFF6190FFFB87ABFFF2F2F2FFFD5C8EFFDC0049FFFFB848FF00B9
          3DFF00B93DFFFFB848FF9E9E9EFF00000011000000000000000000000015F346
          77FFFF749BFFFF6A95FFFF6190FFFD719CFFFE5589FFDC0049FFFFB848FFFFB8
          48FFFFB848FFFFB848FF9E9E9EFF00000011000000000000000000000015F346
          77FFFD6E96FFFF6A95FFFF6A95FFFF6190FFFF578AFFDC0049FFFFE676FFFFE0
          70FFFFD060FFFFB848FF9E9E9EFF00000011000000000000000000000015F855
          81FFF86690FFFF749BFFFF6A95FFFF6190FFFF6190FFDC0049FFFFEB7BFFFFEF
          7FFFFFE070FFFFB848FF9E9E9EFF00000011000000000000000000000015FB5E
          87FFF35383FFFF7EA1FFFF749BFFFF6A95FFFF6190FFEA2A65FF9E9E9EFF9E9E
          9EFF9E9E9EFF9E9E9EFF9E9E9ECF0000000E00000000000000000000000BFB5E
          8790FA5D86FFEB366FFFFF749BFFFF749BFFF85687FFEA2A65FF000000270000
          0027000000270000002700000000000000000000000000000000000000000000
          0000FA5D8633FC638ACCF75380FFEF3E75FFF3467BFFEA2A65FF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000011FA5D8644F75380FFEA2A65FF652A3950000000000000
          00000000000000000000000000000000000000000000FC3F0000F03F0000E03F
          0000800300008001000080010000800100008001000080010000800100008001
          0000800100008001000080070000E07F0000F07F0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2000000C2C2
          C238B93812B91200B90000B90000B90000B90000B90000B90000B90000B90000
          B90000B90012B91238B938C2C2C2C2C2C212B91200B50000AE00D4FFE300AE00
          00AE0000AE0000AE0000AE0000AE004BD251D4FFE3D4FFE312B912C2C2C2C2C2
          C200B90000B9007CE285D4FFE300B50000B50000B50000B5004BD25100B5004B
          D251D4FFE3D4FFE300B900C2C2C2C2C2C24BD251D4FFE3D4FFE366DB6E2AC72D
          4BD25100B90000B900D4FFE366DB6E4BD251D4FFE3D4FFE300B900C2C2C2C2C2
          C200B9007CE28500B900D4FFE32AC72DD4FFE366DB6ED4FFE3D4FFE3D4FFE38D
          E897D4FFE3D4FFE300B900C2C2C2C2C2C200B9004BD251D4FFE3D4FFE3D4FFE3
          D4FFE300B90000B900D4FFE366DB6E4BD251D4FFE3D4FFE300B900C2C2C2C2C2
          C200B90009B90909B90966DB6ED4FFE366DB6E00B90000B9004BD25100B9004B
          D251D4FFE3D4FFE300B900C2C2C2C2C2C212B91244B94444B944D4FFE3D4FFE3
          D4FFE322B92222B92222B92222B9224BD251D4FFE3D4FFE312B912C2C2C2C2C2
          C244B94412B91200B90066DB6ED4FFE366DB6E00B90000B90000B90000B90000
          B90000B9000EB10E38B938C2C2C2000000C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C20000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF0000FFFF000080010000000000000000
          0000000000000000000000000000000000000000000000000000000000008001
          0000FFFF0000FFFF0000FFFF0000280000001000000020000000010020000000
          0000400000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000C2C2C20CC2C2
          C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2
          C21AC2C2C21AC2C2C21AC2C2C21AC2C2C20C00000000C2C2C23EC2C2C294C2C2
          C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2
          C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C23EC2C2C29938B938FF12B9
          12FF00B900FF00B900FF00B900FF00B900FF00B900FF00B900FF00B900FF00B9
          00FF00B900FF00B900FF12B912FF38B938FFC2C2C294C2C2C29412B912FF00B5
          00FF00AE00FFD4FFE3FF00AE00FF00AE00FF00AE00FF00AE00FF00AE00FF00AE
          00FF4BD251FFD4FFE3FFD4FFE3FF12B912FFC2C2C294C2C2C29400B900FF00B9
          00FF7CE285FFD4FFE3FF00B500FF00B500FF00B500FF00B500FF4BD251FF00B5
          00FF4BD251FFD4FFE3FFD4FFE3FF00B900FFC2C2C294C2C2C2944BD251FFD4FF
          E3FFD4FFE3FF66DB6EFF2AC72DFF4BD251FF00B900FF00B900FFD4FFE3FF66DB
          6EFF4BD251FFD4FFE3FFD4FFE3FF00B900FFC2C2C294C2C2C29400B900FF7CE2
          85FF00B900FFD4FFE3FF2AC72DFFD4FFE3FF66DB6EFFD4FFE3FFD4FFE3FFD4FF
          E3FF8DE897FFD4FFE3FFD4FFE3FF00B900FFC2C2C294C2C2C29400B900FF4BD2
          51FFD4FFE3FFD4FFE3FFD4FFE3FFD4FFE3FF00B900FF00B900FFD4FFE3FF66DB
          6EFF4BD251FFD4FFE3FFD4FFE3FF00B900FFC2C2C294C2C2C29400B900FF09B9
          09FF09B909FF66DB6EFFD4FFE3FF66DB6EFF00B900FF00B900FF4BD251FF00B9
          00FF4BD251FFD4FFE3FFD4FFE3FF00B900FFC2C2C294C2C2C29412B912FF44B9
          44FF44B944FFD4FFE3FFD4FFE3FFD4FFE3FF22B922FF22B922FF22B922FF22B9
          22FF4BD251FFD4FFE3FFD4FFE3FF12B912FFC2C2C294C2C2C29444B944FF12B9
          12FF00B900FF66DB6EFFD4FFE3FF66DB6EFF00B900FF00B900FF00B900FF00B9
          00FF00B900FF00B900FF0EB10EFF38B938FFC2C2C294C2C2C23EC2C2C294C2C2
          C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2
          C294C2C2C294C2C2C294C2C2C294C2C2C294C2C2C23E00000000C2C2C20CC2C2
          C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2C21AC2C2
          C21AC2C2C21AC2C2C21AC2C2C21AC2C2C20C0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFF0000800100000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000080010000FFFF0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          0000001000000000000000110000800000000019100087777111111991008FFF
          F199999999108FFFF199999999918FFFF199999999108FFFF111111991008FFF
          FFFFFF1910008FFFFFFFFF1100008FFFFFFFF71700008FFFFFFF800000008FFF
          FFFF8FFF00008FFFFFFF8FF000008FFFFFFF8F0000008888888880000000FFDF
          8888FFCF88880007888800038888000188880000888800018888000388880007
          888800078888000788880007888800078888000F8888001F8888003F88882800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000B900000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000B90000B9000000000000
          000000000000FFB658FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F
          15FF9F150000B90000CA0000B9000000000000000000FFCD9DFEDDBBFEDAB5FE
          DAB5FED7B00000C20000C20000C20000C20000C20000B90000D10000CA0000B9
          000000000000FFCD9DFEDFC1FEDDBBFEDDBBFEDAB50000C20000E80000E30000
          E30000DE0000D80000D10000CA0000CA0000B9000000FFCD9DFEE2C7FEDFC1FE
          DFC1FEDDBB0000C20000EC0000E80000E30000DE0000DE0000D80000D10000CA
          0000CA0000B9FFCD9DFEE2C7FEE2C7FEDFC1FEDFC10000C20000EC0000EC0000
          E80000E30000DE0000D80000D80000D10000B9000000FFCD9DFEE5CDFEE5CDFE
          E2C7FEE2C70000C20000C20000C20000C20000C20000C20000DE0000D80000C2
          000000000000FFCD9DFEE8D2FEE8D2FEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDF
          C1FEDDBB0000C90000E30000C2000000000000000000FFCD9DFEEBD8FEEBD8FE
          E8D2FEE8D2FEE5CDFEE2C7FEE2C7FEDFC1FEDFC10000C20000C9FF9F15000000
          000000000000FFCD9DFFEEDEFEEBD8FEEBD8FEE8D2FEE8D2FEE5CDFEE5CDFEE2
          C7FEE2C70000C9FEDFC1FF9F15000000000000000000FFCD9DFFF1E4FFEEDEFF
          EEDEFEEBD8FEEBD8FEE8D2FEE8D2FBE1BFFF9F15FF9F15FF9F15FF9F15000000
          000000000000FFD9B3FFF4EAFFF1E4FFF1E4FFEEDEFFEEDEFEEBD8FEEBD8F8C8
          8AF4D1ACF5BD83F6B677FF9F15000000000000000000FFDFBEFFF4EAFFF4EAFF
          F1E4FFF1E4FFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4D1ACFF9F15000000000000
          000000000000FFE2C4FFECD6FFF7F0FFF4EAFFF4EAFFF1E4FFF1E4FFEEDEF8C8
          8AFCEEDEFFB658000000000000000000000000000000FFE4C9FFE2C4FFDFBEFF
          D9B3FFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9D000000000000000000000000
          000000000000FFDFC9FFFFCFC9FF0007C9FF0003C9FF0001C9FF0000C9FF0001
          C9FF0003C9FF0007C9FF0007C9FF0007C9FF0007C9FF0007C9FF000FC9FF001F
          C9FF003FC9FF2800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000250000B9D20000002D0000
          00000000000000000000000000006C491C017E551F06754F1D07895C210B7F54
          180D7F54180D7F54180D7F54180D7F54180D7F5418260000B9FF0000B9FF7F54
          183884592005000000001A130C06FFB658FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FF0000B9FF0000CAFF0000
          B9FF7F541838000000001A130C06FFCD9DFFFEDDBBFFFEDAB5FFFEDAB5FFFED7
          B0FF0000C2FF0000C2FF0000C2FF0000C2FF0000C2FF0000B9FF0000D1FF0000
          CAFF0000B9FF0000002D1A130C06FFCD9DFFFEDFC1FFFEDDBBFFFEDDBBFFFEDA
          B5FF0000C2FF0000E8FF0000E3FF0000E3FF0000DEFF0000D8FF0000D1FF0000
          CAFF0000CAFF0000B9FF1A130C32FFCD9DFFFEE2C7FFFEDFC1FFFEDFC1FFFEDD
          BBFF0000C2FF0000ECFF0000E8FF0000E3FF0000DEFF0000DEFF0000D8FF0000
          D1FF0000CAFF0000CAFF0000B9D2FFCD9DFFFEE2C7FFFEE2C7FFFEDFC1FFFEDF
          C1FF0000C2FF0000ECFF0000ECFF0000E8FF0000E3FF0000DEFF0000D8FF0000
          D8FF0000D1FF0000B9FF1A130C32FFCD9DFFFEE5CDFFFEE5CDFFFEE2C7FFFEE2
          C7FF0000C2FF0000C2FF0000C2FF0000C2FF0000C2FF0000C2FF0000DEFF0000
          D8FF0000C2FF0000002D1A130C06FFCD9DFFFEE8D2FFFEE8D2FFFEE5CDFFFEE5
          CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFF0000C9FF0000E3FF0000
          C2FF7F541838000000001A130C06FFCD9DFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8
          D2FFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FF0000C2FF0000C9FFFF9F
          15FF895C211E000000001A130C06FFCD9DFFFFEEDEFFFEEBD8FFFEEBD8FFFEE8
          D2FFFEE8D2FFFEE5CDFFFEE5CDFFFEE2C7FFFEE2C7FF0000C9FFFEDFC1FFFF9F
          15FF7751211D0000000000000007FFCD9DFFFFF1E4FFFFEEDEFFFFEEDEFFFEEB
          D8FFFEEBD8FFFEE8D2FFFEE8D2FFFBE1BFFFFF9F15F3FF9F15DAFF9F15D5FF9F
          15FF9071501D0000000000000000FFD9B3FFFFF4EAFFFFF1E4FFFFF1E4FFFFEE
          DEFFFFEEDEFFFEEBD8FFFEEBD8FFF8C88AFFF4D1ACFFF5BD83FFF6B677FFFF9F
          15FF9F774D040000000000000000FFDFBEFFFFF4EAFFFFF4EAFFFFF1E4FFFFF1
          E4FFFFEEDEFFFFEEDEFFFEEBD8FFF8C88AFFF5D6B2EBF4D1ACFFFF9F15FFFF9F
          1508000000000000000000000000FFE2C4FFFFECD6FFFFF7F0FFFFF4EAFFFFF4
          EAFFFFF1E4FFFFF1E4FFFFEEDEFFF8C88AFFFCEEDEE9FFB658FFC47A10050000
          0000000000000000000000000000FFE4C97FFFE2C4FFFFDFBEFFFFD9B3FFFFCD
          9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFF975E0C03000000000000
          0000000000000000000000000000FF8FC97F0002C97F0002C97F0000C97F0000
          C97F0000C97F0000C97F0000C97F0002C97F0002C97F0002C97F0003C97F0003
          C97F0007C97F000FC97F001FC97F}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          00000000000000800000000000000087777777777700008FFFFFFFFFF700008F
          FFFFFFFFF700008FFFFFFFFFF700008FFFFFFFFFF700008FFFFFFFFFF700008F
          FF2FFFFF7700008FF2A2FFF88800008F2AAA2F800000208222A2228FFF00228F
          F2A2FF8FF0002A222AA2FF8F000002AAAA28888000000022220000000000FFFF
          2200C0012200C0012200C0012200C0012200C0012200C0012200C0012200C001
          2200C0012200C0012200400122000003220000072200800F2200C3FF22002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFB658FF
          9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15
          FF9F15000000000000000000FFCD9DFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4
          ABFED4ABFED2A6FED2A6FECFA2FECFA2FF9F15000000000000000000FFCD9DFE
          DFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFED4ABFED2A6FED2A6
          FF9F15000000000000000000FFCD9DFEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDA
          B5FEDAB5FED7B0FED7B0FED4ABFED2A6FF9F15000000000000000000FFCD9DFE
          E2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4AB
          FF9F15000000000000000000FFCD9DFEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDF
          C1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FF9F15000000000000000000FFCD9DFE
          E8D2FEE8D2FEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5
          FF9F15000000000000000000FFCD9DFEEBD8FEEBD8FEE8D2168025FEE5CDFEE2
          C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFF9F15000000000000000000FFCD9DFF
          EEDEFEEBD81680251B9A2D168025FEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDFC1
          FF9F15000000000000000000FFCD9DFFF1E41680251B9E2D1DA52F1B9A2D1680
          25FEE8D2FBE1BFFF9F15FF9F15FF9F15FF9F15000000168025000000FFD9B316
          8025168025188A281DA830188A28168025168025F8C88AF4D1ACF5BD83F6B677
          FF9F15000000168025168025FFDFBEFFF4EAFFF4EA1680251EAB31168025FFEE
          DEFEEBD8F8C88AF5D6B2F4D1ACFF9F1500000000000016802521BE381B9D2D16
          80251680251EAE321EAA31168025FFF1E4FFEEDEF8C88AFCEEDEFFB658000000
          0000000000000000001A962B1DA63020BC3620B9361FB033168025FFCD9DFFCD
          9DFFCD9DFFCD9DFFCD9D00000000000000000000000000000000000016802516
          8025168025168025000000000000000000000000000000000000000000000000
          000000000000FFFF0000C0010000C0010000C0010000C0010000C0010000C001
          0000C0010000C0010000C0010000C0010000400100000003000000070000800F
          0000C3FF00002800000010000000200000000100200000000000400000000000
          000000000000000000000000000000000000000000006C491C137E551F27754F
          1D2A895C21357F54183A7F54183A7F54183A7F54183A7F54183A7F54183A7F54
          183A7F54183A7F54183A845920220000000000000000FFB658FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FF7F54183A0000000000000000FFCD9DFFFEDDBBFFFEDA
          B5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2A6FFFED2A6FFFECF
          A2FFFECFA2FFFF9F15FF7F54183A0000000000000000FFCD9DFFFEDFC1FFFEDD
          BBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2
          A6FFFED2A6FFFF9F15FF7F54183A0000000000000000FFCD9DFFFEE2C7FFFEDF
          C1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4
          ABFFFED2A6FFFF9F15FF7F54183A0000000000000000FFCD9DFFFEE2C7FFFEE2
          C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7
          B0FFFED4ABFFFF9F15FF7F54183A0000000000000000FFCD9DFFFEE5CDFFFEE5
          CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDA
          B5FFFED7B0FFFF9F15FF7F54183A0000000000000000FFCD9DFFFEE8D2FFFEE8
          D2FFFAE3CAFBF7E2C8F7FAE0C4FBFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDD
          BBFFFEDAB5FFFF9F15FF7F54183A0000000000000000FFCD9DFFFEEBD8FFFEEB
          D8FFF3E3CAF4168025FFF3E0C5F4FEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDD
          BBFFFEDDBBFFFF9F15FF895C21350000000000000000FFCD9DFFFFEEDEFFF7E8
          D2F7168025FF1B9A2DFF168025FFF3E0C5F4FEE5CDFFFEE2C7FFFEE2C7FFFEDF
          C1FFFEDFC1FFFF9F15FF7751212C1680250F00000000FFCD9DFFF8EDDEF71680
          25FF1B9E2DFF1DA52FFF1B9A2DFF168025FFEFE1C7F0FBE1BFFFFF9F15F9FF9F
          15ECFF9F15E9FF9F15FF9071502A168025FF16802504FFD9B3FF509D56D01680
          25FF188A28FF1DA830FF188A28FF168025FF4F9A51D0F8C88AFFF4D1ACFFF5BD
          83FFF6B677FFFF9F15FF9F774D20168025FF168025FFE1D3AAE2FBF2E7FBE1E5
          D1E2168025FF1EAB31FF168025FFD7DBBEDBF3E6D0F4F8C88AFFF5D6B2F5F4D1
          ACFFFF9F15FFFF9F152E00000000168025FF21BE38FF1B9D2DFF168025FF1680
          25FF1EAE32FF1EAA31FF168025FFE9E6D2E9F8EBD8F7F8C88AFFFCEEDEF4FFB6
          58FFC47A102300000000000000001680251E1A962BFF1DA630FF20BC36FF20B9
          36FF1FB033FF168025FFB0B374C6F8CB99F7F8CB99F7FFCD9DFFFFCD9DFF975E
          0C1B000000000000000000000000168025041680251E168025FF168025FF1680
          25FF168025FF1680251E16802504000000000000000000000000000000000000
          0000000000000000000000000000C0002504C0002504C0002504C0002504C000
          2504C0002504C0002504C0002504C0002504C000250440002504000025040001
          2504000325040007250400FF2504}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010004001010100001000400280100004600000010100000010008006805
          00006E010000101000000100180068030000D606000010100000010020006804
          00003E0A00002800000010000000200000000100040000000000C00000000000
          0000000000000000000000000000000000000000800000800000008080008000
          00008000800080800000C0C0C000808080000000FF0000FF000000FFFF00FF00
          0000FF00FF00FFFF0000FFFFFF00000000000000000008000000000000000877
          77777777700008FFFFFFFFFF700008FFFFFFFFFF700008FFFFFFFFFF700008FF
          FFFFFFFF700008FFFFFFFFFF700008FFFFFFFFF7700008FFFFFFFF88800008FF
          FFFFF800000008FFFFFFF8FFF00008FFFFFFF8FF000008FFFFFFF8F000000888
          8888880000000000000000000000FFFF00008003000080030000800300008003
          0000800300008003000080030000800300008003000080030000800300008007
          0000800F0000801F0000FFFF0000280000001000000020000000010008000000
          0000400100000000000000000000000000000000000000000000800080008000
          000080800000008000000080800000008000C0C0C000C0DCC000F0CAA6008080
          8000FF00FF00FF000000FFFF000000FF000000FFFF000000FF00FFFFFF00F0FB
          FF0032323200262626001A1A1A000E0E0E00A4A0A000D4F0FF00B1E2FF008ED4
          FF006BC6FF0048B8FF0025AAFF0000AAFF000092DC00007AB90000629600004A
          730000325000D4E3FF00B1C7FF008EABFF006B8FFF004873FF002557FF000055
          FF000049DC00003DB900003196000025730000195000D4D4FF00B1B1FF008E8E
          FF006B6BFF004848FF002525FF000000FF000000DC000000B900000096000000
          730000005000E3D4FF00C7B1FF00AB8EFF008F6BFF007348FF005725FF005500
          FF004900DC003D00B900310096002500730019005000F0D4FF00E2B1FF00D48E
          FF00C66BFF00B848FF00AA25FF00AA00FF009200DC007A00B900620096004A00
          730032005000FFD4FF00FFB1FF00FF8EFF00FF6BFF00FF48FF00FF25FF00FF00
          FF00DC00DC00B900B900960096007300730050005000FFD4F000FFB1E200FF8E
          D400FF6BC600FF48B800FF25AA00FF00AA00DC009200B9007A00960062007300
          4A0050003200FFD4E300FFB1C700FF8EAB00FF6B8F00FF487300FF255700FF00
          5500DC004900B9003D00960031007300250050001900FFD4D400FFB1B100FF8E
          8E00FF6B6B00FF484800FF252500FF000000DC000000B9000000960000007300
          000050000000FFE3D400FFC7B100FFAB8E00FF8F6B00FF734800FF572500FF55
          0000DC490000B93D0000963100007325000050190000FFF0D400FFE2B100FFD4
          8E00FFC66B00FFB84800FFAA2500FFAA0000DC920000B97A000096620000734A
          000050320000FFFFD400FFFFB100FFFF8E00FFFF6B00FFFF4800FFFF2500FFFF
          0000DCDC0000B9B90000969600007373000050500000F0FFD400E2FFB100D4FF
          8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC00007AB90000629600004A73
          000032500000E3FFD400C7FFB100ABFF8E008FFF6B0073FF480057FF250055FF
          000049DC00003DB90000319600002573000019500000D4FFD400B1FFB1008EFF
          8E006BFF6B0048FF480025FF250000FF000000DC000000B90000009600000073
          000000500000D4FFE300B1FFC7008EFFAB006BFF8F0048FF730025FF570000FF
          550000DC490000B93D00009631000073250000501900D4FFF000B1FFE2008EFF
          D4006BFFC60048FFB80025FFAA0000FFAA0000DC920000B97A00009662000073
          4A0000503200D4FFFF00B1FFFF008EFFFF006BFFFF0048FFFF0025FFFF0000FF
          FF0000DCDC0000B9B900009696000073730000505000F2F2F200E6E6E600DADA
          DA00CECECE00C2C2C200B6B6B600AAAAAA009E9E9E0092929200868686007A7A
          7A006E6E6E0062626200565656004A4A4A003E3E3E0000000000000000000000
          0000000000000094959595959595959595959595000000929191919191858509
          0909099500000092919191919191918585090995000000928491919191919191
          9185099500000092848491919191919191918595000000928484848491919191
          9191919500000092848484848484919191919195000000929090848484848491
          9191919500000092909090848484848484919195000000929090909090848491
          9595959500000092F0909090909090920986939500000092F0F0909090909092
          9109950000000092F0F0F0F09090909290940000000000929292929292929292
          92000000000000000000000000000000000000000000FFFF0000800300008003
          0000800300008003000080030000800300008003000080030000800300008003
          00008003000080070000800F0000801F0000FFFF000028000000100000002000
          0000010018000000000040FFFFFF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000FFB658FF9F15FF9F15FF9F15FF9F15
          FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F150000000000000000
          00FFCD9DFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFED4ABFED2A6FED2A6FE
          CFA2FECFA2FF9F15000000000000000000FFCD9DFEDFC1FEDDBBFEDDBBFEDAB5
          FEDAB5FED7B0FED7B0FED4ABFED4ABFED2A6FED2A6FF9F150000000000000000
          00FFCD9DFEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FE
          D4ABFED2A6FF9F15000000000000000000FFCD9DFEE2C7FEE2C7FEDFC1FEDFC1
          FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFF9F150000000000000000
          00FFCD9DFEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FE
          DAB5FED7B0FF9F15000000000000000000FFCD9DFEE8D2FEE8D2FEE5CDFEE5CD
          FEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FF9F150000000000000000
          00FFCD9DFEEBD8FEEBD8FEE8D2FEE8D2FEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FE
          DDBBFEDDBBFF9F15000000000000000000FFCD9DFFEEDEFEEBD8FEEBD8FEE8D2
          FEE8D2FEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FF9F150000000000000000
          00FFCD9DFFF1E4FFEEDEFFEEDEFEEBD8FEEBD8FEE8D2FEE8D2FBE1BFFF9F15FF
          9F15FF9F15FF9F15000000000000000000FFD9B3FFF4EAFFF1E4FFF1E4FFEEDE
          FFEEDEFEEBD8FEEBD8F8C88AF4D1ACF5BD83F6B677FF9F150000000000000000
          00FFDFBEFFF4EAFFF4EAFFF1E4FFF1E4FFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4
          D1ACFF9F15000000000000000000000000FFE2C4FFECD6FFF7F0FFF4EAFFF4EA
          FFF1E4FFF1E4FFEEDEF8C88AFCEEDEFFB6580000000000000000000000000000
          00FFE4C9FFE2C4FFDFBEFFD9B3FFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9D00
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          0000800300008003000080030000800300008003000080030000800300008003
          000080030000800300008003000080070000800F0000801F0000FFFF00002800
          0000100000002000000001002000000000004000000000000000000000000000
          000000000000000000006C491C137E551F27754F1D2A895C21357F54183A7F54
          183A7F54183A7F54183A7F54183A7F54183A7F54183A7F54183A7F54183A8459
          20220000000000000000FFB658FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FF7F54
          183A1A130C0600000000FFCD9DFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7
          B0FFFED4ABFFFED4ABFFFED2A6FFFED2A6FFFECFA2FFFECFA2FFFF9F15FF7F54
          183A1A130C0600000000FFCD9DFFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDA
          B5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2A6FFFED2A6FFFF9F15FF7F54
          183A1A130C0600000000FFCD9DFFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDD
          BBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED2A6FFFF9F15FF7F54
          183A1A130C0600000000FFCD9DFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDD
          BBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFF9F15FF7F54
          183A1A130C0600000000FFCD9DFFFEE5CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDF
          C1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFF9F15FF7F54
          183A1A130C0600000000FFCD9DFFFEE8D2FFFEE8D2FFFEE5CDFFFEE5CDFFFEE2
          C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFF9F15FF7F54
          183A1A130C0600000000FFCD9DFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8D2FFFEE5
          CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFF9F15FF895C
          21351A130C0600000000FFCD9DFFFFEEDEFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8
          D2FFFEE5CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFF9F15FF7751
          212C1A130C0600000000FFCD9DFFFFF1E4FFFFEEDEFFFFEEDEFFFEEBD8FFFEEB
          D8FFFEE8D2FFFEE8D2FFFBE1BFFFFF9F15F9FF9F15ECFF9F15E9FF9F15FF9071
          502A0000000700000000FFD9B3FFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFFFEE
          DEFFFEEBD8FFFEEBD8FFF8C88AFFF4D1ACFFF5BD83FFF6B677FFFF9F15FF9F77
          4D200000000000000000FFDFBEFFFFF4EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEE
          DEFFFFEEDEFFFEEBD8FFF8C88AFFF5D6B2F5F4D1ACFFFF9F15FFFF9F152E0000
          00000000000000000000FFE2C4FFFFECD6FFFFF7F0FFFFF4EAFFFFF4EAFFFFF1
          E4FFFFF1E4FFFFEEDEFFF8C88AFFFCEEDEF4FFB658FFC47A1023000000000000
          00000000000000000000FFE4C982FFE2C4FFFFDFBEFFFFD9B3FFFFCD9DFFFFCD
          9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFF975E0C1B00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000008001000080000000800000008000000080000000800000008000
          000080000000800000008000000080000000800100008003000080070000800F
          0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          00000000000000000000000000008083B3B3B3B3B0008B8B3B3B3B3B3B008B83
          B3B3B3B3B3008B8B3B3B3B3B3B008B83B3B3B3B3B3008BB83B3B3B3B3B308BB8
          B3B3B3B323B08BBB88888802A2008BBBBBBBBB2AAA2008BBBB288222A2220088
          88220002A2000000002A222AA20000000002AAAA20000000000022220000FFFF
          0000800300000003000000010000000100000001000000010000000000000000
          0000000100000001000080000000C0E30000FC030000FE070000FF0F00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000A9DA00A3D200
          A3D2009DCA009DCA0097C80097C80097C8008FBE008FBE008FBE008CBA000000
          00000000000000A9DA00B4E82DD0FF7BE1FF5FDBFF5FDBFF5FDBFF5FDBFF5FDB
          FF5FDBFF5FDBFF5FDBFF03C7FF00A6D600000000000000A9DA35D2FF00B4E87F
          E2FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF1BCCFF00C4FC
          00A8D800000000A9DA53D9FF00A9DA75E0FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1
          FF7BE1FF7BE1FF7BE1FF2BD0FF0FC9FF00A8D800000000A9DA7DE2FF00A9DA71
          DFFFABECFF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF33D1FF2BD0FF
          00A8D800000000AEE08BE5FF00B4E857D9FFC5F3FFADEFFFABECFFABECFF97E8
          FF97E8FF97E8FF97E8FF25CEFF4BD7FF00A8D800A8D800AEE097E8FF4DD7FF00
          B4E897E8FFC7F2FFC7F2FFC5F2FFC5F2FFAFEDFFAFEDFFAFEDFF2BD0FF97E8FF
          29CFFF00A8D800AEE0A7EDFF8BE5FF00A9DA41D5FF71DFFFB7EFFFB7EFFFB7EF
          FFB7EFFFB7EFFFAFEAF51680257ADDF533D1FF00A8D800AEE0C7F4FFBFF1FF85
          E4FF00BCF200B6EA00B7EC00B6EA00B6EA00B1E401AFDE1680251B9A2D168025
          01A4CE00000000AEE081E3FFE3F9FFE3F9FFD3F6FFB4E3DBA5D9CAD3F6FFD3F6
          FFCDF2F81680251B9E2D1DA52F1B9A2D16802500000000000000AEE089E5FFEF
          FDFFE3F9FFC1E5DB16802503A8C800AEE0118B53168025188A281DA830188A28
          16802516802500000000000000AEE000AEE000AEE004A2BC1680251680250000
          000000000000001680251EAB3116802500000000000000000000000000000000
          000000000000000016802521BE381B9D2D1680251680251EAE321EAA31168025
          0000000000000000000000000000000000000000000000000000001A962B1DA6
          3020BC3620B9361FB03316802500000000000000000000000000000000000000
          0000000000000000000000000000168025168025168025168025000000000000
          000000000000FFFF000080070000000300000001000000010000000100000000
          00000000000000000000000100000001000080000000C0E30000FC030000FE07
          0000FF0F00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000403090B04030924040309310403
          0931040309310403093104030931040309310403093104030931040309310403
          09310403091E00000000000000000403090800A9DAF500A3D2FF00A3D2FF009D
          CAFF009DCAFF0097C8FF0097C8FF0097C8FF008FBEFF008FBEFF008FBEFF008C
          BAFF00A8D8FD004556210000000000A9DAF500B4E8F52DD0FFFB7BE1FFFF5FDB
          FFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF03C7
          FFFF00A6D6FF004C627B00161C0900A9DAF535D2FFFB00B4E8F57FE2FFFE7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF1BCC
          FFFF00C4FCFF008FB8CE002A342200A9DAF553D9FFFD00A9DAF575E0FFFD7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF2BD0
          FFFF0FC9FFFF00A8D8E10045564800A9DAF57DE2FFFF00A9DAF571DFFFFDABEC
          FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF33D1
          FFFF2BD0FFFF00A8D8EA005B725E00AEE0F58BE5FFFF00B4E8F557D9FFFBC5F3
          FFFFADEFFFFFABECFFFFABECFFFF97E8FFFF97E8FFFF97E8FFFF97E8FFFF25CE
          FFFF4BD7FFFF00A8D8FD0076988F00AEE0F597E8FFFF4DD7FFFB00B4E8F597E8
          FFFFC7F2FFFFC7F2FFFFC5F2FFFFC5F2FFFFAFEDFFFFAFEDFFFFAFEDFFFF2BD0
          FFFF97E8FFFF29CFFFFF008FB8E600AEE0F5A7EDFFFF8BE5FFFD00A9DAF541D5
          FFFF71DFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFFAFEAF5F41680
          25FF7ADDF5F433D1FFFF00A8D8FD00AEE0F5C7F4FFFFBFF1FFFE85E4FFFF00BC
          F2FF00B6EAFC00B7ECFF00B6EAFF00B6EAFF00B1E4FF01AFDEF7168025FF1B9A
          2DFF168025FF01A4CEF400A9DA4B00AEE0F581E3FFFFE3F9FFFFE3F9FFFFD3F6
          FFFFB4E3DBDCA5D9CAD0D3F6FFFFD3F6FFFFCDF2F8F7168025FF1B9E2DFF1DA5
          2FFF1B9A2DFF168025FF168025010403091C00AEE0FF89E5FFFFEFFDFFFFE3F9
          FFFFC1E5DBDC168025FF03A8C8E200AEE0FF118B53D0168025FF188A28FF1DA8
          30FF188A28FF168025FF16802591000000000403091B00AEE0FF00AEE0FF00AE
          E0FF04A2BCDC168025FF168025FF168025040000000016802504168025FF1EAB
          31FF168025FF168025081680250100000000040309040403090B0403090B0403
          090B060E0B0C168025FF21BE38FF1B9D2DFF168025FF168025FF1EAE32FF1EAA
          31FF168025FF1680250200000000000000000000000000000000000000000000
          0000000000001680251E1A962BFF1DA630FF20BC36FF20B936FF1FB033FF1680
          25FF1680251E0000000000000000000000000000000000000000000000000000
          000000000000168025041680251E168025FF168025FF168025FF168025FF1680
          251E168025040000000000000000800300000001000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000008040
          000080010000FC030000FC030000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          0000000000000000000000000000003077800000030003307780000003000330
          7780000003000330778000000300033000000000030003333333333333000330
          000000003300030FFFFFFFFF0300030FFFFFFFFF0300030F4444444F0300030F
          FFFFFFFF0300030F4444444F0000030FFFFFFFFF07000000000000000000FFFF
          0000C00100008001000000010000000100000001000000010000000100000001
          0000000100000001000000010000000100000001000000010000000100002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000BD4360C1
          A3ACC8909ED596A6E09CACDFCED3DBC9CED7C3C8BD425FBD425FAA3350BD425F
          000000000000000000BF4966D6607CC9AFB6D0627CCD7388D5A3B0EEE4E8DFCE
          D3DBC9CED35371D35371AA3350D35371BD425F000000C85472D35476D76480CF
          B7C0D1647FCD7087C8909ED6C2C9EEE4E8DFCED3D35371D35371AA3350D35371
          BD425F000000CC5A78CC486AD35476D2BCC3D26680CF758BC68C9BC4A8B0D6C2
          C9EEE4E8D35371D35371AA3350D35371BD425F000000CA5A77C2345BCC486AD7
          B8C1D26781D2788ECC95A3C1A3ACC4A8B0D6C2C9D35371C33F5EAA3350D35371
          BD425F000000CB5A78B63052C2345BE792A6D7B8C1D2ABB5D099A8C9AFB6C1A3
          ACCA9EAAB83455B83455BB3859D35371BD425F000000CC5B78BF3558B63052C4
          385ECC486AD55C79DA7089D76480D45674D35371D35371D35371D35371D35371
          BD425F000000CC5C79C1385ADBA8B7E8DCE2E8DDE2E8DDE2E8DDE2E8DDE2E8DD
          E2E8DDE2E8DDE2E8DDE2E1B2BFD35371BD425F000000CE5E7AC33B5DE8DDE2F0
          E8ECF0E9ECF3EDEFF3EDEFF3EDEFF3EDEFF3EDEFF3EDEFF3EDEFE8DEE3D35371
          BD425F000000CE5F7BCB4767EFE9ECE193A5D96F88D96E88D86E87D86E87D86E
          87D86E87D86E87DE8FA3E8DEE3D35371BD425F000000CE5F7BD35371EFE9ECF3
          EEF0F1EBEFF1EAEEEFE8EBEFE8EBEFE8EBEFE8EBEFE8EBEFE8EBE8DEE3D35371
          BD425F000000CE5F7BD35371EFE9ECE092A5D96F88D96E88D96E88D96E88D96E
          88D96E88D96E88DF90A4E8DEE3D45674BD425F000000CE5F7BD35371EFE9ECF3
          EEF0F2EDEFF2EDEFF2EDEFF2EDEFF2EDEFF2EDEFF0EAEDF0E9ECE8DEE3D76480
          BD4360000000CE5F7BD35371EFE9ECE092A5D96F88D96F88D96F88D96F88D96F
          88D96F88D96F88E193A5E8DEE3DA7089BF4966000000CE5F7BCF647EF0EAEDF0
          EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDD06781
          CF6680000000FFFF7BCFC0037BCF80017BCF00017BCF00017BCF00017BCF0001
          7BCF00017BCF00017BCF00017BCF00017BCF00017BCF00017BCF00017BCF0001
          7BCF00017BCF2800000010000000200000000100200000000000400000000000
          00000000000000000000000000000000000000000007000000110000001F0000
          0021000000220000002200000022000000220000002200000027000000270000
          0024000000240000001B000000040000000000000017D45674E0C1A3ACEAC890
          9EF0D596A6F0E09CACF0DFCED3F0DBC9CEF0D7C3C8F0D35371F0D35371F0AA33
          50F0D35371EAD3537168000000170000000FD76480DED6607CFFC9AFB6FFD062
          7CFFCD7388FFD5A3B0FFEEE4E8FFDFCED3FFDBC9CEFFD35371FFD35371FFAA33
          50FFD35371FFD35371E50000001ECC486AE7D35476FFD76480FFCFB7C0FFD164
          7FFFCD7087FFC8909EFFD6C2C9FFEEE4E8FFDFCED3FFD35371FFD35371FFAA33
          50FFD35371FFD35371F200000022C2345BF1CC486AFFD35476FFD2BCC3FFD266
          80FFCF758BFFC68C9BFFC4A8B0FFD6C2C9FFEEE4E8FFD35371FFD35371FFAA33
          50FFD35371FFD35371F200000022B63052FFC2345BFFCC486AFFD7B8C1FFD267
          81FFD2788EFFCC95A3FFC1A3ACFFC4A8B0FFD6C2C9FFD35371FFC33F5EFFAA33
          50FFD35371FFD35371F200000022BF3558FFB63052FFC2345BFFE792A6FFD7B8
          C1FFD2ABB5FFD099A8FFC9AFB6FFC1A3ACFFCA9EAAFFB83455FFB83455FFBB38
          59FFD35371FFD35371F200000022C1385AFFBF3558FFB63052FFC4385EFFCC48
          6AFFD55C79FFDA7089FFD76480FFD45674FFD35371FFD35371FFD35371FFD353
          71FFD35371FFD35371F200000022C33B5DFFC1385AFFDBA8B7FFE8DCE2FFE8DD
          E2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE1B2
          BFFFD35371FFD35371F200000022CB4767FFC33B5DFFE8DDE2FFF0E8ECFFF0E9
          ECFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFE8DE
          E3FFD35371FFD35371F200000022D35371FFCB4767FFEFE9ECFFE193A5FFD96F
          88FFD96E88FFD86E87FFD86E87FFD86E87FFD86E87FFD86E87FFDE8FA3FFE8DE
          E3FFD35371FFD35371F200000022D35371FFD35371FFEFE9ECFFF3EEF0FFF1EB
          EFFFF1EAEEFFEFE8EBFFEFE8EBFFEFE8EBFFEFE8EBFFEFE8EBFFEFE8EBFFE8DE
          E3FFD35371FFD35371F200000022D35371FFD35371FFEFE9ECFFE092A5FFD96F
          88FFD96E88FFD96E88FFD96E88FFD96E88FFD96E88FFD96E88FFDF90A4FFE8DE
          E3FFD45674FFD35371F200000021D35371FFD35371FFEFE9ECFFF3EEF0FFF2ED
          EFFFF2EDEFFFF2EDEFFFF2EDEFFFF2EDEFFFF2EDEFFFF0EAEDFFF0E9ECFFE8DE
          E3FFD76480FFD45674F200000016D35371EFD35371FFEFE9ECFFE092A5FFD96F
          88FFD96F88FFD96F88FFD96F88FFD96F88FFD96F88FFD96F88FFE193A5FFE8DE
          E3FFDA7089FFD76480EA00000008D3537166D35371F1F0EAEDFFF0EAEDFFF0EA
          EDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EA
          EDFFD65E7AF3DA70895400000000800071668000716600007166000071660000
          7166000071660000716600007166000071660000716600007166000071660000
          7166000071660000716600017166}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          0000000000000000000000000000003077800003330003307780000333000330
          7780000333000330778000033300033000000003330003333333333333000330
          000000003300030FFFFFFFFF0300030FFFFFFFFF0300030F4444444F0300030F
          FFFFFFFF0300030F4444444F0000030FFFFFFFFF07000000000000000000FFFF
          0000C00100008001000000010000000100000001000000010000000100000001
          0000000100000001000000010000000100000001000000010000000100002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000159400A5
          A7A596AF919CBF959FCC98CACDC9C5C7C5C0C2C0159400159400159400159400
          00000000000000000015940018A900AFB1AF70B6647DB375A6BFA1DCDFDBCACD
          C9C5C7C51BC0001BC00017A2001BC000159400000000159400169C0017A400B6
          B8B673B7657DB47296AF91C0C1BFDCDFDBCACDC91BC0001BC00017A2001BC000
          159400000000159400159400169C00BABCBA75B86881B67693AC8EA9ABA9C0C1
          BFCED1CD1BC0001BC00017A2001BC000159400000000159400159400159400B7
          C2B476B96983B9799AB395A5A7A5A9ABA9C0C1BF1BC00019B40017A2001BC000
          15940000000015940015940015940096C28EB7C2B4ADBCAAB1C3ADAFB1AFA5A7
          A5A2B29E17A20017A20019B4001BC000159400000000159400169C0015940015
          9400159400169C0017A40018A90019AE001BC0001BC0001BC0001BC0001BC000
          15940000000015940017A300ABC6A4D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6D6
          D6D6D6D6D6D6D6D6D6D6B2CEAC1BC00015940000000015940018A800D6D6D6E0
          E1DFE1E1E1E4E5E3E4E5E3E4E5E3E4E5E3E4E5E3E4E5E3E4E5E3D7D7D71BC000
          15940000000015940019AE00E0E0E051C1591596001596001596001596001596
          0015960015960051C059D7D7D71BC00015940000000015940019B500E0E0E0E4
          E4E4E2E2E2E2E3E1E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0E0D7D7D71BC000
          1594000000001594001ABA00E0E0E051C0591596001596001596001596001596
          0015960015960051C059D7D7D719AE001594000000001594001BC000E0E0E0E4
          E4E4E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E3E1E1E1E1E1E1D7D7D718A900
          1594000000001594001BC000E0E0E051C0591596001596001596001596001596
          0015960015960051C159D7D7D717A000159400000000159400159400E1E1E1E1
          E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1E1159400
          159400000000FFFF0015C0030015800100150001001500010015000100150001
          0015000100150001001500010015000100150001001500010015000100150001
          0015000100152800000010000000200000000100200000000000400000000000
          00000000000000000000000000000000000000000007000000110000001F0000
          0021000000220000002200000022000000220000002200000027000000270000
          0024000000240000001B00000004000000000000001719AE00E0A5A7A5EA96AF
          91F09CBF95F09FCC98F0CACDC9F0C5C7C5F0C0C2C0F01BC000F01BC000F017A2
          00F01BC000EA1BC00068000000170000000F17A400DE18A900FFAFB1AFFF70B6
          64FF7DB375FFA6BFA1FFDCDFDBFFCACDC9FFC5C7C5FF1BC000FF1BC000FF17A2
          00FF1BC000FF1BC000E50000001E159400E7169C00FF17A400FFB6B8B6FF73B7
          65FF7DB472FF96AF91FFC0C1BFFFDCDFDBFFCACDC9FF1BC000FF1BC000FF17A2
          00FF1BC000FF1BC000F200000022159400F1159400FF169C00FFBABCBAFF75B8
          68FF81B676FF93AC8EFFA9ABA9FFC0C1BFFFCED1CDFF1BC000FF1BC000FF17A2
          00FF1BC000FF1BC000F200000022159400FF159400FF159400FFB7C2B4FF76B9
          69FF83B979FF9AB395FFA5A7A5FFA9ABA9FFC0C1BFFF1BC000FF19B400FF17A2
          00FF1BC000FF1BC000F200000022169C00FF159400FF159400FF96C28EFFB7C2
          B4FFADBCAAFFB1C3ADFFAFB1AFFFA5A7A5FFA2B29EFF17A200FF17A200FF19B4
          00FF1BC000FF1BC000F20000002217A300FF169C00FF159400FF159400FF1594
          00FF169C00FF17A400FF18A900FF19AE00FF1BC000FF1BC000FF1BC000FF1BC0
          00FF1BC000FF1BC000F20000002218A800FF17A300FFABC6A4FFD6D6D6FFD6D6
          D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFD6D6D6FFB2CE
          ACFF1BC000FF1BC000F20000002219AE00FF18A800FFD6D6D6FFE0E1DFFFE1E1
          E1FFE4E5E3FFE4E5E3FFE4E5E3FFE4E5E3FFE4E5E3FFE4E5E3FFE4E5E3FFD7D7
          D7FF1BC000FF27C40DF20000002219B500FF19AE00FFE0E0E0FF51C159FF1596
          00FF159600FF159600FF159600FF159600FF159600FF159600FF51C059FFD7D7
          D7FF1BC000FF27C40DF2000000221ABA00FF19B500FFE0E0E0FFE4E4E4FFE2E2
          E2FFE2E3E1FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFE0E0E0FFD7D7
          D7FF1BC000FF1BC000F2000000221BC000FF1ABA00FFE0E0E0FF51C059FF1596
          00FF159600FF159600FF159600FF159600FF159600FF159600FF51C059FFD7D7
          D7FF19AE00FF1BC000F2000000211BC000FF1BC000FFE0E0E0FFE4E4E4FFE3E3
          E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE3E3E3FFE1E1E1FFE1E1E1FFD7D7
          D7FF18A900FF19AE00F2000000161BC000EF1BC000FFE0E0E0FF51C059FF1596
          00FF159600FF159600FF159600FF159600FF159600FF159600FF51C159FFD7D7
          D7FF17A000FF18A900EA000000081BC000661BC000F1E1E1E1FFE1E1E1FFE1E1
          E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1E1FFE1E1
          E1FF159700F317A0005400000000800000668000006600000066000000660000
          0066000000660000006600000066000000660000006600000066000000660000
          0066000000660000006600010066}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000FF5D31FF5725FF5725FF5725FF5725
          FF5725FF5725FF5725FF5725FF5725FF5725FF5725FF5D310000000000000000
          00FF5725F1D4B4F1D4B4F0CFA9EFCA9EEFCA9EEDC693ECC089ECC089EABC7DEA
          B773EAB773FF5725000000000000000000FF5725F2D9BFF1D4B4F1D4B4F0CFA9
          EFCA9EEFCA9EEDC693EDC693ECC089EABC7DEABC7DFF57250000000000000000
          00FF5725F4DEC9F2D9BFF2D9BFF1D4B4F0CFA9F0CFA9EFCA9EEDC693EDC693EC
          C089EABC7DFF5725000000000000000000FF5725F5E2D4F4DEC9F2D9BFF2D9BF
          F1D4B4F0CFA9F0CFA9EFCA9EEDC693EDC693ECC089FF57250000000000000000
          00FF5725F5E2D4F5E2D4F4DEC9F2D9BFF2D9BFF1D4B4F0CFA9F0CFA9EFCA9EED
          C693EDC693FF5725000000000000000000FF5725F7E7DFF5E2D4F5E2D4F4DEC9
          F2D9BFF2D9BFF1D4B4F1D4B4F0CFA9EFCA9EEFCA9EFF57250000000000000000
          00FF5725F7E6DBF7E7DFF7E7DFF5E2D4F4DEC9F4DEC9F2D9BFF1D4B4F1D4B4F0
          CFA9EFCA9EFF5725000000000000000000FF5725F6E2D3F7E6DBF7E7DFF7E7DF
          F5E2D4F4DEC9F4DEC9F2D9BFF1D4B4F1D4B4F0CFA9FF57250000000000000000
          00FF5725F27E59F27E59F2805CF2805EF2805EF17E59F17D56F17D56F17C53F1
          7A4FF17A4FFF5725000000000000000000FF673AFFFBF9FFB39CFFFCFBFF8D6D
          FFE4DCFEAB93FA8564F44F20F24F201005CF1005CFE7481C0000000000000000
          00FF7752FFDED5FFFDFDFFCEC1FFEEE9FF9478FFCABCFE8C6FF85930F4583010
          06D11006D1F25E38000000000000000000000000FF7752FF7752FF744FFF714B
          FF6F49FF6B44FF663FFE6038F85F38F45F38F25E380000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF0000FFFF000080030000800300008003
          0000800300008003000080030000800300008003000080030000800300008003
          000080030000C0070000FFFF0000280000001000000020000000010020000000
          0000400000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00090000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E000000090000000000000000FF5D31B6FF57
          25FEFF5725FEFF5725FEFF5725FEFF5725FEFF5725FEFF5725FEFF5725FEFF57
          25FEFF5725FEFF5725FEFF5D31B60000000B0000000000000000FF5725FEF1D4
          B4FAF1D4B4FAF0CFA9FAEFCA9EFAEFCA9EFAEDC693FAECC089FAECC089FAEABC
          7DFAEAB773FAEAB773FAFF5725FE0000000E0000000000000000FF5725FEF2D9
          BFFAF1D4B4FAF1D4B4FAF0CFA9FAEFCA9EFAEFCA9EFAEDC693FAEDC693FAECC0
          89FAEABC7DFAEABC7DFAFF5725FE0000000E0000000000000000FF5725FEF4DE
          C9FAF2D9BFFAF2D9BFFAF1D4B4FAF0CFA9FAF0CFA9FAEFCA9EFAEDC693FAEDC6
          93FAECC089FAEABC7DFAFF5725FE0000000E0000000000000000FF5725FEF5E2
          D4FAF4DEC9FAF2D9BFFAF2D9BFFAF1D4B4FAF0CFA9FAF0CFA9FAEFCA9EFAEDC6
          93FAEDC693FAECC089FAFF5725FE0000000E0000000000000000FF5725FEF5E2
          D4FAF5E2D4FAF4DEC9FAF2D9BFFAF2D9BFFAF1D4B4FAF0CFA9FAF0CFA9FAEFCA
          9EFAEDC693FAEDC693FAFF5725FE0000000E0000000000000000FF5725FEF7E7
          DFFAF5E2D4FAF5E2D4FAF4DEC9FAF2D9BFFAF2D9BFFAF1D4B4FAF1D4B4FAF0CF
          A9FAEFCA9EFAEFCA9EFAFF5725FE0000000E0000000000000000FF5725FEF7E6
          DBFAF7E7DFFAF7E7DFFAF5E2D4FAF4DEC9FAF4DEC9FAF2D9BFFAF1D4B4FAF1D4
          B4FAF0CFA9FAEFCA9EFAFF5725FE0000000E0000000000000000FF5725FEF6E2
          D3FAF7E6DBFAF7E7DFFAF7E7DFFAF5E2D4FAF4DEC9FAF4DEC9FAF2D9BFFAF1D4
          B4FAF1D4B4FAF0CFA9FAFF5725FE0000000E0000000000000000FF5725FEF27E
          59FAF27E59FAF2805CFAF2805EFAF2805EFAF17E59FAF17D56FAF17D56FAF17C
          53FAF17A4FFAF17A4FFAFF5725FE0000000E0000000000000000FF673AFFFFFB
          F9FEFFB39CFEFFFCFBFEFF8D6DFEFFE4DCFEFEAB93FEFA8564FEF44F20FEF24F
          20FE1005CFFE1005CFFEE7481CFF0000000E0000000000000000FF7752E3FFDE
          D5FCFFFDFDFCFFCEC1FCFFEEE9FCFF9478FCFFCABCFCFE8C6FFCF85930FCF458
          30FC1006D1FC1006D1FCF25E38E3000000090000000000000000FF5D315EFF77
          52E3FF7752E3FF744FE3FF714BE3FF6F49E3FF6B44E3FF663FE3FE6038E3F85F
          38E3F45F38E3F25E38E3FF5D315E000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFF0000C00100008001
          0000800100008001000080010000800100008001000080010000800100008001
          000080010000800100008001000080030000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000044
          444444444444004FFFFFFFFFFFF4004F22F733F766F40B4F22F733F766F40B4F
          FFFFFFFFFFF40B4FFFFFFFFFFFF40B4F99F7BBF7CCF40B4F99F7BBF7CCF40B4F
          FFFFFFFFFFF40B4CCCCCCCCCCCC40B4CCCCCCCCCCCC40BBCCCCCCCCCCCC00BBB
          BBBBBBBB000000BBBBB00000000000000000000000000000000000000000C000
          0000C00000008000000000000000000000000000000000000000000000000000
          000000000000000000000001000000070000800F0000C1FF0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          000000000000000000000000FF5D31FF5725FF5725FF5725FF5725FF5725FF57
          25FF5725FF5725FF5725FF5725FF5725FF5725FF5D31000000000000FF5725B0
          D498AFD090AFD090F7E3BFB1D3B5B1D3B5AFCFACF4D8A7EDC06FEBBC66EBBC66
          F1CD8EFF5725000000009DD0FF5725B1D7A000B90000B900F9E8CCB1D7BD00B9
          B900B9B9F4D8A7EDC478DC9200DC9200F1CD8EFF572500A0D45DD7FFFF5725B2
          DBA900B90000B900FAEED8B3DBC700B9B900B9B9F6DDB3EDC478DC9200DC9200
          F3D29BFF572500A0D46BDAFFFF5725FDF8F0FDF8F0FCF3E4FAEED8FAEED8F9E8
          CCF7E3BFF7E3BFF6DDB3F4D8A7F4D8A7F4D8A7FF572500A0D46BDAFFFF5725E4
          D5FDE2D0F2E2D0F2FCF3E4B3DBE3B3DBE3B3D6DAF9E8CCF9A389F99F80F99F80
          F6DDB3FF572500A0D46BDAFFFF5725E4D3F95725FF5725FFFDF8F0B5DEEC00AA
          FF00AAFFF9E8CCFBA692FF2525FF2525F6DDB3FF572500A0D477DDFFFF5725E3
          D0F25725FF5725FFFFFEFDB6E2F400AAFF00AAFFFAEED8FBA692FF2525FF2525
          F7E3BFFF572500A4DA85E1FFFF5725FEF8EFFEF8EFFFFCF8FFFEFDFFFEFDFDF8
          F0FCF3E4FCF3E4FAEED8F9E8CCF9E8CCF9E8CCFF572500A4DA91E4FFFF673AFF
          6537FF6133FF5F31FF5B2DFF5627FE5020F84F20F44F20F24F20F24F20F24F20
          F24F20E7481C00A4DAA1EAFFFF7752FF714AFF6E47FF6B43FF6941FF653CFF60
          37FE5A30F85930F45830F25830F25830F25830F25E3800A4DAC1F1FF99E8FFFF
          7752FF7752FF744FFF714BFF6F49FF6B44FF663FFE6038F85F38F45F38F45F38
          F25E3800000000A4DA7BDEFFDDF7FFDDF7FFCDF4FFCDF4FFCDF4FFCDF4FFCDF4
          FFCDF4FFCDF4FFBFF1FF00A0D400000000000000000000000000A4DA83E0FFE9
          FBFFDDF7FFDDF7FF7BDEFF00A4DA00A4DA00A4DA00A0D400A0D4000000000000
          00000000000000000000000000A4DA00A4DA00A4DA00A0D400A0D40000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000C0000000C0000000800000000000000000000000000000000000
          0000000000000000000000000000000000000001000000070000800F0000C1FF
          0000FFFF00002800000010000000200000000100200000000000400000000000
          000000000000000000000000000000000000000000009D6050AF9D5E4BDD9D5E
          4BDD9D5E4BDD9D5E4BDD9D5E4BDD9D5E4BDD9D5E4BDD9D5E4BDD9D5E4BDD9D5E
          4BDD9D5E4BDD9D5E4BDB9A6051930000000000000024FF5725FDB0D498F9AFD0
          90F9AFD090F9F7E3BFF5B1D3B5F7B1D3B5F7AFCFACF7F4D8A7F5EDC06FF7EBBC
          66F7EBBC66F7F1CD8ED99D5E4BDD00000011009DD0FBFE5725FDAFD49EF900B9
          00FF00B900FFF4E3C8F5AED4BAF700B9B9FF00B9B9FFEFD4A4F5E9C176F7DC92
          00FFDC9200FFDEBD83D99D5E4BDD00A0D4805DD7FFFFFE5726FEB0DAA9FC00B9
          00FF00B900FFF5ECD8FAB0DAC7FB00B9B9FF00B9B9FFF1DBB3FAE9C379FBDC92
          00FFDC9200FFE0C28FD99C5D4BDD00A0D4B96BDAFFFFFE5726FEFAF7F0FAFAF7
          F0FAF9F2E5FAF7EED9FAF7EED9FAF6E8CDFAF4E3C0FAF4E3C0FAF2DDB4FAF0D8
          A9FAF1D8A9FAE1D1A8ED9C5D4BDD00A0D4D96BDAFFFFFE5726FEE3D5FDFBE0D0
          F2FBE0D0F2FBF9F3E5FAB2DBE3FBB2DBE3FBB2D6DBFBF6E8CDFAF6A48BFBF5A0
          82FBF6A082FBE3D6B3ED9C5D4BDD00A0D4D96BDAFFFFFE5726FEE3D3F9FB5725
          FFFF5725FFFFFAF7F0FAB4DEECFB00AAFFFF00AAFFFFF6E8CDFAF8A794FBFF25
          25FFFF2525FFE3D6B3ED9C5D4BDD00A0D4EB77DDFFFFFE5726FEE2D0F2FB5725
          FFFF5725FFFFFDFDFDFAB5E2F4FB00AAFFFF00AAFFFFF8EED9FAF9A794FBFF25
          25FFFF2525FFE4DCBFED9C5D4BDD00A4DAEB85E1FFFFFE5726FEFCF8EFFAFDF8
          EFFAFDFCF8FAFDFEFDFAFDFEFDFAFBF8F0FAFAF3E5FAFAF3E5FAF8EED9FAF4E7
          CDFAF7E8CDFAE5E1CBED9C5D4BDD00A4DAEB91E4FFFFFF673AFFFF6638FEFF62
          34FEFF6032FEFF5C2EFEFF5728FEFE5121FEF85021FEF45021FEF25021FEF14F
          21FEF25021FEEE5023FB955848DE00A4DAEBA1EAFFFFE37D63F9FD724CFCFE6F
          49FCFE6D45FCFE6B43FCFE673EFCFE6239FCFD5C32FCF75B32FCF35A32FCF059
          32FCF15A32FCE75B38F49A54426F00A4DAEBC1F1FFFFBFB5B3F4E37D63F2E37D
          63F2E37A60F2E3785CF2E3765AF2E37256F2E36D50F2E2684AF2DD6649F2D966
          49F2D96649E698422B690000000000A4DAEB7BDEFFFFDDF7FFFFDDF7FFFFCDF4
          FFFFCDF4FFFFCDF4FFFFCDF4FFFFCDF4FFFFCDF4FFFFCDF4FFFFBFF1FFFF00A0
          D4FF0202043800000000000000000202040300A4DAFF83E0FFFFE9FBFFFFDDF7
          FFFFDDF7FFFF7BDEFFFF00A4DAFF00A4DAFF00A4DAFF00A0D4FF00A0D4FF0202
          0438000000000000000000000000000000000000000000A4DAFF00A4DAFF00A4
          DAFF00A0D4FF00A0D4FF02020438000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C00000008000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000100000003
          000000070000C0FF0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000938F8B938F8B938F8B938F8B938F8B00000000
          0000000000000000000000000000000000000000000000938F8B938F8BA19993
          A89F97A79E949F968D9B948D938F8B938F8B0000000000000000000000000000
          00000000938F8BA59D9699C999A8B19CADA39AADA39AA79E94A2988EA2988E9B
          9289938F8B000000000000000000000000938F8BACA59E85CCC6A9B6AD99C999
          A8B19CADA39AADA39AA79E94A2988EA2988E9B9289938F8B0000000000000000
          00938F8B948FCAB2C0B885CCC6A1C39DA3BD9CB2A9A0ADA39AADA39AA79E94A7
          9E94A2988E938F8B000000000000938F8BB0ACA6BBB4BE9993CF9C96C580B7B3
          938F8B938F8B938F8B9E968EADA39AA79E94A79E949B948D938F8B000000938F
          8BBEB8B1D8D1CABBB4BEAAA3BE938F8B000000000000000000938F8BABA29AAD
          A39AA79E94A39B92938F8B000000938F8BD1CAC3DBD5CFCCC4BDB8B1A9938F8B
          000000000000000000938F8BA49C94B2A9A0ADA39AA79E94938F8B000000938F
          8BC2BCB6DFDAD5D1CAC3C4BCB6938F8B000000000000000000938F8B9D96B0AD
          A4ADB2A9A0A89F97938F8B000000938F8BB0ACA6E7E2DDDBD5CFD1CAC3B5AEA8
          938F8B938F8B938F8B82BCB6A19BBA9D95B5ADA4ADA19993938F8B0000000000
          00938F8BDFDAD5F2EEEAD6CFC9D1CAC3C4BCB6BCB5AFAAC5A5A8CBA68AD0CAAE
          BBB39D95B5938F8B000000000000000000938F8BC2BCB6F4F0ECF2EEEADBD5CF
          D1CAC3CCC4BDC0CAB6A3D4A5B2C0B88AD0CAAEA69E938F8B0000000000000000
          00000000938F8BC2BCB6DFDAD5F0EEEBE1DCD7DAD6D1DAD4CFC0CAB6A3D4A5B8
          B1A9938F8B000000000000000000000000000000000000938F8B938F8BB0ACA6
          C2BCB6D6CFC9C5BEB8BBB4AE938F8B938F8B0000000000000000000000000000
          00000000000000000000000000938F8B938F8B938F8B938F8B938F8B00000000
          0000000000000000000000000000FFFF0000F83F0000E00F0000C00700008003
          0000800300000001000003810000038100000381000000010000800300008003
          0000C0070000E00F0000F83F0000280000001000000020000000010020000000
          0000400000000000000000000000000000000000000000000000000000000000
          000000000000938F8B0C938F8B21938F8B36938F8B36938F8B36938F8B36938F
          8B27938F8B090000000000000000000000000000000000000000000000000000
          0000938F8B3C938F8B8F938F8BFF938F8BFF938F8BFF938F8BFF938F8BFF938F
          8BAE938F8B3C938F8B260000000000000000000000000000000000000000938F
          8B1A938F8BFF938F8BFFA19993FFA89F97FFA79E94FF9F968DFF9B948DFF938F
          8BFF938F8BFF938F8B49938F8B26000000000000000000000000938F8B1A938F
          8BFFA59D96FF99C999FFA8B19CFFADA39AFFADA39AFFA79E94FFA2988EFFA298
          8EFF9B9289FF938F8BFF938F8B49938F8B26938F8B0F938F8B0A938F8BFFACA5
          9EFF85CCC6FFA9B6ADFF99C999FFA8B19CFFADA39AFFADA39AFFA79E94FFA298
          8EFFA2988EFF9B9289FF938F8BFF938F8B3C938F8B18938F8B4D938F8BFF948F
          CAFFB2C0B8FF85CCC6FFA1C39DFFA3BD9CFFB2A9A0FFADA39AFFADA39AFFA79E
          94FFA79E94FFA2988EFF938F8BFF938F8B9D938F8B2E938F8BFFB0ACA6FFBBB4
          BEFF9993CFFF9C96C5FF80B7B3FF938F8BFF938F8BFF938F8BFF9E968EFFADA3
          9AFFA79E94FFA79E94FF9B948DFF938F8BFF938F8B2E938F8BFFBEB8B1FFD8D1
          CAFFBBB4BEFFAAA3BEFF938F8BFF938F8B54938F8B0A938F8B54938F8BFFABA2
          9AFFADA39AFFA79E94FFA39B92FF938F8BFF938F8B2E938F8BFFD1CAC3FFDBD5
          CFFFCCC4BDFFB8B1A9FF938F8BFF938F8B0900000000938F8B0A938F8BFFA49C
          94FFB2A9A0FFADA39AFFA79E94FF938F8BFF938F8B2E938F8BFFC2BCB6FFDFDA
          D5FFD1CAC3FFC4BCB6FF938F8BFF938F8B54938F8B0A938F8B43938F8BFF9D96
          B0FFADA4ADFFB2A9A0FFA89F97FF938F8BFF938F8B2E938F8BFFB0ACA6FFE7E2
          DDFFDBD5CFFFD1CAC3FFB5AEA8FF938F8BFF938F8BFF938F8BFF82BCB6FFA19B
          BAFF9D95B5FFADA4ADFFA19993FF938F8BFF938F8B18938F8B4E938F8BFFDFDA
          D5FFF2EEEAFFD6CFC9FFD1CAC3FFC4BCB6FFBCB5AFFFAAC5A5FFA8CBA6FF8AD0
          CAFFAEBBB3FF9D95B5FF938F8BFF938F8B80938F8B17938F8B0A938F8BFFC2BC
          B6FFF4F0ECFFF2EEEAFFDBD5CFFFD1CAC3FFCCC4BDFFC0CAB6FFA3D4A5FFB2C0
          B8FF8AD0CAFFAEA69EFF938F8BFF938F8B1A938F8B11938F8B05938F8B1A938F
          8BFFC2BCB6FFDFDAD5FFF0EEEBFFE1DCD7FFDAD6D1FFDAD4CFFFC0CAB6FFA3D4
          A5FFB8B1A9FF938F8BFF938F8B1A938F8B05938F8B05938F8B05938F8B05938F
          8B1A938F8BFF938F8BFFB0ACA6FFC2BCB6FFD6CFC9FFC5BEB8FFBBB4AEFF938F
          8BFF938F8BFF938F8B1A938F8B05938F8B05938F8B05938F8B05938F8B05938F
          8B05938F8B0A938F8B25938F8BFF938F8BFF938F8BFF938F8BFF938F8BFF938F
          8B5E938F8B0A938F8B05938F8B05938F8B05938F8B05F00F8B05E0078B05C003
          8B0580008B0500008B0500008B0500008B0500008B0501008B0500008B050000
          8B0500008B0500008B0500008B0500008B0500008B05}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          00000000000000000000000000000003B3B3B3B3B0000B0B3B3B3B3B3B000B03
          B3B3B3B3B3000B0B3B3B3B3B3B000B03B3B3B3B3B3000BB0388888888B300BB0
          B8FFFFFF83B00BBB08FF2FFF80000BBBB8F222FF800000BBB8A2F22F80000000
          08AFFF2A8000000008FFFFFA800000000888888880000000000000000000FFFF
          0000800300000003000000010000000100000001000000010000000000000000
          0000000100000007000080070000C0070000F8070000F8070000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000A9DA00A3D200
          A3D2009DCA009DCA0097C80097C80097C8008FBE008FBE008FBE008CBA000000
          00000000000000A9DA00B4E82DD0FF7BE1FF5FDBFF5FDBFF5FDBFF5FDBFF5FDB
          FF5FDBFF5FDBFF5FDBFF03C7FF00A6D600000000000000A9DA35D2FF00B4E87F
          E2FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF1BCCFF00C4FC
          00A8D800000000A9DA53D9FF00A9DA75E0FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1
          FF7BE1FF7BE1FF7BE1FF2BD0FF0FC9FF00A8D800000000A9DA7DE2FF00A9DA71
          DFFFABECFF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF33D1FF2BD0FF
          00A8D800000000AEE08BE5FF00B4E857D9FFC5F3FFADEFFFABECFFABECFF97E8
          FF97E8FF97E8FF97E8FF25CEFF4BD7FF00A8D800A8D800AEE097E8FF4DD7FF00
          B4E897E8FFC2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C297E8FF
          29CFFF00A8D800AEE0A7EDFF8BE5FF00A9DA41D5FFC2C2C2FFFFFFFFFFFFE4F8
          EAFFFFFFFFFFFFFFFFFFC2C2C27FE2FF33D1FF00A8D800AEE0C7F4FFBFF1FF85
          E4FF00BCF2C2C2C2FFFFFFE4F8EA00B93DE4F8EAFFFFFFFFFFFFC2C2C200A6D6
          00A6D600000000AEE081E3FFE3F9FFE3F9FFD3F6FFC2C2C2E4F8EA00C84200B9
          3D00B93DE4F8EAFFFFFFC2C2C200000000000000000000000000AEE089E5FFEF
          FDFFE3F9FFC2C2C2CCF1D800D045FFFFFF00B93D00B93DE4F8EAC2C2C2000000
          00000000000000000000000000AEE000AEE000AEE0C2C2C2CCF1D8FFFFFFFFFF
          FFFFFFFF00B93DB6EBC8C2C2C200000000000000000000000000000000000000
          0000000000C2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6EBC8C2C2C2000000
          000000000000000000000000000000000000000000C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2C2C2C2C2C2C2C2C2C2C200000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF000080070000000300000001000000010000000100000000
          00000000000000000000000100000007000080070000C0070000F8070000F807
          0000FFFF00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000403090B04030924040309310403
          0931040309310403093104030931040309310403093104030931040309310403
          09310403091E00000000000000000403090800A9DAF500A3D2FF00A3D2FF009D
          CAFF009DCAFF0097C8FF0097C8FF0097C8FF008FBEFF008FBEFF008FBEFF008C
          BAFF00A8D8FD004556210000000000A9DAF500B4E8F52DD0FFFB7BE1FFFF5FDB
          FFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF03C7
          FFFF00A6D6FF004C627B00161C0900A9DAF535D2FFFB00B4E8F57FE2FFFE7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF1BCC
          FFFF00C4FCFF008FB8CE002A342200A9DAF553D9FFFD00A9DAF575E0FFFD7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF2BD0
          FFFF0FC9FFFF00A8D8E10045564800A9DAF57DE2FFFF00A9DAF571DFFFFDABEC
          FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF33D1
          FFFF2BD0FFFF00A8D8EA005B725E00AEE0F58BE5FFFF00B4E8F557D9FFFBC5F3
          FFFFADEFFFFFABECFFFFABECFFFF97E8FFFF97E8FFFF97E8FFFF97E8FFFF25CE
          FFFF4BD7FFFF00A8D8FD0076988F00AEE0F597E8FFFF4DD7FFFB00B4E8F597E8
          FFFFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FF97E8FFFF29CFFFFF008FB8E600AEE0F5A7EDFFFF8BE5FFFD00A9DAF541D5
          FFFFC2C2C2FFFFFFFFFFFFFFFFFFE4F8EAFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2
          C2FF7FE2FFFF33D1FFFF00A8D8FD00AEE0F5C7F4FFFFBFF1FFFE85E4FFFF00BC
          F2FFC2C2C2FFFFFFFFFFE4F8EAFF00B93DFFE4F8EAFFFFFFFFFFFFFFFFFFC2C2
          C2FF00A6D6FF00A6D6FF00A9DA4B00AEE0F581E3FFFFE3F9FFFFE3F9FFFFD3F6
          FFFFC2C2C2FFE4F8EAFF00C842FF00B93DFF00B93DFFE4F8EAFFFFFFFFFFC2C2
          C2FF0403094504030918000000000403091C00AEE0FF89E5FFFFEFFDFFFFE3F9
          FFFFC2C2C2FFCCF1D8FF00D045FFFFFFFFFF00B93DFF00B93DFFE4F8EAFFC2C2
          C2FF040309160000000000000000000000000403091B00AEE0FF00AEE0FF00AE
          E0FFC2C2C2FFCCF1D8FFFFFFFFFFFFFFFFFFFFFFFFFF00B93DFFB6EBC8FFC2C2
          C2FF00000000000000000000000000000000040309040403090B0403090B0403
          090BC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6EBC8FFC2C2
          C2FF000000000000000000000000000000000000000000000000000000000000
          0000C2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000800300000001000000000000000000000000
          0000000000000000000000000000000000000000000000010000000300008007
          000080070000F8070000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          00000000000000000000000000000B03B3B3B3B3B3000B0B3B3B3B3B3B000B03
          0303030303000B0B3BFBFBFB3B000B030FBFBFBF03000B0B3BFBFBFB3B000B03
          0FBFBFBF03000BB00000000000000BBB0FFFFFFF000000BB0FFFFFF700000000
          0FFFFF08000000000FFFFF70000000000000000000000000000000000000FFFF
          0000800300000001000000010000000100000001000000010000000100000001
          0000000300000007000080070000C0070000F00F0000F01F0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000009DD0009ACC00
          9ACC0094C40094C4008EC2008EC2008EC20086B80086B80083B40083B40083B4
          00000000000000A0D45DD7FF00A4DA75DDFF59D6FF59D6FF59D6FF59D6FF59D6
          FF59D6FF59D6FF37CEFF0FC9FF59D6FF0083B400000000A0D46BDAFF00AAE285
          E1FF75DAFA75D9F976D7F576D6F376D6F376D6F376D6F35BCFF306BCEE5AD4FB
          0083B400000000A0D46BDAFF00AAE285E1FFC1C18CB9BB86B9BB86B9BB86B9BB
          86B9BB86B9BB86ABB786ABB7865BCFF30083B400000000A0D477DDFF00ADE691
          E4FFC1D0B6C0DFDEB9D9D8B9D8D5B9D6D2B9D6D2B9D5D0B9D4CDB9C7A976D6F3
          0088BA00000000A4DA85E1FF00AFE8A3E8FFD0D4B8C0E0E1C0E0E1C0DFDEB9D8
          D5B9D8D5B9D6D2B9D5D0B9C7A985DAF30094C400000000A4DA91E4FF00B2ECB1
          ECFFD0D4B8D0E5E4D0E4E1C0DFDEC0DFDEC0DEDBB9D6D2B9D6D2B9C8AB90DDF3
          0095C600000000A4DAA1EAFF00B2EC5DD7FFD7D8BAD0E8E9D0E7E6D0E5E4C0E1
          E4C0E0E1C0DFDEB9D9D8B9C9AD81D9F3009DD000000000A4DAC1F1FF99E8FF00
          B2EC00B2EC00B2EC00B2EC00B2EC00B2EC00B2EC00B2EC00B2EC00B2EC069AC8
          00000000000000A4DA7BDEFFDDF7FFDDF7FFFFC679FFF5ECFFF5ECFFF4E9FFF2
          E6FFF2E6FFF1E4FFEFE1FFBF6B00000000000000000000000000A4DA83E0FFE9
          FBFFFFC679FFF5ECFFF5ECFFF4E9FFF2E6FFF2E6FFF1E4FFEFE1FFBF6B000000
          00000000000000000000000000A4DA00A4DAFFC97FFFF8F2FFF8F2FFF7EFFFF5
          ECFFF5ECFAB860F5BD83F6B67700000000000000000000000000000000000000
          0000FFC97FFFFAF5FFF8F2FFF7EFFFF7EFFFF5ECFABA63FDE7D2FFC472000000
          000000000000000000000000000000000000FFCB82FFC97FFFC87CFFC87CFFC6
          79FEC679FFC576FFBF6B00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF000080030000000100000001000000010000000100000001
          00000001000000010000000300000007000080070000C0070000F0070000F00F
          0000FFFF00002800000010000000200000000100200000000000400000000000
          00000000000000000000000000000000000000000000020204290202042C0202
          042C0202042C0202042C0202042C0202042C0202042C0202042C0202042C0202
          042C0202042C0202040D0000000000000000009DD0FF009ACCFF009ACCFF0094
          C4FF0094C4FF008EC2FF008EC2FF008EC2FF0086B8FF0086B8FF0083B4FF0083
          B4FF0083B4FF0202042C0202041300A0D4D75DD7FFFF00A4DAFF75DDFFFF59D6
          FFFF59D6FFFF59D6FFFF59D6FFFF59D6FFFF59D6FFFF59D6FFFF37CEFFFF0FC9
          FFFF59D6FFFF0083B4FF0202042C00A0D4EB6BDAFFFF00AAE2FF85E1FFFF75DA
          FAF375D9F9F176D7F5E976D6F3E876D6F3E876D6F3E876D6F3E85BCFF3E806BC
          EEE85AD4FBF50083B4FF0202042C00A0D4EB6BDAFFFF00AAE2FF85E1FFFFC1C1
          8CFFB9BB86F3B9BB86F3B9BB86F3B9BB86F3B9BB86F3B9BB86F3ABB786F3ABB7
          86F35BCFF3E80083B4FF0202042C00A0D4EB77DDFFFF00ADE6FF91E4FFFFC1D0
          B6FFC0DFDEFFB9D9D8F3B9D8D5F3B9D6D2F3B9D6D2F3B9D5D0F3B9D4CDF3B9C7
          A9F376D6F3E80088BAFF0202042C00A4DAEB85E1FFFF00AFE8FFA3E8FFFFD0D4
          B8FFC0E0E1FFC0E0E1FFC0DFDEFFB9D8D5F3B9D8D5F3B9D6D2F3B9D5D0F3B9C7
          A9F385DAF3E80094C4FF0202042C00A4DAEB91E4FFFF00B2ECFFB1ECFFFFD0D4
          B8FFD0E5E4FFD0E4E1FFC0DFDEFFC0DFDEFFC0DEDBFFB9D6D2F3B9D6D2F3B9C8
          ABF390DDF3E80095C6FF0202041B00A4DAEBA1EAFFFF00B2ECFF5DD7FFFFD7D8
          BAFFD0E8E9FFD0E7E6FFD0E5E4FFC0E1E4FFC0E0E1FFC0DFDEFFB9D9D8F3B9C9
          ADF381D9F3E8009DD0FF0202040100A4DAEBC1F1FFFF99E8FFFF00B2ECFF00B2
          ECFF00B2ECFF00B2ECFF00B2ECFF00B2ECFF00B2ECFF00B2ECFF00B2ECFF00B2
          ECFF069AC8E90012160C0000000000A4DAEB7BDEFFFFDDF7FFFFDDF7FFFFFFC6
          79FFFFF5ECFFFFF5ECFFFFF4E9FFFFF2E6FFFFF2E6FFFFF1E4FFFFEFE1FFFFBF
          6BDA0604052600000000000000000202040300A4DAFF83E0FFFFE9FBFFFFFFC6
          79FFFFF5ECFFFFF5ECFFFFF4E9FFFFF2E6FFFFF2E6FFFFF1E4FFFFEFE1FFFFBF
          6BBA0000001B0000000000000000000000000202040300A4DAFF00A4DAFFFFC9
          7FE2FFF8F2FFFFF8F2FFFFF7EFFFFFF5ECFFFFF5ECFFFAB860FFF5BD83FFF6B6
          77BA00000019000000000000000000000000000000000000000000000000FFC9
          7FDAFFFAF5FFFFF8F2FFFFF7EFFFFFF7EFFFFFF5ECFFFABA63FDFDE7D2FFFFC4
          72A00000001300000000000000000000000000000000000000007A5F3A01FFCB
          823DFFC97FBAFFC87CBAFFC87CBAFFC679BAFEC679B9FFC576BAFFBF6B940000
          0005000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000C00100008000000000000000000000000000
          0000000000000000000000000000000000000001000000030000000300008003
          0000F0030000E0070000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          00000000000000000000000000000003B3B3B3B3B0000B0B3B3B3B3B3B000B03
          B3B3B3B3B3000B0B3B3B3B3B3B000B03B3B3B3B3B3000BB03B3B3B3B3B300BB0
          B3B3B3B3B3B00BBB0000000090000BBBBBBBBB9B909000BBBBB0000999000000
          00000999B999000000000009990000000000009090900000000000009000FFFF
          0000800300000003000000010000000100000001000000010000000000000000
          0000000100000005000080030000C1800000FFE30000FFD50000FFF700002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000A9DA00A3D200
          A3D2009DCA009DCA0097C80097C80097C8008FBE008FBE008FBE008CBA000000
          00000000000000A9DA00B4E82DD0FF7BE1FF5FDBFF5FDBFF5FDBFF5FDBFF5FDB
          FF5FDBFF5FDBFF5FDBFF03C7FF00A6D600000000000000A9DA35D2FF00B4E87F
          E2FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF1BCCFF00C4FC
          00A8D800000000A9DA53D9FF00A9DA75E0FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1
          FF7BE1FF7BE1FF7BE1FF2BD0FF0FC9FF00A8D800000000A9DA7DE2FF00A9DA71
          DFFFABECFF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF8BE5FF33D1FF2BD0FF
          00A8D800000000AEE08BE5FF00B4E857D9FFC5F3FFADEFFFABECFFABECFF97E8
          FF97E8FF97E8FF97E8FF25CEFF4BD7FF00A8D800A8D800AEE097E8FF4DD7FF00
          B4E897E8FFC7F2FFC7F2FFC5F2FFC5F2FFAFEDFFAFEDFFAFEDFF2BD0FF97E8FF
          29CFFF00A8D800AEE0A7EDFF8BE5FF00A9DA41D5FF71DFFFB7EFFFB7EFFFB7EF
          FFB7EFFFB7EFFFB7EFFF2FD1FF7FE2FF33D1FF00A8D800AEE0C7F4FFBFF1FF85
          E4FF00BCF200B7EC00B7EC00B6EA00B6EA00B1E400B1E400B1E40000FF00A6D6
          00A6D600000000AEE081E3FFE3F9FFE3F9FFD3F6FFD3F6FFD3F6FFD3F6FFD3F6
          FFD3F6FF0000FFC5F3FF0000FF0000000000FF00000000000000AEE089E5FFEF
          FDFFE3F9FFE3F9FF81E3FF00AEE000AEE000AEE000A9DA005CFF00E9FF004DFF
          00000000000000000000000000AEE000AEE000AEE000A9DA00A9DA0000000000
          000000FF0000FF00E9FF00FFFF00E9FF0000FF0000FF00000000000000000000
          0000000000000000000000000000000000000000000000006AFF00E9FF006AFF
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FF0000000000FF0000000000FF00000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FF000000
          000000000000FFFF000080070000000300000001000000010000000100000000
          00000000000000000000000100000005000080030000C1800000FFE30000FFD5
          0000FFF700002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000004030905040309090403
          0909040309090403090904030909040309090403090904030909040309090403
          09080403090400000000000000000000000000A9DAEB00A3D2FF00A3D2FF009D
          CAFF009DCAFF0097C8FF0097C8FF0097C8FF008FBEFF008FBEFF008FBEFF008C
          BAEE00A8D8B0004556040000000000A9DAEB00B4E8EB2DD0FFF77BE1FFFF5FDB
          FFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF03C7
          FFFF00A6D6EE004C623B0000000000A9DAEB35D2FFF700B4E8EB7FE2FFFD7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF1BCC
          FFFF00C4FCFF008FB8A6002A340500A9DAEB53D9FFFB00A9DAEB75E0FFFB7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF2BD0
          FFFF0FC9FFFF00A8D8C70045561400A9DAEB7DE2FFFF00A9DAEB71DFFFFBABEC
          FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF33D1
          FFFF2BD0FFFF00A8D8D7005B722300AEE0EB8BE5FFFF00B4E8EB57D9FFF7C5F3
          FFFFADEFFFFFABECFFFFABECFFFF97E8FFFF97E8FFFF97E8FFFF97E8FFFF25CE
          FFFF4BD7FFFF00A8D8FB0076985000AEE0EB97E8FFFF4DD7FFF700B4E8EB97E8
          FFFFC7F2FFFFC7F2FFFFC5F2FFFFC5F2FFFFAFEDFFFFAFEDFFFFAFEDFFFF2BD0
          FFFF97E8FFFF29CFFFFF008FB8CF00AEE0EBA7EDFFFF8BE5FFFB00A9DAEB41D5
          FFFF71DFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFF2FD1
          FFFF7FE2FFFF33D1FFFF00A8D8FB00AEE0EBC7F4FFFFBFF1FFFD85E4FFFF00BC
          F2FF00B7ECFF00B7ECFF00B6EAFF00B6EAFF00B1E4FF00A5D5FF0099C6FF0028
          F5FF008BB3FF008FB9E100A9DA1600AEE0EB81E3FFFFE3F9FFFFE3F9FFFFD3F6
          FFFFD3F6FFFFD3F6FFFFD3F6FFFFD3F6FFFFC5E6EEFF0000FFFFA0C5FFFF0000
          FFFF030237350000FFFF000000240403090300AEE0FF89E5FFFFEFFDFFFFE3F9
          FFFFE3F9FFFF81E3FFFF00AEE0FF00AEE0FF00A4D3F10089E1D8005CFFFF00E9
          FFFF004DFFFF0000FF4300000030000000000403090300AEE0FF00AEE0FF00AE
          E0FF00A9DAFF00A9DAFF04030905000000000000FF920000FFFF00E9FFFF00FF
          FFFF00E9FFFF0000FFFF0000FFA8000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000FF40006AFFFF00E9
          FFFF006AFFFF0000FF3600000026000000000000000000000000000000000000
          000000000000000000000000000000000000000000010000FFFF0000FF3C0000
          FFFF0000FF3E0000FFFF00000015000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000001000000000000
          FFA8000000240000000100000000C00300008001000000010000000000000000
          0000000000000000000000000000000000000000000000000000000000008080
          0000FFC00000FF800000FFD10000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          000000000000000000000000000000000000000000000B03B3B3B3B3B3000B0B
          3B3B3B3B3B000B03B3B3B3B3B3000B0B3B3B3B3B3B000B03B3B3B3B3B3000B0B
          3B3B3B3B3B000B03B3B3B3B3B3000BB00000000000000BBBBBBBBBBB000000BB
          BBB000000000000000000000000000000000000000000000000000000000FFFF
          0000FFFF00008003000000010000000100000001000000010000000100000001
          0000000100000003000000070000800F0000C1FF0000FFFF0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000009DD0009ACC009ACC0094C40094C4008EC2008EC2008E
          C20086B80086B80083B40083B40083B400000000000000A0D45DD7FF00A4DA75
          DDFF59D6FF59D6FF59D6FF59D6FF59D6FF59D6FF59D6FF37CEFF0FC9FF59D6FF
          0083B400000000A0D46BDAFF00AAE285E1FF75DDFF75DDFF75DDFF75DDFF75DD
          FF75DDFF75DDFF59D6FF00C2FA59D6FF0083B400000000A0D46BDAFF00AAE285
          E1FF75DDFF75DDFF75DDFF75DDFF75DDFF75DDFF75DDFF59D6FF00C2FA59D6FF
          0083B400000000A0D477DDFF00ADE691E4FFA5E9FF85E1FF85E1FF85E1FF85E1
          FF85E1FF85E1FF75DDFF00C5FE75DDFF0088BA00000000A4DA85E1FF00AFE8A3
          E8FFBFF1FFA7EBFFA5E9FFA5E9FF91E4FF91E4FF91E4FF85E1FF03C7FF85E1FF
          0094C400000000A4DA91E4FF00B2ECB1ECFFC1F0FFC1F0FFC1F0FFBFEFFFBFEF
          FFA9EAFFA9EAFF91E4FF05C7FF91E4FF0095C600000000A4DAA1EAFF00B2EC5D
          D7FFB1ECFFB1ECFFB1ECFFB1ECFFB1ECFFB1ECFFB1ECFFA3E8FF37D2FF81E0FF
          009DD000000000A4DAC1F1FF99E8FF00B2EC00B2EC00ADE600ADE600ACE400AC
          E400A7DE00A7DE009DD0009DD0009DD000000000000000A4DA7BDEFFDDF7FFDD
          F7FFCDF4FFCDF4FFCDF4FFCDF4FFCDF4FFCDF4FFCDF4FFBFF1FF00A0D4000000
          00000000000000000000A4DA83E0FFE9FBFFDDF7FFDDF7FF7BDEFF00A4DA00A4
          DA00A4DA00A0D400A0D400000000000000000000000000000000000000A4DA00
          A4DA00A4DA00A0D400A0D4000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000FFFF0000800300000001000000010000000100000001
          00000001000000010000000100000003000000070000800F0000C1FF0000FFFF
          0000FFFF00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000202040B02020424020204310202
          0431020204310202043102020431020204310202043102020431020204310202
          043102020431020204140000000002020408009DD0FF009ACCFF009ACCFF0094
          C4FF0094C4FF008EC2FF008EC2FF008EC2FF0086B8FF0086B8FF0083B4FF0083
          B4FF0083B4FF020204310202041B00A0D4EA5DD7FFFF00A4DAFF75DDFFFF59D6
          FFFF59D6FFFF59D6FFFF59D6FFFF59D6FFFF59D6FFFF59D6FFFF37CEFFFF0FC9
          FFFF59D6FFFF0083B4FF0202043100A0D4F56BDAFFFF00AAE2FF85E1FFFF75DD
          FFFF75DDFFFF75DDFFFF75DDFFFF75DDFFFF75DDFFFF75DDFFFF59D6FFFF00C2
          FAFF59D6FFFF0083B4FF0202043100A0D4F56BDAFFFF00AAE2FF85E1FFFF75DD
          FFFF75DDFFFF75DDFFFF75DDFFFF75DDFFFF75DDFFFF75DDFFFF59D6FFFF00C2
          FAFF59D6FFFF0083B4FF0202043100A0D4F577DDFFFF00ADE6FF91E4FFFFA5E9
          FFFF85E1FFFF85E1FFFF85E1FFFF85E1FFFF85E1FFFF85E1FFFF75DDFFFF00C5
          FEFF75DDFFFF0088BAFF0202043100A4DAF585E1FFFF00AFE8FFA3E8FFFFBFF1
          FFFFA7EBFFFFA5E9FFFFA5E9FFFF91E4FFFF91E4FFFF91E4FFFF85E1FFFF03C7
          FFFF85E1FFFF0094C4FF0202043100A4DAF591E4FFFF00B2ECFFB1ECFFFFC1F0
          FFFFC1F0FFFFC1F0FFFFBFEFFFFFBFEFFFFFA9EAFFFFA9EAFFFF91E4FFFF05C7
          FFFF91E4FFFF0095C6FF0202043100A4DAF5A1EAFFFF00B2ECFF5DD7FFFFB1EC
          FFFFB1ECFFFFB1ECFFFFB1ECFFFFB1ECFFFFB1ECFFFFB1ECFFFFA3E8FFFF37D2
          FFFF81E0FFFF009DD0FF0202040F00A4DAF5C1F1FFFF99E8FFFF00B2ECFF00B2
          ECFF00ADE6FF00ADE6FF00ACE4FF00ACE4FF00A7DEFF00A7DEFF009DD0FF009D
          D0FF009DD0FF001216370202040200A4DAF57BDEFFFFDDF7FFFFDDF7FFFFCDF4
          FFFFCDF4FFFFCDF4FFFFCDF4FFFFCDF4FFFFCDF4FFFFCDF4FFFFBFF1FFFF00A0
          D4FF0202042400000000000000000202041C00A4DAFF83E0FFFFE9FBFFFFDDF7
          FFFFDDF7FFFF7BDEFFFF00A4DAFF00A4DAFF00A4DAFF00A0D4FF00A0D4FF0202
          0424000000000000000000000000000000000202041B00A4DAFF00A4DAFF00A4
          DAFF00A0D4FF00A0D4FF02020424000000000000000000000000000000000000
          000000000000000000000000000000000000020204040202040B0202040B0202
          040B0202040B0202040B02020404000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008001000000000000000000000000
          0000000000000000000000000000000000000000000000000000000300000007
          000080FF000080FF0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          000000000000000000000000000000000000000000000003B3B3B3B3B0000B0B
          3B3B3B3B3B000B03B3B3B3B3B3000B0B3B3B3B3B3B000B03B3B3B3B3B3000BB0
          3B3B3B3B3B300BB0B3B3B3B3B3B00BBB0000000000000BBBBBBBBBBB000000BB
          BBB000000000000000000000000000000000000000000000000000000000FFFF
          0000FFFF00008003000000030000000100000001000000010000000100000000
          0000000000000001000000070000800F0000C1FF0000FFFF0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000A9DA00A3D200A3D2009DCA009DCA0097C80097C80097
          C8008FBE008FBE008FBE008CBA00000000000000000000A9DA00B4E82DD0FF7B
          E1FF5FDBFF5FDBFF5FDBFF5FDBFF5FDBFF5FDBFF5FDBFF5FDBFF03C7FF00A6D6
          00000000000000A9DA35D2FF00B4E87FE2FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1
          FF7BE1FF7BE1FF7BE1FF1BCCFF00C4FC00A8D800000000A9DA53D9FF00A9DA75
          E0FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF7BE1FF2BD0FF0FC9FF
          00A8D800000000A9DA7DE2FF00A9DA71DFFFABECFF8BE5FF8BE5FF8BE5FF8BE5
          FF8BE5FF8BE5FF8BE5FF33D1FF2BD0FF00A8D800000000AEE08BE5FF00B4E857
          D9FFC5F3FFADEFFFABECFFABECFF97E8FF97E8FF97E8FF97E8FF25CEFF4BD7FF
          00A8D800A8D800AEE097E8FF4DD7FF00B4E897E8FFC7F2FFC7F2FFC5F2FFC5F2
          FFAFEDFFAFEDFFAFEDFF2BD0FF97E8FF29CFFF00A8D800AEE0A7EDFF8BE5FF00
          A9DA41D5FF71DFFFB7EFFFB7EFFFB7EFFFB7EFFFB7EFFFB7EFFF2FD1FF7FE2FF
          33D1FF00A8D800AEE0C7F4FFBFF1FF85E4FF00BCF200B7EC00B7EC00B6EA00B6
          EA00B1E400B1E400B1E400A6D600A6D600A6D600000000AEE081E3FFE3F9FFE3
          F9FFD3F6FFD3F6FFD3F6FFD3F6FFD3F6FFD3F6FFD3F6FFC5F3FF00A9DA000000
          00000000000000000000AEE089E5FFEFFDFFE3F9FFE3F9FF81E3FF00AEE000AE
          E000AEE000A9DA00A9DA00000000000000000000000000000000000000AEE000
          AEE000AEE000A9DA00A9DA000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000FFFF0000800700000003000000010000000100000001
          00000000000000000000000000000001000000070000800F0000C1FF0000FFFF
          0000FFFF00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000403090B04030924040309310403
          0931040309310403093104030931040309310403093104030931040309310403
          09310403091E00000000000000000403090800A9DAF500A3D2FF00A3D2FF009D
          CAFF009DCAFF0097C8FF0097C8FF0097C8FF008FBEFF008FBEFF008FBEFF008C
          BAFF00A8D8FD004556210000000000A9DAF500B4E8F52DD0FFFB7BE1FFFF5FDB
          FFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF5FDBFFFF03C7
          FFFF00A6D6FF004C627B00161C0900A9DAF535D2FFFB00B4E8F57FE2FFFE7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF1BCC
          FFFF00C4FCFF008FB8CE002A342200A9DAF553D9FFFD00A9DAF575E0FFFD7BE1
          FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF7BE1FFFF2BD0
          FFFF0FC9FFFF00A8D8E10045564800A9DAF57DE2FFFF00A9DAF571DFFFFDABEC
          FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF8BE5FFFF33D1
          FFFF2BD0FFFF00A8D8EA005B725E00AEE0F58BE5FFFF00B4E8F557D9FFFBC5F3
          FFFFADEFFFFFABECFFFFABECFFFF97E8FFFF97E8FFFF97E8FFFF97E8FFFF25CE
          FFFF4BD7FFFF00A8D8FD0076988F00AEE0F597E8FFFF4DD7FFFB00B4E8F597E8
          FFFFC7F2FFFFC7F2FFFFC5F2FFFFC5F2FFFFAFEDFFFFAFEDFFFFAFEDFFFF2BD0
          FFFF97E8FFFF29CFFFFF008FB8E600AEE0F5A7EDFFFF8BE5FFFD00A9DAF541D5
          FFFF71DFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFFB7EFFFFF2FD1
          FFFF7FE2FFFF33D1FFFF00A8D8FD00AEE0F5C7F4FFFFBFF1FFFE85E4FFFF00BC
          F2FF00B7ECFF00B7ECFF00B6EAFF00B6EAFF00B1E4FF00B1E4FF00B1E4FF00A6
          D6FF00A6D6FF00A6D6FF00A9DA4B00AEE0F581E3FFFFE3F9FFFFE3F9FFFFD3F6
          FFFFD3F6FFFFD3F6FFFFD3F6FFFFD3F6FFFFD3F6FFFFD3F6FFFFC5F3FFFF00A9
          DAFF0403094504030918000000000403091C00AEE0FF89E5FFFFEFFDFFFFE3F9
          FFFFE3F9FFFF81E3FFFF00AEE0FF00AEE0FF00AEE0FF00A9DAFF00A9DAFF0403
          0939040309160000000000000000000000000403091B00AEE0FF00AEE0FF00AE
          E0FF00A9DAFF00A9DAFF04030924000000000000000000000000000000000000
          000000000000000000000000000000000000040309040403090B0403090B0403
          090B0403090B0403090B04030904000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008003000000010000000000000000
          0000000000000000000000000000000000000000000000000000000100000003
          000080FF000080FF0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          0000000000000000000000000000003077800000030003307780000003000330
          7780000003000330778000000300033000000000030003333333333333000330
          000000003300030FFFFFFFFF0300030FFFFFFFFF0300030F4444444F0300030F
          FFFFFFFF0300030F4444444F0000030FFFFFFFFF07000000000000000000FFFF
          0000C00100008001000000010000000100000001000000010000000100000001
          0000000100000001000000010000000100000001000000010000000100002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000BD4360C1
          A3ACC8909ED596A6E09CACDFCED3DBC9CED7C3C8BD425FBD425FAA3350BD425F
          000000000000000000BF4966D6607CC9AFB6D0627CCD7388D5A3B0EEE4E8DFCE
          D3DBC9CED35371D35371AA3350D35371BD425F000000C85472D35476D76480CF
          B7C0D1647FCD7087C8909ED6C2C9EEE4E8DFCED3D35371D35371AA3350D35371
          BD425F000000CC5A78CC486AD35476D2BCC3D26680CF758BC68C9BC4A8B0D6C2
          C9EEE4E8D35371D35371AA3350D35371BD425F000000CA5A77C2345BCC486AD7
          B8C1D26781D2788ECC95A3C1A3ACC4A8B0D6C2C9D35371C33F5EAA3350D35371
          BD425F000000CB5A78B63052C2345BE792A6D7B8C1D2ABB5D099A8C9AFB6C1A3
          ACCA9EAAB83455B83455BB3859D35371BD425F000000CC5B78BF3558B63052C4
          385ECC486AD55C79DA7089D76480D45674D35371D35371D35371D35371D35371
          BD425F000000CC5C79C1385ADBA8B7E8DCE2E8DDE2E8DDE2E8DDE2E8DDE2E8DD
          E2E8DDE2E8DDE2E8DDE2E1B2BFD35371BD425F000000CE5E7AC33B5DE8DDE2F0
          E8ECF0E9ECF3EDEFF3EDEFF3EDEFF3EDEFF3EDEFF3EDEFF3EDEFE8DEE3D35371
          BD425F000000CE5F7BCB4767EFE9ECE193A5D96F88D96E88D86E87D86E87D86E
          87D86E87D86E87DE8FA3E8DEE3D35371BD425F000000CE5F7BD35371EFE9ECF3
          EEF0F1EBEFF1EAEEEFE8EBEFE8EBEFE8EBEFE8EBEFE8EBEFE8EBE8DEE3D35371
          BD425F000000CE5F7BD35371EFE9ECE092A5D96F88D96E88D96E88D96E88D96E
          88D96E88D96E88DF90A4E8DEE3D45674BD425F000000CE5F7BD35371EFE9ECF3
          EEF0F2EDEFF2EDEFF2EDEFF2EDEFF2EDEFF2EDEFF0EAEDF0E9ECE8DEE3D76480
          BD4360000000CE5F7BD35371EFE9ECE092A5D96F88D96F88D96F88D96F88D96F
          88D96F88D96F88E193A5E8DEE3DA7089BF4966000000CE5F7BCF647EF0EAEDF0
          EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDF0EAEDD06781
          CF6680000000FFFF7BCFC0037BCF80017BCF00017BCF00017BCF00017BCF0001
          7BCF00017BCF00017BCF00017BCF00017BCF00017BCF00017BCF00017BCF0001
          7BCF00017BCF2800000010000000200000000100200000000000400000000000
          00000000000000000000000000000000000000000007000000110000001F0000
          0021000000220000002200000022000000220000002200000027000000270000
          0024000000240000001B000000040000000000000017D45674E0C1A3ACEAC890
          9EF0D596A6F0E09CACF0DFCED3F0DBC9CEF0D7C3C8F0D35371F0D35371F0AA33
          50F0D35371EAD3537168000000170000000FD76480DED6607CFFC9AFB6FFD062
          7CFFCD7388FFD5A3B0FFEEE4E8FFDFCED3FFDBC9CEFFD35371FFD35371FFAA33
          50FFD35371FFD35371E50000001ECC486AE7D35476FFD76480FFCFB7C0FFD164
          7FFFCD7087FFC8909EFFD6C2C9FFEEE4E8FFDFCED3FFD35371FFD35371FFAA33
          50FFD35371FFD35371F200000022C2345BF1CC486AFFD35476FFD2BCC3FFD266
          80FFCF758BFFC68C9BFFC4A8B0FFD6C2C9FFEEE4E8FFD35371FFD35371FFAA33
          50FFD35371FFD35371F200000022B63052FFC2345BFFCC486AFFD7B8C1FFD267
          81FFD2788EFFCC95A3FFC1A3ACFFC4A8B0FFD6C2C9FFD35371FFC33F5EFFAA33
          50FFD35371FFD35371F200000022BF3558FFB63052FFC2345BFFE792A6FFD7B8
          C1FFD2ABB5FFD099A8FFC9AFB6FFC1A3ACFFCA9EAAFFB83455FFB83455FFBB38
          59FFD35371FFD35371F200000022C1385AFFBF3558FFB63052FFC4385EFFCC48
          6AFFD55C79FFDA7089FFD76480FFD45674FFD35371FFD35371FFD35371FFD353
          71FFD35371FFD35371F200000022C33B5DFFC1385AFFDBA8B7FFE8DCE2FFE8DD
          E2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE8DDE2FFE1B2
          BFFFD35371FFD35371F200000022CB4767FFC33B5DFFE8DDE2FFF0E8ECFFF0E9
          ECFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFF3EDEFFFE8DE
          E3FFD35371FFD35371F200000022D35371FFCB4767FFEFE9ECFFE193A5FFD96F
          88FFD96E88FFD86E87FFD86E87FFD86E87FFD86E87FFD86E87FFDE8FA3FFE8DE
          E3FFD35371FFD35371F200000022D35371FFD35371FFEFE9ECFFF3EEF0FFF1EB
          EFFFF1EAEEFFEFE8EBFFEFE8EBFFEFE8EBFFEFE8EBFFEFE8EBFFEFE8EBFFE8DE
          E3FFD35371FFD35371F200000022D35371FFD35371FFEFE9ECFFE092A5FFD96F
          88FFD96E88FFD96E88FFD96E88FFD96E88FFD96E88FFD96E88FFDF90A4FFE8DE
          E3FFD45674FFD35371F200000021D35371FFD35371FFEFE9ECFFF3EEF0FFF2ED
          EFFFF2EDEFFFF2EDEFFFF2EDEFFFF2EDEFFFF2EDEFFFF0EAEDFFF0E9ECFFE8DE
          E3FFD76480FFD45674F200000016D35371EFD35371FFEFE9ECFFE092A5FFD96F
          88FFD96F88FFD96F88FFD96F88FFD96F88FFD96F88FFD96F88FFE193A5FFE8DE
          E3FFDA7089FFD76480EA00000008D3537166D35371F1F0EAEDFFF0EAEDFFF0EA
          EDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EAEDFFF0EA
          EDFFD65E7AF3DA70895400000000800071668000716600007166000071660000
          7166000071660000716600007166000071660000716600007166000071660000
          7166000071660000716600017166}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          000001000C00101010000100040028010000C60000002020100001000400E802
          0000EE010000303010000100040068060000D604000010100000010008006805
          00003E0B00002020000001000800A8080000A61000003030000001000800A80E
          00004E190000101000000100180068030000F62700002020000001001800A80C
          00005E2B00003030000001001800A81C00000638000010100000010020006804
          0000AE5400002020000001002000A8100000165900003030000001002000A825
          0000BE6900002800000010000000200000000100040000000000C00000000000
          0000000000000000000000000000000000000000800000800000008080008000
          00008000800080800000C0C0C000808080000000FF0000FF000000FFFF00FF00
          0000FF00FF00FFFF0000FFFFFF00000000000000000008000000000000000877
          77777777700008FFFFFFFFFF700008FFFFFFFFFF700008FFFFFFFFFF700008FF
          FFFFFFFF700008FFFFFFFFFF700008FFFFFFFFF7700008FFFFFFFF88800008FF
          FFFFF800000008FFFFFFF8FFF00008FFFFFFF8FF000008FFFFFFF8F000000888
          8888880000000000000000000000FFFF00008003000080030000800300008003
          0000800300008003000080030000800300008003000080030000800300008007
          0000800F0000801F0000FFFF0000280000002000000040000000010004000000
          0000800200000000000000000000000000000000000000000000000080000080
          000000808000800000008000800080800000C0C0C000808080000000FF0000FF
          000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000800000000000000000000000000000008777777777777
          77777777000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFFF7000000000008FFFFFFFFFFFFFFFFFFF7000000000008FFFFFFFFFFFF
          FFFFFF77000000000008FFFFFFFFFFFFFFFF8888000000000008FFFFFFFFFFFF
          FFF80000000000000008FFFFFFFFFFFFFFF8FFF0000000000008FFFFFFFFFFFF
          FFF8FF00000000000008FFFFFFFFFFFFFFF8F000000000000008FFFFFFFFFFFF
          FFF8000000000000000888888888888888880000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
          FFFFFE000007FE000007FE000007FE000007FE000007FE000007FE000007FE00
          0007FE000007FE000007FE000007FE000007FE000007FE000007FE000007FE00
          0007FE000007FE000007FE000007FE000007FE000007FE000007FE00000FFE00
          001FFE00003FFE00007FFE0000FFFFFFFFFFFFFFFFFF28000000300000006000
          0000010004000000000000060000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000800000000000000000000000000000000000000000
          0000008777777777777777777777777777777777000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF700000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFFFF7777777000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFF888888888000000000000008FFFFFFFFFFFFFFFFFFFFFFFF8
          FFFFFFF7000000000000008FFFFFFFFFFFFFFFFFFFFFFFF8FFFFFF7000000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFF8FFFFF700000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFF8FFFF7000000000000000008FFFFFFFFFFFFFFFFFFFFFFFF8
          FFF70000000000000000008FFFFFFFFFFFFFFFFFFFFFFFF8FF70000000000000
          0000008FFFFFFFFFFFFFFFFFFFFFFFF8F7000000000000000000008FFFFFFFFF
          FFFFFFFFFFFFFFF8700000000000000000000088888888888888888888888888
          800000000000000000000000000000000000000000000000000000000000FFFF
          FFFFFFFF0000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC00000000F0000FFC0
          0000001F0000FFC00000003F0000FFC00000007F0000FFC0000000FF0000FFC0
          000001FF0000FFC0000003FF0000FFC0000007FF0000FFFFFFFFFFFF00002800
          0000100000002000000001000800000000004001000000000000000000000000
          0000000000000000000080008000800000008080000000800000008080000000
          8000C0C0C000C0DCC000F0CAA60080808000FF00FF00FF000000FFFF000000FF
          000000FFFF000000FF00FFFFFF00F0FBFF0032323200262626001A1A1A000E0E
          0E00A4A0A000D4F0FF00B1E2FF008ED4FF006BC6FF0048B8FF0025AAFF0000AA
          FF000092DC00007AB90000629600004A730000325000D4E3FF00B1C7FF008EAB
          FF006B8FFF004873FF002557FF000055FF000049DC00003DB900003196000025
          730000195000D4D4FF00B1B1FF008E8EFF006B6BFF004848FF002525FF000000
          FF000000DC000000B900000096000000730000005000E3D4FF00C7B1FF00AB8E
          FF008F6BFF007348FF005725FF005500FF004900DC003D00B900310096002500
          730019005000F0D4FF00E2B1FF00D48EFF00C66BFF00B848FF00AA25FF00AA00
          FF009200DC007A00B900620096004A00730032005000FFD4FF00FFB1FF00FF8E
          FF00FF6BFF00FF48FF00FF25FF00FF00FF00DC00DC00B900B900960096007300
          730050005000FFD4F000FFB1E200FF8ED400FF6BC600FF48B800FF25AA00FF00
          AA00DC009200B9007A009600620073004A0050003200FFD4E300FFB1C700FF8E
          AB00FF6B8F00FF487300FF255700FF005500DC004900B9003D00960031007300
          250050001900FFD4D400FFB1B100FF8E8E00FF6B6B00FF484800FF252500FF00
          0000DC000000B9000000960000007300000050000000FFE3D400FFC7B100FFAB
          8E00FF8F6B00FF734800FF572500FF550000DC490000B93D0000963100007325
          000050190000FFF0D400FFE2B100FFD48E00FFC66B00FFB84800FFAA2500FFAA
          0000DC920000B97A000096620000734A000050320000FFFFD400FFFFB100FFFF
          8E00FFFF6B00FFFF4800FFFF2500FFFF0000DCDC0000B9B90000969600007373
          000050500000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF4800AAFF2500AAFF
          000092DC00007AB90000629600004A73000032500000E3FFD400C7FFB100ABFF
          8E008FFF6B0073FF480057FF250055FF000049DC00003DB90000319600002573
          000019500000D4FFD400B1FFB1008EFF8E006BFF6B0048FF480025FF250000FF
          000000DC000000B90000009600000073000000500000D4FFE300B1FFC7008EFF
          AB006BFF8F0048FF730025FF570000FF550000DC490000B93D00009631000073
          250000501900D4FFF000B1FFE2008EFFD4006BFFC60048FFB80025FFAA0000FF
          AA0000DC920000B97A000096620000734A0000503200D4FFFF00B1FFFF008EFF
          FF006BFFFF0048FFFF0025FFFF0000FFFF0000DCDC0000B9B900009696000073
          730000505000F2F2F200E6E6E600DADADA00CECECE00C2C2C200B6B6B600AAAA
          AA009E9E9E0092929200868686007A7A7A006E6E6E0062626200565656004A4A
          4A003E3E3E000000000000000000000000000000000000949595959595959595
          9595959500000092919191919185850909090995000000929191919191919185
          8509099500000092849191919191919191850995000000928484919191919191
          9191859500000092848484849191919191919195000000928484848484849191
          9191919500000092909084848484849191919195000000929090908484848484
          849191950000009290909090908484919595959500000092F090909090909092
          0986939500000092F0F09090909090929109950000000092F0F0F0F090909092
          9094000000000092929292929292929292000000000000000000000000000000
          000000000000FFFF000080030000800300008003000080030000800300008003
          0000800300008003000080030000800300008003000080070000800F0000801F
          0000FFFF00002800000020000000400000000100080000000000800400000000
          0000000000000000000000000000000000008000800080000000808000000080
          00000080800000008000C0C0C000C0DCC000F0CAA60080808000FF00FF00FF00
          0000FFFF000000FF000000FFFF000000FF00FFFFFF00F0FBFF00323232002626
          26001A1A1A000E0E0E00A4A0A000D4F0FF00B1E2FF008ED4FF006BC6FF0048B8
          FF0025AAFF0000AAFF000092DC00007AB90000629600004A730000325000D4E3
          FF00B1C7FF008EABFF006B8FFF004873FF002557FF000055FF000049DC00003D
          B900003196000025730000195000D4D4FF00B1B1FF008E8EFF006B6BFF004848
          FF002525FF000000FF000000DC000000B900000096000000730000005000E3D4
          FF00C7B1FF00AB8EFF008F6BFF007348FF005725FF005500FF004900DC003D00
          B900310096002500730019005000F0D4FF00E2B1FF00D48EFF00C66BFF00B848
          FF00AA25FF00AA00FF009200DC007A00B900620096004A00730032005000FFD4
          FF00FFB1FF00FF8EFF00FF6BFF00FF48FF00FF25FF00FF00FF00DC00DC00B900
          B900960096007300730050005000FFD4F000FFB1E200FF8ED400FF6BC600FF48
          B800FF25AA00FF00AA00DC009200B9007A009600620073004A0050003200FFD4
          E300FFB1C700FF8EAB00FF6B8F00FF487300FF255700FF005500DC004900B900
          3D00960031007300250050001900FFD4D400FFB1B100FF8E8E00FF6B6B00FF48
          4800FF252500FF000000DC000000B9000000960000007300000050000000FFE3
          D400FFC7B100FFAB8E00FF8F6B00FF734800FF572500FF550000DC490000B93D
          0000963100007325000050190000FFF0D400FFE2B100FFD48E00FFC66B00FFB8
          4800FFAA2500FFAA0000DC920000B97A000096620000734A000050320000FFFF
          D400FFFFB100FFFF8E00FFFF6B00FFFF4800FFFF2500FFFF0000DCDC0000B9B9
          0000969600007373000050500000F0FFD400E2FFB100D4FF8E00C6FF6B00B8FF
          4800AAFF2500AAFF000092DC00007AB90000629600004A73000032500000E3FF
          D400C7FFB100ABFF8E008FFF6B0073FF480057FF250055FF000049DC00003DB9
          0000319600002573000019500000D4FFD400B1FFB1008EFF8E006BFF6B0048FF
          480025FF250000FF000000DC000000B90000009600000073000000500000D4FF
          E300B1FFC7008EFFAB006BFF8F0048FF730025FF570000FF550000DC490000B9
          3D00009631000073250000501900D4FFF000B1FFE2008EFFD4006BFFC60048FF
          B80025FFAA0000FFAA0000DC920000B97A000096620000734A0000503200D4FF
          FF00B1FFFF008EFFFF006BFFFF0048FFFF0025FFFF0000FFFF0000DCDC0000B9
          B900009696000073730000505000F2F2F200E6E6E600DADADA00CECECE00C2C2
          C200B6B6B600AAAAAA009E9E9E0092929200868686007A7A7A006E6E6E006262
          6200565656004A4A4A003E3E3E00000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000008686868686868686868686
          8686868686868686868686000000000000000000009284859185918591859185
          9185858585090909090986000000000000000000009285918591859185918591
          8591858585858509090986000000000000000000009291859185918591859185
          9185918585858585090986000000000000000000009291919191919185918591
          8591859185918585858586000000000000000000009291919191919191919185
          9185918591859185858586000000000000000000009284918491919191919191
          8591859185918591859186000000000000000000009291849184919191919191
          9191918591859185918586000000000000000000009284918491849184919191
          9191919185918591859186000000000000000000009291849184918491849191
          9191919191919185918586000000000000000000009284848491849184918491
          9191919191919191919186000000000000000000009284848484848491849184
          9184919191919191919186000000000000000000009284908484848484848491
          8491849191919191919186000000000000000000009290849084848484848484
          9184918491849191919186000000000000000000009284908490848484848484
          8491849184918491919186000000000000000000009290849084908490848484
          8484918491849184919186000000000000000000009284908490849084908484
          8484849184918491849186000000000000000000009290909084908490849084
          9084848484849184918486000000000000000000009290909090909084908490
          8490848484848491849186000000000000000000009290909090909090909084
          9084908484848491090986000000000000000000009290F09090909090909090
          90908490849009090909860000000000000000000092F090F090909090909090
          90909084908586868686860000000000000000000092F0F090F0909090909090
          9090909090929292938600000000000000000000009211F0F090F090F0909090
          90909090909285928600000000000000000000000092F01111F0F0F090F09090
          909090909092858600000000000000000000000000929011F011F0F0F090F090
          F090909090928600000000000000000000000000009292929292929292929292
          9292929292860000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFE000007FE00
          0007FE000007FE000007FE000007FE000007FE000007FE000007FE000007FE00
          0007FE000007FE000007FE000007FE000007FE000007FE000007FE000007FE00
          0007FE000007FE000007FE000007FE000007FE00000FFE00001FFE00003FFE00
          007FFE0000FFFFFFFFFFFFFFFFFF280000003000000060000000010008000000
          0000800A00000000000000000000000000000000000000000000800080008000
          000080800000008000000080800000008000C0C0C000C0DCC000F0CAA6008080
          8000FF00FF00FF000000FFFF000000FF000000FFFF000000FF00FFFFFF00F0FB
          FF0032323200262626001A1A1A000E0E0E00A4A0A000D4F0FF00B1E2FF008ED4
          FF006BC6FF0048B8FF0025AAFF0000AAFF000092DC00007AB90000629600004A
          730000325000D4E3FF00B1C7FF008EABFF006B8FFF004873FF002557FF000055
          FF000049DC00003DB900003196000025730000195000D4D4FF00B1B1FF008E8E
          FF006B6BFF004848FF002525FF000000FF000000DC000000B900000096000000
          730000005000E3D4FF00C7B1FF00AB8EFF008F6BFF007348FF005725FF005500
          FF004900DC003D00B900310096002500730019005000F0D4FF00E2B1FF00D48E
          FF00C66BFF00B848FF00AA25FF00AA00FF009200DC007A00B900620096004A00
          730032005000FFD4FF00FFB1FF00FF8EFF00FF6BFF00FF48FF00FF25FF00FF00
          FF00DC00DC00B900B900960096007300730050005000FFD4F000FFB1E200FF8E
          D400FF6BC600FF48B800FF25AA00FF00AA00DC009200B9007A00960062007300
          4A0050003200FFD4E300FFB1C700FF8EAB00FF6B8F00FF487300FF255700FF00
          5500DC004900B9003D00960031007300250050001900FFD4D400FFB1B100FF8E
          8E00FF6B6B00FF484800FF252500FF000000DC000000B9000000960000007300
          000050000000FFE3D400FFC7B100FFAB8E00FF8F6B00FF734800FF572500FF55
          0000DC490000B93D0000963100007325000050190000FFF0D400FFE2B100FFD4
          8E00FFC66B00FFB84800FFAA2500FFAA0000DC920000B97A000096620000734A
          000050320000FFFFD400FFFFB100FFFF8E00FFFF6B00FFFF4800FFFF2500FFFF
          0000DCDC0000B9B90000969600007373000050500000F0FFD400E2FFB100D4FF
          8E00C6FF6B00B8FF4800AAFF2500AAFF000092DC00007AB90000629600004A73
          000032500000E3FFD400C7FFB100ABFF8E008FFF6B0073FF480057FF250055FF
          000049DC00003DB90000319600002573000019500000D4FFD400B1FFB1008EFF
          8E006BFF6B0048FF480025FF250000FF000000DC000000B90000009600000073
          000000500000D4FFE300B1FFC7008EFFAB006BFF8F0048FF730025FF570000FF
          550000DC490000B93D00009631000073250000501900D4FFF000B1FFE2008EFF
          D4006BFFC60048FFB80025FFAA0000FFAA0000DC920000B97A00009662000073
          4A0000503200D4FFFF00B1FFFF008EFFFF006BFFFF0048FFFF0025FFFF0000FF
          FF0000DCDC0000B9B900009696000073730000505000F2F2F200E6E6E600DADA
          DA00CECECE00C2C2C200B6B6B600AAAAAA009E9E9E0092929200868686007A7A
          7A006E6E6E0062626200565656004A4A4A003E3E3E0000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000086868686868686868686868686868686
          8686868686868686868686868686868686869200000000000000000000000000
          9285918591859185918591858585858585920992099209920992929292929292
          9292860000000000000000000000000092918591859185918591859185918585
          8585858592099209920992099292929292928600000000000000000000000000
          9285918591859185918591859185918585858585858509920992099209929292
          9292860000000000000000000000000092919191859185918591859185918591
          9185858585858509090992099209920992928600000000000000000000000000
          9291919191919185918591859185918591859185858585858509099209920992
          0992860000000000000000000000000092919191919191919191859185918591
          8591859185858585858585090909920992098600000000000000000000000000
          9291919191919191919191859185918591859185918591858585858585090909
          0992860000000000000000000000000092919191919191919191919185918591
          8591859185918591858585858585850909098600000000000000000000000000
          9291919191919191919191919185918591859185918591859185858585858585
          0909860000000000000000000000000092918491919191919191919191919191
          8591859185918591859185918585858585858600000000000000000000000000
          9284918491919191919191919191919191919185918591859185918591858585
          8585860000000000000000000000000092918491849184919191919191919191
          9191919185918591859185918591859185858600000000000000000000000000
          9284918491849184919191919191919191919191919191859185918591859185
          9185860000000000000000000000000092918491849184918491919191919191
          9191919191919191859185918591859185918600000000000000000000000000
          9284918491849184918491849191919191919191919191919191918591859185
          9185860000000000000000000000000092848484849184918491849184919191
          9191919191919191919191918591859185918600000000000000000000000000
          9284848484848484918491849184918491919191919191919191919191859185
          9185860000000000000000000000000092848484848484848484849184918491
          8491919191919191919191919191919185918600000000000000000000000000
          9284848484848484848484848484918491849191919191919191919191919191
          9185860000000000000000000000000092848484848484848484848484848491
          8491849184919191919191919191919191918600000000000000000000000000
          9284848484848484848484848484848491849184918491919191919191919191
          9191860000000000000000000000000092908490848484848484848484848484
          8491849184918491849191919191919191918600000000000000000000000000
          9284908490848484848484848484848484848484918491849184919191919191
          9191860000000000000000000000000092908490849084908484848484848484
          8484848484918491849184918491919191918600000000000000000000000000
          9284908490849084908484848484848484848484848491849184918491849191
          9191860000000000000000000000000092908490849084908490848484848484
          8484848484848491849184918491849191918600000000000000000000000000
          9284908490849084908490849084848484848484848484848484918491849184
          9184860000000000000000000000000092909090849084908490849084908484
          8484848484848484848484918491849184918600000000000000000000000000
          9290909090909084908490849084908490848484848484848484848484849184
          9184860000000000000000000000000092909090909090908490849084908490
          8490848484848484848484848484849184918600000000000000000000000000
          9290909090909090909090849084908490849084908484848484848484848484
          9184860000000000000000000000000092F09090909090909090909084908490
          8490849084908484848484090909090909098600000000000000000000000000
          9290F09090909090909090909090908490849084908490848484090909090909
          0909860000000000000000000000000092F090F0909090909090909090909090
          8490849084908490848586868686868686868600000000000000000000000000
          9290F090F090F090909090909090909090909084908490849092918585858585
          8585860000000000000000000000000092F090F090F090F09090909090909090
          9090909084908490849278919191919191090000000000000000000000000000
          92F0F0F0F090F090F090F0909090909090909090908490849092787878787878
          0900000000000000000000000000000092F0F0F0F0F090F090F090F090909090
          9090909090908490849284847878788600000000000000000000000000000000
          9211F011F0F0F090F090F090F090909090909090909090849092908484788600
          00000000000000000000000000000000921111F011F0F0F0F0F090F090F090F0
          9090909090909090849290908486000000000000000000000000000000000000
          92111111F011F011F0F0F090F090F090F0909090909090909092F09086000000
          0000000000000000000000000000000092F01111111111F011F0F0F0F0F090F0
          90F090F0909090909092F0860000000000000000000000000000000000000000
          9292929292929292929292929292929292929292929292929292860000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFFFFFFFFFF0000FFFF
          FFFFFFFF0000FFFFFFFFFFFF0000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC00000000F0000FFC00000001F0000FFC0
          0000003F0000FFC00000007F0000FFC0000000FF0000FFC0000001FF0000FFC0
          000003FF0000FFC0000007FF0000FFFFFFFFFFFF000028000000100000002000
          0000010018000000000040FFFFFF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000FFB658FF9F15FF9F15FF9F15FF9F15
          FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F150000000000000000
          00FFCD9DFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFED4ABFED2A6FED2A6FE
          CFA2FECFA2FF9F15000000000000000000FFCD9DFEDFC1FEDDBBFEDDBBFEDAB5
          FEDAB5FED7B0FED7B0FED4ABFED4ABFED2A6FED2A6FF9F150000000000000000
          00FFCD9DFEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FE
          D4ABFED2A6FF9F15000000000000000000FFCD9DFEE2C7FEE2C7FEDFC1FEDFC1
          FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFF9F150000000000000000
          00FFCD9DFEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FE
          DAB5FED7B0FF9F15000000000000000000FFCD9DFEE8D2FEE8D2FEE5CDFEE5CD
          FEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FF9F150000000000000000
          00FFCD9DFEEBD8FEEBD8FEE8D2FEE8D2FEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FE
          DDBBFEDDBBFF9F15000000000000000000FFCD9DFFEEDEFEEBD8FEEBD8FEE8D2
          FEE8D2FEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FF9F150000000000000000
          00FFCD9DFFF1E4FFEEDEFFEEDEFEEBD8FEEBD8FEE8D2FEE8D2FBE1BFFF9F15FF
          9F15FF9F15FF9F15000000000000000000FFD9B3FFF4EAFFF1E4FFF1E4FFEEDE
          FFEEDEFEEBD8FEEBD8F8C88AF4D1ACF5BD83F6B677FF9F150000000000000000
          00FFDFBEFFF4EAFFF4EAFFF1E4FFF1E4FFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4
          D1ACFF9F15000000000000000000000000FFE2C4FFECD6FFF7F0FFF4EAFFF4EA
          FFF1E4FFF1E4FFEEDEF8C88AFCEEDEFFB6580000000000000000000000000000
          00FFE4C9FFE2C4FFDFBEFFD9B3FFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9D00
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          0000800300008003000080030000800300008003000080030000800300008003
          000080030000800300008003000080070000800F0000801F0000FFFF00002800
          0000200000004000000001001800000000008008000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000FFBC81FFBC
          81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FF
          BC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFC38D000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFE4
          C9FEDBB8FEDAB5FEDAB5FED8B3FED8B3FED8B3FED7B0FED7B0FED6AEFED6AEFE
          D4ABFED4ABFED3A9FED3A9FED2A6FED2A6FED1A4FED1A4FECFA2FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEDD
          BBFEDDBBFEDBB8FEDBB8FEDAB5FEDAB5FED8B3FED8B3FED7B0FED7B0FED6AEFE
          D6AEFED4ABFED4ABFED4ABFED3A9FED3A9FED2A6FED2A6FED1A4FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEDE
          BEFEDEBEFEDDBBFEDDBBFEDBB8FEDBB8FEDAB5FEDAB5FED8B3FED8B3FED7B0FE
          D7B0FED6AEFED6AEFED4ABFED4ABFED3A9FED3A9FED2A6FED2A6FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEDF
          C1FEDFC1FEDEBEFEDEBEFEDDBBFEDDBBFEDBB8FEDBB8FEDAB5FEDAB5FED8B3FE
          D8B3FED7B0FED7B0FED6AEFED6AEFED4ABFED4ABFED3A9FED3A9FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEE1
          C4FEDFC1FEDFC1FEDEBEFEDEBEFEDDBBFEDDBBFEDDBBFEDBB8FEDBB8FEDAB5FE
          DAB5FED8B3FED8B3FED7B0FED7B0FED6AEFED6AEFED4ABFED4ABFFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEE2
          C7FEE1C4FEE1C4FEDFC1FEDFC1FEDEBEFEDEBEFEDDBBFEDDBBFEDBB8FEDBB8FE
          DAB5FEDAB5FED8B3FED8B3FED8B3FED7B0FED7B0FED6AEFED6AEFFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEE4
          CAFEE2C7FEE2C7FEE1C4FEE1C4FEDFC1FEDFC1FEDEBEFEDEBEFEDDBBFEDDBBFE
          DBB8FEDBB8FEDAB5FEDAB5FED8B3FED8B3FED7B0FED7B0FED6AEFFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEE5
          CDFEE4CAFEE4CAFEE2C7FEE2C7FEE1C4FEE1C4FEDFC1FEDFC1FEDEBEFEDEBEFE
          DDBBFEDDBBFEDBB8FEDBB8FEDAB5FEDAB5FED8B3FED8B3FED7B0FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEE5
          CDFEE5CDFEE4CAFEE4CAFEE2C7FEE2C7FEE2C7FEE1C4FEE1C4FEDFC1FEDFC1FE
          DEBEFEDEBEFEDDBBFEDDBBFEDBB8FEDBB8FEDAB5FEDAB5FED8B3FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEE7
          CFFEE7CFFEE5CDFEE5CDFEE4CAFEE4CAFEE2C7FEE2C7FEE1C4FEE1C4FEDFC1FE
          DFC1FEDEBEFEDEBEFEDDBBFEDDBBFEDDBBFEDBB8FEDBB8FEDAB5FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEE8
          D2FEE8D2FEE7CFFEE7CFFEE5CDFEE5CDFEE4CAFEE4CAFEE2C7FEE2C7FEE1C4FE
          E1C4FEDFC1FEDFC1FEDEBEFEDEBEFEDDBBFEDDBBFEDBB8FEDBB8FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEEA
          D5FEEAD5FEE8D2FEE8D2FEE7CFFEE7CFFEE5CDFEE5CDFEE4CAFEE4CAFEE2C7FE
          E2C7FEE1C4FEE1C4FEDFC1FEDFC1FEDEBEFEDEBEFEDDBBFEDDBBFFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFEEB
          D8FEEAD5FEEAD5FEE8D2FEE8D2FEE7CFFEE7CFFEE7CFFEE5CDFEE5CDFEE4CAFE
          E4CAFEE2C7FEE2C7FEE1C4FEE1C4FEDFC1FEDFC1FEDEBEFEDEBEFFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFED
          DBFEEBD8FEEBD8FEEAD5FEEAD5FEE8D2FEE8D2FEE7CFFEE7CFFEE5CDFEE5CDFE
          E4CAFEE4CAFEE2C7FEE2C7FEE2C7FEE1C4FEE1C4FEDFC1FEDFC1FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFEE
          DEFFEDDBFFEDDBFEEBD8FEEBD8FEEAD5FEEAD5FEE8D2FEE8D2FEE7CFFEE7CFFE
          E5CDFEE5CDFEE4CAFEE4CAFEE2C7FEE2C7FEE1C4FEE1C4FEDFC1FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFF0
          E1FFEEDEFFEEDEFFEDDBFFEDDBFEEBD8FEEBD8FEEAD5FEEAD5FEE8D2FEE8D2FE
          E7CFFEE7CFFEE5CDFEE5CDFEE4CAFEE4CAFEE2C7FEE2C7FEE1C4FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFF0
          E1FFF0E1FFEEDEFFEEDEFFEDDBFFEDDBFEEBD8FEEBD8FEEBD8FEEAD5FEEAD5FE
          E8D2FEE8D2FEE7CFFEE7CFFEE5CDFEE5CDFEE4CAFEE4CAFEE2C7FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFF1
          E4FFF1E4FFF0E1FFF0E1FFEEDEFFEEDEFFEDDBFFEDDBFEEBD8FEEBD8FEEAD5FE
          EAD5FEE8D2FEE8D2FEE7CFFEE7CFFEE7CFFEE5CDFEE5CDFEE4CAFFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFF3
          E7FFF3E7FFF1E4FFF1E4FFF0E1FFF0E1FFEEDEFFEEDEFFEDDBFFEDDBFEEBD8FE
          EBD8FEEAD5FEEAD5FEE8D2FEE8D2FEE7CFF2D7B7F2D6B5E7C8A0FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFF4
          EAFFF4EAFFF3E7FFF3E7FFF1E4FFF1E4FFF0E1FFF0E1FFEEDEFFEEDEFFEDDBFF
          EDDBFEEBD8FEEBD8FEEAD5FEEAD5E7CAA3E7CAA3E7C9A1E7C9A1FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFF6
          EDFFF4EAFFF4EAFFF3E7FFF3E7FFF1E4FFF1E4FFF1E4FFF0E1FFF0E1FFEEDEFF
          EEDEFFEDDBFFEDDBFEEBD8FFCDA9FFBC81FFBC81FFBC81FFBC81FFBC81000000
          000000000000000000000000000000000000000000000000000000FFCD9DFFF7
          F0FFF6EDFFF6EDFFF4EAFFF4EAFFF3E7FFF3E7FFF1E4FFF1E4FFF0E1FFF0E1FF
          EEDEFFEEDEFFEDDBFFEDDBFFC495FFC693FFC693FFB675FFBC81000000000000
          000000000000000000000000000000000000000000000000000000FFD9B3FFF9
          F3FFF7F0FFF7F0FFF6EDFFF6EDFFF4EAFFF4EAFFF3E7FFF3E7FFF1E4FFF1E4FF
          F0E1FFF0E1FFEEDEFFEEDEFFC495FFCFA5FFC693FFBC81000000000000000000
          000000000000000000000000000000000000000000000000000000FFDFBEFFFA
          F6FFF9F3FFF9F3FFF7F0FFF7F0FFF6EDFFF6EDFFF4EAFFF4EAFFF3E7FFF3E7FF
          F1E4FFF1E4FFF0E1FFF0E1FFC495FFD4B1FFBC81000000000000000000000000
          000000000000000000000000000000000000000000000000000000FFE2C4FFF2
          E6FFFAF6FFF9F3FFF9F3FFF7F0FFF7F0FFF6EDFFF6EDFFF6EDFFF4EAFFF4EAFF
          F3E7FFF3E7FFF1E4FFF1E4FFC495FFBC81000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000FFE3C6FFE2
          C4FFDFBEFFD9B3FFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFF
          CD9DFFCD9DFFCD9DFFCCA7FFBC81000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFFFFFFFFFFFFFFFFFFFFFE000007FE000007FE000007FE00
          0007FE000007FE000007FE000007FE000007FE000007FE000007FE000007FE00
          0007FE000007FE000007FE000007FE000007FE000007FE000007FE000007FE00
          0007FE000007FE000007FE00000FFE00001FFE00003FFE00007FFE0000FFFFFF
          FFFFFFFFFFFF2800000030000000600000000100180000000000801800000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFBC81FF
          BC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81
          FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC
          81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FF
          BC81FFC38D000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFED9B4FED9B4FED9B4FED8B2FED8B2FED7
          B0FED7B0FED6AFFED6AFFED5ADFED5ADFED4ABFED4ABFED4AAFED4AAFED3A8FE
          D3A8FED2A6FED2A6FED1A5FED1A5FED0A3FED0A3FECFA2FECFA2FECFA0FECFA0
          FECE9EFECE9EFECD9DFECD9DFECC9BFECC9BFFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          DAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFED6AF
          FED5ADFED5ADFED4ABFED4ABFED4AAFED4AAFED3A8FED3A8FED2A6FED2A6FED1
          A5FED1A5FED0A3FED0A3FECFA2FECFA2FECFA0FECFA0FECE9EFECE9EFECD9DFE
          CD9DFFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEDBB7FEDBB7FEDAB5FEDAB5FED9B4FED9
          B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFED5ADFED5ADFED4ABFED4ABFE
          D4AAFED4AAFED4AAFED3A8FED3A8FED2A6FED2A6FED1A5FED1A5FED0A3FED0A3
          FECFA2FECFA2FECFA0FECFA0FECE9EFECE9EFFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          DCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0
          FED7B0FED6AFFED6AFFED5ADFED5ADFED4ABFED4ABFED4AAFED4AAFED3A8FED3
          A8FED2A6FED2A6FED1A5FED1A5FED0A3FED0A3FED0A3FECFA2FECFA2FECFA0FE
          CFA0FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEDDBBFEDCB9FEDCB9FEDCB9FEDBB7FEDB
          B7FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFE
          D5ADFED5ADFED4ABFED4ABFED4AAFED4AAFED3A8FED3A8FED2A6FED2A6FED1A5
          FED1A5FED0A3FED0A3FECFA2FECFA2FECFA0FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          DEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FED9B4
          FED9B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFED5ADFED5ADFED4ABFED4
          ABFED4AAFED4AAFED3A8FED3A8FED2A6FED2A6FED1A5FED1A5FED0A3FED0A3FE
          CFA2FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDC
          B9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0FE
          D7B0FED6AFFED6AFFED6AFFED5ADFED5ADFED4ABFED4ABFED4AAFED4AAFED3A8
          FED3A8FED2A6FED2A6FED1A5FED1A5FED0A3FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          DFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7
          FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFED5
          ADFED5ADFED4ABFED4ABFED4AAFED4AAFED4AAFED3A8FED3A8FED2A6FED2A6FE
          D1A5FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEDFC1FEDFC1FEDFC1FEDFBFFEDFBFFEDE
          BDFEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FE
          D9B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFED5ADFED5ADFED4ABFED4AB
          FED4AAFED4AAFED3A8FED3A8FED2A6FED2A6FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          E0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDDBB
          FEDCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7
          B0FED7B0FED6AFFED6AFFED5ADFED5ADFED4ABFED4ABFED4AAFED4AAFED3A8FE
          D3A8FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FEDF
          C1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7FE
          DAB5FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AF
          FED5ADFED5ADFED4ABFED4ABFED4AAFED4AAFFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          E2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDEBD
          FEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FED9
          B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFED6AFFED5ADFED5ADFED4ABFE
          D4ABFFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEE3C9FEE2C7FEE2C7FEE2C7FEE1C5FEE1
          C5FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFE
          DCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0
          FED7B0FED6AFFED6AFFED5ADFED5ADFED4ABFFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          E4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FEDFC1
          FEDFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDB
          B7FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FED7B0FED7B0FED6AFFED6AFFE
          D5ADFFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE2
          C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDEBDFE
          DEBDFEDDBBFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4
          FED9B4FED8B2FED8B2FED7B0FED7B0FED6AFFFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          E6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5
          FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDC
          B9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FE
          D7B0FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEE6CEFEE6CEFEE6CEFEE5CDFEE5CDFEE4
          CBFEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FE
          DFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7
          FEDAB5FEDAB5FED9B4FED9B4FED8B2FED8B2FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          E7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE3C9
          FEE2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDE
          BDFEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FED9B4FE
          D9B4FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFEE6
          CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5FE
          E0C3FEE0C3FEDFC1FEDFC1FEDFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBB
          FEDCB9FEDCB9FEDBB7FEDBB7FEDAB5FEDAB5FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          E9D4FEE9D4FEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4CB
          FEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FEDF
          C1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FE
          DBB7FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEEAD6FEE9D4FEE9D4FEE9D4FEE8D2FEE8
          D2FEE7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FE
          E2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDEBD
          FEDEBDFEDDBBFEDDBBFEDCB9FEDCB9FEDBB7FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFE
          EBD8FEEAD6FEEAD6FEE9D4FEE9D4FEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFEE6CE
          FEE6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1
          C5FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFEDDBBFE
          DCB9FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FEE9
          D4FEE9D4FEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4CBFE
          E4CBFEE3C9FEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1
          FEDFC1FEDFBFFEDFBFFEDEBDFEDEBDFEDDBBFFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          EDDCFEECDAFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FEE9D4FEE9D4FEE8D2FEE8D2
          FEE7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE2
          C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFE
          DEBDFFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFEDDCFFEDDCFFEDDCFEECDAFEECDAFEEB
          D8FEEBD8FEEAD6FEEAD6FEE9D4FEE9D4FEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFE
          E6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5
          FEE0C3FEE0C3FEDFC1FEDFC1FEDFBFFEDFBFFFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          EEDEFFEEDEFFEDDCFFEDDCFEECDAFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FEE9D4
          FEE9D4FEE9D4FEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4
          CBFEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FEDFC1FE
          DFC1FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFFED
          DCFEECDAFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FEE9D4FEE9D4FEE8D2FEE8D2FE
          E7D0FEE7D0FEE6CEFEE6CEFEE6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9
          FEE2C7FEE2C7FEE1C5FEE1C5FEE0C3FEE0C3FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          F0E2FFF0E2FFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFFEDDCFEECDAFEECDAFEEBD8
          FEEBD8FEEAD6FEEAD6FEE9D4FEE9D4FEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFEE6
          CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FE
          E1C5FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFF1E4FFF0E2FFF0E2FFF0E2FFEFE0FFEF
          E0FFEEDEFFEEDEFFEDDCFFEDDCFEECDAFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FE
          E9D4FEE9D4FEE8D2FEE8D2FEE7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4CB
          FEE4CBFEE3C9FEE3C9FEE2C7FEE2C7FEE1C5FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          F2E6FFF1E4FFF1E4FFF0E2FFF0E2FFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFFEDDC
          FFEDDCFEECDAFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FEE9D4FEE9D4FEE8D2FEE8
          D2FEE7D0FEE7D0FEE6CEFEE6CEFEE5CDFEE5CDFEE4CBFEE4CBFEE3C9FEE3C9FE
          E2C7FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FFF0
          E2FFF0E2FFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFFEDDCFEECDAFEECDAFEEBD8FE
          EBD8FEEAD6FEEAD6FEEAD6FEE9D4FEE9D4FEE8D2FEE8D2FEE6CEFEE6CEFEE6CE
          FEE0C3FEE0C3FEE0C3FEE0C3FEE0C3FEE0C3FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          F4EAFFF3E8FFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FFF0E2FFF0E2FFEFE0FFEFE0
          FFEEDEFFEEDEFFEDDCFFEDDCFEECDAFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FEE9
          D4FEE9D4FEE8D2FEE7D0FEE7D0F2D6B5F2D6B5F2D6B5F2D6B5F2D6B5F2D6B5E7
          C8A0FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFF4EAFFF4EAFFF3E8FFF3E8FFF3E8FFF2
          E6FFF2E6FFF1E4FFF1E4FFF0E2FFF0E2FFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFF
          EDDCFEECDAFEECDAFEEBD8FEEBD8FEEAD6FEEAD6FEE9D4FEE8D2E7CAA3E7CAA3
          E7CAA3E7CAA3E7CAA3E7CAA3E7CAA3E7CAA3FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          F5ECFFF5ECFFF4EAFFF4EAFFF3E8FFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FFF0E2
          FFF0E2FFF0E2FFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFFEDDCFEECDAFEECDAFEEB
          D8FEEBD8FEEAD6FFCDA9FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FFBC81FF
          BC81FFBC81000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFF6EEFFF6EEFFF5ECFFF5ECFFF4EAFFF4
          EAFFF3E8FFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FFF0E2FFF0E2FFEFE0FFEFE0FF
          EEDEFFEEDEFFEDDCFFEDDCFFEDDCFEECDAFEECDAFEEBD8FFC495FFD5BAFFD1B2
          FFD1B2FFD1B2FFD1B2FFD1B2FFD1B2FFD1B2FFBC810000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          F7F0FFF7F0FFF6EEFFF6EEFFF5ECFFF5ECFFF4EAFFF4EAFFF3E8FFF3E8FFF2E6
          FFF2E6FFF1E4FFF1E4FFF0E2FFF0E2FFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFFED
          DCFEECDAFEECDAFFC495FFDBC3FFD5BAFFD5BAFFD5BAFFD5BAFFD5BAFFD5BAE7
          C8A0000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFF8F2FFF7F0FFF7F0FFF7F0FFF6EEFFF6
          EEFFF5ECFFF5ECFFF4EAFFF4EAFFF3E8FFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FF
          F0E2FFF0E2FFEFE0FFEFE0FFEEDEFFEEDEFFEDDCFFEDDCFFC495FFDBC3FFDBC3
          FFDBC3FFDBC3FFDBC3FFDBC3E7C9A10000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFCD9DFF
          F9F4FFF8F2FFF8F2FFF7F0FFF7F0FFF6EEFFF6EEFFF5ECFFF5ECFFF4EAFFF4EA
          FFF4EAFFF3E8FFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FFF0E2FFF0E2FFEFE0FFEF
          E0FFEEDEFFEEDEFFC495FFE1CEFFE1CEFFDBC3FFDBC3FFDBC3FFBC8100000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFCD9DFFFAF6FFF9F4FFF9F4FFF8F2FFF8F2FFF7
          F0FFF7F0FFF6EEFFF6EEFFF5ECFFF5ECFFF4EAFFF4EAFFF3E8FFF3E8FFF2E6FF
          F2E6FFF1E4FFF1E4FFF1E4FFF0E2FFF0E2FFEFE0FFEFE0FFC495FFEADCFFE1CE
          FFE1CEFFDBC3FFBC810000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFD9B3FF
          FBF7FFFAF6FFFAF6FFF9F4FFF9F4FFF8F2FFF8F2FFF7F0FFF7F0FFF6EEFFF6EE
          FFF5ECFFF5ECFFF4EAFFF4EAFFF3E8FFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FFF0
          E2FFF0E2FFEFE0FFC495FFEADCFFEADCFFE1CEFFBC8100000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFDFBEFFFBF7FFFBF7FFFAF6FFFAF6FFFAF6FFF9
          F4FFF9F4FFF8F2FFF8F2FFF7F0FFF7F0FFF6EEFFF6EEFFF5ECFFF5ECFFF4EAFF
          F4EAFFF3E8FFF3E8FFF2E6FFF2E6FFF1E4FFF1E4FFF0E2FFC495FFF5EEFFEADC
          FFBC810000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000000000000000FFE2C4FF
          E4C9FFFCF9FFFBF7FFFBF7FFFAF6FFFAF6FFF9F4FFF9F4FFF8F2FFF8F2FFF7F0
          FFF7F0FFF7F0FFF6EEFFF6EEFFF5ECFFF5ECFFF4EAFFF4EAFFF3E8FFF3E8FFF2
          E6FFF2E6FFF1E4FFC495FFF5EEFFBC8100000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000FFE4C9FFE2C4FFDFBEFFD9B3FFCD9DFFCD9DFFCD
          9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFF
          CD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9D000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFFFFFFFFFF0000FFFFFFFFFFFF0000FFFF
          FFFFFFFF0000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC0000000070000FFC0000000070000FFC0000000070000FFC0
          000000070000FFC00000000F0000FFC00000001F0000FFC00000003F0000FFC0
          0000007F0000FFC0000000FF0000FFC0000001FF0000FFC0000003FF0000FFC0
          000007FF0000FFFFFFFFFFFF0000280000001000000020000000010020000000
          00004000000000000000000000000000000000000000000000006C491C2C7E55
          1F5A754F1D62895C217B7F5418877F5418877F5418877F5418877F5418877F54
          18877F5418877F5418877F541887845920680000000000000000FFB658FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FF7F5418870000000000000000FFCD9DFFFEDD
          BBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2A6FFFED2
          A6FFFECFA2FFFECFA2FFFF9F15FF7F5418870000000000000000FFCD9DFFFEDF
          C1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4
          ABFFFED2A6FFFED2A6FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE2
          C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7
          B0FFFED4ABFFFED2A6FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE2
          C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7
          B0FFFED7B0FFFED4ABFFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE5
          CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDA
          B5FFFEDAB5FFFED7B0FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE8
          D2FFFEE8D2FFFEE5CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDD
          BBFFFEDDBBFFFEDAB5FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEEB
          D8FFFEEBD8FFFEE8D2FFFEE8D2FFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDF
          C1FFFEDDBBFFFEDDBBFFFF9F15FF895C217B1A130C0800000000FFCD9DFFFFEE
          DEFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8D2FFFEE5CDFFFEE5CDFFFEE2C7FFFEE2
          C7FFFEDFC1FFFEDFC1FFFF9F15FF775121641A130C0800000000FFCD9DFFFFF1
          E4FFFFEEDEFFFFEEDEFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8D2FFFBE1BFFFFF9F
          15CBFF9F15CBFF9F15CBFF9F15FF907150620000000900000000FFD9B3FFFFF4
          EAFFFFF1E4FFFFF1E4FFFFEEDEFFFFEEDEFFFEEBD8FFFEEBD8FFF8C88AFFF4D1
          ACFFF5BD83FFF6B677FFFF9F15FF9F774D370000000000000000FFDFBEFFFFF4
          EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFFFEEDEFFFEEBD8FFF8C88AFFF5D6
          B2E9F4D1ACFFFF9F15FFFF9F152E000000000000000000000000FFE2C4FFFFEC
          D6FFFFF7F0FFFFF4EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFF8C88AFFFCEE
          DEDBFFB658FFC47A102300000000000000000000000000000000FFE4C982FFE2
          C4FFFFDFBEFFFFD9B3FFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFF975E0C1B0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000080010000800100008001
          0000800000008000000080000000800000008000000080000000800000008000
          0000800100008003000080070000800F0000FFFF000028000000200000004000
          00000100200000000000800C0000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000734A
          000C734A001E734A002C734A004F734A004F734A004F734A004F734A004F734A
          004F734A004F734A004F734A004F734A004F734A004F734A004F734A004F734A
          004F734A004F734A004F734A004F734A004F734A004F734A0024000000000000
          000000000000000000000000000000000000000000000000000000000000734A
          004C734A006F734A007C734A007C734A007C734A007C734A007C734A007C734A
          007C734A007C734A007C734A007C734A007C734A007C734A007C734A007C734A
          007C734A007C734A007C734A007C734A007C734A0069734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFE4C982FFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFC38DFF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFE4
          C9FFFEDBB8FFFEDAB5FFFEDAB5FFFED8B3FFFED8B3FFFED8B3FFFED7B0FFFED7
          B0FFFED6AEFFFED6AEFFFED4ABFFFED4ABFFFED3A9FFFED3A9FFFED2A6FFFED2
          A6FFFED1A4FFFED1A4FFFECFA2FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEDD
          BBFFFEDDBBFFFEDBB8FFFEDBB8FFFEDAB5FFFEDAB5FFFED8B3FFFED8B3FFFED7
          B0FFFED7B0FFFED6AEFFFED6AEFFFED4ABFFFED4ABFFFED4ABFFFED3A9FFFED3
          A9FFFED2A6FFFED2A6FFFED1A4FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEDE
          BEFFFEDEBEFFFEDDBBFFFEDDBBFFFEDBB8FFFEDBB8FFFEDAB5FFFEDAB5FFFED8
          B3FFFED8B3FFFED7B0FFFED7B0FFFED6AEFFFED6AEFFFED4ABFFFED4ABFFFED3
          A9FFFED3A9FFFED2A6FFFED2A6FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEDF
          C1FFFEDFC1FFFEDEBEFFFEDEBEFFFEDDBBFFFEDDBBFFFEDBB8FFFEDBB8FFFEDA
          B5FFFEDAB5FFFED8B3FFFED8B3FFFED7B0FFFED7B0FFFED6AEFFFED6AEFFFED4
          ABFFFED4ABFFFED3A9FFFED3A9FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEE1
          C4FFFEDFC1FFFEDFC1FFFEDEBEFFFEDEBEFFFEDDBBFFFEDDBBFFFEDDBBFFFEDB
          B8FFFEDBB8FFFEDAB5FFFEDAB5FFFED8B3FFFED8B3FFFED7B0FFFED7B0FFFED6
          AEFFFED6AEFFFED4ABFFFED4ABFFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEE2
          C7FFFEE1C4FFFEE1C4FFFEDFC1FFFEDFC1FFFEDEBEFFFEDEBEFFFEDDBBFFFEDD
          BBFFFEDBB8FFFEDBB8FFFEDAB5FFFEDAB5FFFED8B3FFFED8B3FFFED8B3FFFED7
          B0FFFED7B0FFFED6AEFFFED6AEFFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEE4
          CAFFFEE2C7FFFEE2C7FFFEE1C4FFFEE1C4FFFEDFC1FFFEDFC1FFFEDEBEFFFEDE
          BEFFFEDDBBFFFEDDBBFFFEDBB8FFFEDBB8FFFEDAB5FFFEDAB5FFFED8B3FFFED8
          B3FFFED7B0FFFED7B0FFFED6AEFFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEE5
          CDFFFEE4CAFFFEE4CAFFFEE2C7FFFEE2C7FFFEE1C4FFFEE1C4FFFEDFC1FFFEDF
          C1FFFEDEBEFFFEDEBEFFFEDDBBFFFEDDBBFFFEDBB8FFFEDBB8FFFEDAB5FFFEDA
          B5FFFED8B3FFFED8B3FFFED7B0FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEE5
          CDFFFEE5CDFFFEE4CAFFFEE4CAFFFEE2C7FFFEE2C7FFFEE2C7FFFEE1C4FFFEE1
          C4FFFEDFC1FFFEDFC1FFFEDEBEFFFEDEBEFFFEDDBBFFFEDDBBFFFEDBB8FFFEDB
          B8FFFEDAB5FFFEDAB5FFFED8B3FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEE7
          CFFFFEE7CFFFFEE5CDFFFEE5CDFFFEE4CAFFFEE4CAFFFEE2C7FFFEE2C7FFFEE1
          C4FFFEE1C4FFFEDFC1FFFEDFC1FFFEDEBEFFFEDEBEFFFEDDBBFFFEDDBBFFFEDD
          BBFFFEDBB8FFFEDBB8FFFEDAB5FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEE8
          D2FFFEE8D2FFFEE7CFFFFEE7CFFFFEE5CDFFFEE5CDFFFEE4CAFFFEE4CAFFFEE2
          C7FFFEE2C7FFFEE1C4FFFEE1C4FFFEDFC1FFFEDFC1FFFEDEBEFFFEDEBEFFFEDD
          BBFFFEDDBBFFFEDBB8FFFEDBB8FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEEA
          D5FFFEEAD5FFFEE8D2FFFEE8D2FFFEE7CFFFFEE7CFFFFEE5CDFFFEE5CDFFFEE4
          CAFFFEE4CAFFFEE2C7FFFEE2C7FFFEE1C4FFFEE1C4FFFEDFC1FFFEDFC1FFFEDE
          BEFFFEDEBEFFFEDDBBFFFEDDBBFFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFEEB
          D8FFFEEAD5FFFEEAD5FFFEE8D2FFFEE8D2FFFEE7CFFFFEE7CFFFFEE7CFFFFEE5
          CDFFFEE5CDFFFEE4CAFFFEE4CAFFFEE2C7FFFEE2C7FFFEE1C4FFFEE1C4FFFEDF
          C1FFFEDFC1FFFEDEBEFFFEDEBEFFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFED
          DBFFFEEBD8FFFEEBD8FFFEEAD5FFFEEAD5FFFEE8D2FFFEE8D2FFFEE7CFFFFEE7
          CFFFFEE5CDFFFEE5CDFFFEE4CAFFFEE4CAFFFEE2C7FFFEE2C7FFFEE2C7FFFEE1
          C4FFFEE1C4FFFEDFC1FFFEDFC1FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFEE
          DEFFFFEDDBFFFFEDDBFFFEEBD8FFFEEBD8FFFEEAD5FFFEEAD5FFFEE8D2FFFEE8
          D2FFFEE7CFFFFEE7CFFFFEE5CDFFFEE5CDFFFEE4CAFFFEE4CAFFFEE2C7FFFEE2
          C7FFFEE1C4FFFEE1C4FFFEDFC1FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFF0
          E1FFFFEEDEFFFFEEDEFFFFEDDBFFFFEDDBFFFEEBD8FFFEEBD8FFFEEAD5FFFEEA
          D5FFFEE8D2FFFEE8D2FFFEE7CFFFFEE7CFFFFEE5CDFFFEE5CDFFFEE4CAFFFEE4
          CAFFFEE2C7FFFEE2C7FFFEE1C4FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFF0
          E1FFFFF0E1FFFFEEDEFFFFEEDEFFFFEDDBFFFFEDDBFFFEEBD8FFFEEBD8FFFEEB
          D8FFFEEAD5FFFEEAD5FFFEE8D2FFFEE8D2FFFEE7CFFFFEE7CFFFFEE5CDFFFEE5
          CDFFFEE4CAFFFEE4CAFFFEE2C7FFFFBC81FF734A007C734A004F000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFF1
          E4FFFFF1E4FFFFF0E1FFFFF0E1FFFFEEDEFFFFEEDEFFFFEDDBFFFFEDDBFFFEEB
          D8FFFEEBD8FFFEEAD5FFFEEAD5FFFEE8D2FFFEE8D2FFFEE7CFFFFEE7CFFFFEE7
          CFFFFEE5CDFFFEE5CDFFFEE4CAFFFFBC81FF734A007C734A002C000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFF3
          E7FFFFF3E7FFFFF1E4FFFFF1E4FFFFF0E1FFFFF0E1FFFFEEDEFFFFEEDEFFFFED
          DBFFFFEDDBFFFEEBD8FFFEEBD8FFFEEAD5FFFEEAD5FFFEE8D2FFFEE8D2FFFEE7
          CFFFF2D7B7FFF2D6B5FFE7C8A0FFFFBC81FF734A0058734A001E000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFF4
          EAFFFFF4EAFFFFF3E7FFFFF3E7FFFFF1E4FFFFF1E4FFFFF0E1FFFFF0E1FFFFEE
          DEFFFFEEDEFFFFEDDBFFFFEDDBFFFEEBD8FFFEEBD8FFFEEAD5FFFEEAD5FFE7CA
          A3FFE7CAA3FFE7C9A1FFE7C9A1FFB7A18CB7734A004C734A000C000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFF6
          EDFFFFF4EAFFFFF4EAFFFFF3E7FFFFF3E7FFFFF1E4FFFFF1E4FFFFF1E4FFFFF0
          E1FFFFF0E1FFFFEEDEFFFFEEDEFFFFEDDBFFFFEDDBFFFEEBD8FFFFCDA9FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FF2F251D2F0000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFCD9DFFFFF7
          F0FFFFF6EDFFFFF6EDFFFFF4EAFFFFF4EAFFFFF3E7FFFFF3E7FFFFF1E4FFFFF1
          E4FFFFF0E1FFFFF0E1FFFFEEDEFFFFEEDEFFFFEDDBFFFFEDDBFFFFC495FFFFC6
          93FFFFC693FFFFB675FFFFBC81FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFD9B3FFFFF9
          F3FFFFF7F0FFFFF7F0FFFFF6EDFFFFF6EDFFFFF4EAFFFFF4EAFFFFF3E7FFFFF3
          E7FFFFF1E4FFFFF1E4FFFFF0E1FFFFF0E1FFFFEEDEFFFFEEDEFFFFC495FFFFCF
          A5FFFFC693FFFFBC81FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFDFBEFFFFFA
          F6FFFFF9F3FFFFF9F3FFFFF7F0FFFFF7F0FFFFF6EDFFFFF6EDFFFFF4EAFFFFF4
          EAFFFFF3E7FFFFF3E7FFFFF1E4FFFFF1E4FFFFF0E1FFFFF0E1FFFFC495FFFFD4
          B1FFFFBC81FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFE2C4FFFFE4
          C9FFFFFAF6FFFFF9F3FFFFF9F3FFFFF7F0FFFFF7F0FFFFF6EDFFFFF6EDFFFFF6
          EDFFFFF4EAFFFFF4EAFFFFF3E7FFFFF3E7FFFFF1E4FFFFF1E4FFFFC495FFFFBC
          81FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000FFE4C982FFE2
          C4FFFFDFBEFFFFD9B3FFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCCA7FFCAB49FCA0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000000000000000000000000000000000000000000000FFFF
          FFFFFF000001FF000001FE000001FE000001FE000001FE000001FE000001FE00
          0001FE000001FE000001FE000001FE000001FE000001FE000001FE000001FE00
          0001FE000001FE000001FE000001FE000001FE000001FE000001FE000001FE00
          0007FE00000FFE00001FFE00003FFE00007FFE0000FFFFFFFFFFFFFFFFFF2800
          0000300000006000000001002000000000008021000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000734A000C734A001E734A002C734A004F734A
          004F734A004F734A004F734A004F734A004F734A004F734A004F734A004F734A
          004F734A004F734A004F734A004F734A004F734A004F734A004F734A004F734A
          004F734A004F734A004F734A004F734A004F734A004F734A004F734A004F734A
          004F734A004F734A004F734A004F734A004F734A004F734A004F734A004F734A
          0024000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000734A004C734A006F734A007C734A007C734A
          007C734A007C734A007C734A007C734A007C734A007C734A007C734A007C734A
          007C734A007C734A007C734A007C734A007C734A007C734A007C734A007C734A
          007C734A007C734A007C734A007C734A007C734A007C734A007C734A007C734A
          007C734A007C734A007C734A007C734A007C734A007C734A007C734A0069734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFC38DFF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFED9B4FFFED9B4FFFED9B4FFFED8
          B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED5ADFFFED5ADFFFED4
          ABFFFED4ABFFFED4AAFFFED4AAFFFED3A8FFFED3A8FFFED2A6FFFED2A6FFFED1
          A5FFFED1A5FFFED0A3FFFED0A3FFFECFA2FFFECFA2FFFECFA0FFFECFA0FFFECE
          9EFFFECE9EFFFECD9DFFFECD9DFFFECC9BFFFECC9BFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDAB5FFFEDAB5FFFED9B4FFFED9
          B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED6AFFFFED5
          ADFFFED5ADFFFED4ABFFFED4ABFFFED4AAFFFED4AAFFFED3A8FFFED3A8FFFED2
          A6FFFED2A6FFFED1A5FFFED1A5FFFED0A3FFFED0A3FFFECFA2FFFECFA2FFFECF
          A0FFFECFA0FFFECE9EFFFECE9EFFFECD9DFFFECD9DFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDBB7FFFEDBB7FFFEDAB5FFFEDA
          B5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6
          AFFFFED5ADFFFED5ADFFFED4ABFFFED4ABFFFED4AAFFFED4AAFFFED4AAFFFED3
          A8FFFED3A8FFFED2A6FFFED2A6FFFED1A5FFFED1A5FFFED0A3FFFED0A3FFFECF
          A2FFFECFA2FFFECFA0FFFECFA0FFFECE9EFFFECE9EFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDCB9FFFEDCB9FFFEDBB7FFFEDB
          B7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFED7
          B0FFFED6AFFFFED6AFFFFED5ADFFFED5ADFFFED4ABFFFED4ABFFFED4AAFFFED4
          AAFFFED3A8FFFED3A8FFFED2A6FFFED2A6FFFED1A5FFFED1A5FFFED0A3FFFED0
          A3FFFED0A3FFFECFA2FFFECFA2FFFECFA0FFFECFA0FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDDBBFFFEDCB9FFFEDCB9FFFEDC
          B9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFED8B2FFFED8
          B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED5ADFFFED5ADFFFED4ABFFFED4
          ABFFFED4AAFFFED4AAFFFED3A8FFFED3A8FFFED2A6FFFED2A6FFFED1A5FFFED1
          A5FFFED0A3FFFED0A3FFFECFA2FFFECFA2FFFECFA0FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDEBDFFFEDDBBFFFEDDBBFFFEDC
          B9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFED9
          B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED5ADFFFED5
          ADFFFED4ABFFFED4ABFFFED4AAFFFED4AAFFFED3A8FFFED3A8FFFED2A6FFFED2
          A6FFFED1A5FFFED1A5FFFED0A3FFFED0A3FFFECFA2FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDFBFFFFEDEBDFFFEDEBDFFFEDD
          BBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9
          B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED6
          AFFFFED5ADFFFED5ADFFFED4ABFFFED4ABFFFED4AAFFFED4AAFFFED3A8FFFED3
          A8FFFED2A6FFFED2A6FFFED1A5FFFED1A5FFFED0A3FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDFC1FFFEDFBFFFFEDFBFFFFEDE
          BDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDA
          B5FFFEDAB5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6
          AFFFFED6AFFFFED5ADFFFED5ADFFFED4ABFFFED4ABFFFED4AAFFFED4AAFFFED4
          AAFFFED3A8FFFED3A8FFFED2A6FFFED2A6FFFED1A5FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEDFC1FFFEDFC1FFFEDFC1FFFEDF
          BFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDB
          B7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFED7
          B0FFFED7B0FFFED6AFFFFED6AFFFFED5ADFFFED5ADFFFED4ABFFFED4ABFFFED4
          AAFFFED4AAFFFED3A8FFFED3A8FFFED2A6FFFED2A6FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE0C3FFFEE0C3FFFEDFC1FFFEDF
          C1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDDBBFFFEDC
          B9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFED8
          B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED5ADFFFED5ADFFFED4
          ABFFFED4ABFFFED4AAFFFED4AAFFFED3A8FFFED3A8FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE1C5FFFEE1C5FFFEE0C3FFFEE0
          C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDD
          BBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFEDAB5FFFED9
          B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED5
          ADFFFED5ADFFFED4ABFFFED4ABFFFED4AAFFFED4AAFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE2C7FFFEE2C7FFFEE1C5FFFEE1
          C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDE
          BDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDA
          B5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFED6
          AFFFFED6AFFFFED5ADFFFED5ADFFFED4ABFFFED4ABFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE3C9FFFEE2C7FFFEE2C7FFFEE2
          C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDF
          BFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDB
          B7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFED7
          B0FFFED6AFFFFED6AFFFFED5ADFFFED5ADFFFED4ABFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2
          C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDF
          C1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDC
          B9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFED8B2FFFED8
          B2FFFED7B0FFFED7B0FFFED6AFFFFED6AFFFFED5ADFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3
          C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDF
          C1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDD
          BBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9B4FFFED9
          B4FFFED8B2FFFED8B2FFFED7B0FFFED7B0FFFED6AFFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4
          CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0
          C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDD
          BBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFEDA
          B5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFED7B0FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE6CEFFFEE6CEFFFEE6CEFFFEE5
          CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1
          C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDE
          BDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDA
          B5FFFEDAB5FFFED9B4FFFED9B4FFFED8B2FFFED8B2FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE7D0FFFEE7D0FFFEE6CEFFFEE6
          CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE3C9FFFEE2
          C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDF
          BFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDB
          B7FFFEDBB7FFFEDAB5FFFEDAB5FFFED9B4FFFED9B4FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE8D2FFFEE8D2FFFEE7D0FFFEE7
          D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3
          C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDF
          C1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDC
          B9FFFEDCB9FFFEDBB7FFFEDBB7FFFEDAB5FFFEDAB5FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEE9D4FFFEE9D4FFFEE8D2FFFEE8
          D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4
          CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0
          C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDD
          BBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFEDBB7FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEEAD6FFFEE9D4FFFEE9D4FFFEE9
          D4FFFEE8D2FFFEE8D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5
          CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1
          C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDE
          BDFFFEDDBBFFFEDDBBFFFEDCB9FFFEDCB9FFFEDBB7FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEEBD8FFFEEAD6FFFEEAD6FFFEE9
          D4FFFEE9D4FFFEE8D2FFFEE8D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE6
          CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2
          C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDF
          BFFFFEDEBDFFFEDEBDFFFEDDBBFFFEDDBBFFFEDCB9FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFEECDAFFFEEBD8FFFEEBD8FFFEEA
          D6FFFEEAD6FFFEE9D4FFFEE9D4FFFEE8D2FFFEE8D2FFFEE7D0FFFEE7D0FFFEE6
          CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE3
          C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDF
          C1FFFEDFBFFFFEDFBFFFFEDEBDFFFEDEBDFFFEDDBBFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFEDDCFFFEECDAFFFEECDAFFFEEB
          D8FFFEEBD8FFFEEAD6FFFEEAD6FFFEE9D4FFFEE9D4FFFEE8D2FFFEE8D2FFFEE7
          D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3
          C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEE0
          C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFEDEBDFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFEDDCFFFFEDDCFFFFEDDCFFFEEC
          DAFFFEECDAFFFEEBD8FFFEEBD8FFFEEAD6FFFEEAD6FFFEE9D4FFFEE9D4FFFEE8
          D2FFFEE8D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4
          CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0
          C3FFFEE0C3FFFEDFC1FFFEDFC1FFFEDFBFFFFEDFBFFFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFEEDEFFFFEEDEFFFFEDDCFFFFED
          DCFFFEECDAFFFEECDAFFFEEBD8FFFEEBD8FFFEEAD6FFFEEAD6FFFEE9D4FFFEE9
          D4FFFEE9D4FFFEE8D2FFFEE8D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE5
          CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1
          C5FFFEE1C5FFFEE0C3FFFEE0C3FFFEDFC1FFFEDFC1FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFEFE0FFFFEFE0FFFFEEDEFFFFEE
          DEFFFFEDDCFFFFEDDCFFFEECDAFFFEECDAFFFEEBD8FFFEEBD8FFFEEAD6FFFEEA
          D6FFFEE9D4FFFEE9D4FFFEE8D2FFFEE8D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6
          CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2
          C7FFFEE2C7FFFEE1C5FFFEE1C5FFFEE0C3FFFEE0C3FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF0E2FFFFF0E2FFFFEFE0FFFFEF
          E0FFFFEEDEFFFFEEDEFFFFEDDCFFFFEDDCFFFEECDAFFFEECDAFFFEEBD8FFFEEB
          D8FFFEEAD6FFFEEAD6FFFEE9D4FFFEE9D4FFFEE8D2FFFEE8D2FFFEE7D0FFFEE7
          D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3
          C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFEE1C5FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF1E4FFFFF0E2FFFFF0E2FFFFF0
          E2FFFFEFE0FFFFEFE0FFFFEEDEFFFFEEDEFFFFEDDCFFFFEDDCFFFEECDAFFFEEC
          DAFFFEEBD8FFFEEBD8FFFEEAD6FFFEEAD6FFFEE9D4FFFEE9D4FFFEE8D2FFFEE8
          D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5CDFFFEE4CBFFFEE4
          CBFFFEE3C9FFFEE3C9FFFEE2C7FFFEE2C7FFFEE1C5FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF2E6FFFFF1E4FFFFF1E4FFFFF0
          E2FFFFF0E2FFFFEFE0FFFFEFE0FFFFEEDEFFFFEEDEFFFFEDDCFFFFEDDCFFFFED
          DCFFFEECDAFFFEECDAFFFEEBD8FFFEEBD8FFFEEAD6FFFEEAD6FFFEE9D4FFFEE9
          D4FFFEE8D2FFFEE8D2FFFEE7D0FFFEE7D0FFFEE6CEFFFEE6CEFFFEE5CDFFFEE5
          CDFFFEE4CBFFFEE4CBFFFEE3C9FFFEE3C9FFFEE2C7FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF3E8FFFFF2E6FFFFF2E6FFFFF1
          E4FFFFF1E4FFFFF0E2FFFFF0E2FFFFEFE0FFFFEFE0FFFFEEDEFFFFEEDEFFFFED
          DCFFFFEDDCFFFEECDAFFFEECDAFFFEEBD8FFFEEBD8FFFEEAD6FFFEEAD6FFFEEA
          D6FFFEE9D4FFFEE9D4FFFEE8D2FFFEE8D2FFFEE6CEFFFEE6CEFFFEE6CEFFFEE0
          C3FFFEE0C3FFFEE0C3FFFEE0C3FFFEE0C3FFFEE0C3FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF4EAFFFFF3E8FFFFF3E8FFFFF2
          E6FFFFF2E6FFFFF1E4FFFFF1E4FFFFF0E2FFFFF0E2FFFFEFE0FFFFEFE0FFFFEE
          DEFFFFEEDEFFFFEDDCFFFFEDDCFFFEECDAFFFEECDAFFFEEBD8FFFEEBD8FFFEEA
          D6FFFEEAD6FFFEE9D4FFFEE9D4FFFEE8D2FFFEE7D0FFFEE7D0FFF2D6B5FFF2D6
          B5FFF2D6B5FFF2D6B5FFF2D6B5FFF2D6B5FFE7C8A0FFFFBC81FF734A007C734A
          004F000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF4EAFFFFF4EAFFFFF3E8FFFFF3
          E8FFFFF3E8FFFFF2E6FFFFF2E6FFFFF1E4FFFFF1E4FFFFF0E2FFFFF0E2FFFFEF
          E0FFFFEFE0FFFFEEDEFFFFEEDEFFFFEDDCFFFFEDDCFFFEECDAFFFEECDAFFFEEB
          D8FFFEEBD8FFFEEAD6FFFEEAD6FFFEE9D4FFFEE8D2FFE7CAA3FFE7CAA3FFE7CA
          A3FFE7CAA3FFE7CAA3FFE7CAA3FFE7CAA3FFE7CAA3FFFFBC81FF734A007C603E
          0042000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF5ECFFFFF5ECFFFFF4EAFFFFF4
          EAFFFFF3E8FFFFF3E8FFFFF2E6FFFFF2E6FFFFF1E4FFFFF1E4FFFFF0E2FFFFF0
          E2FFFFF0E2FFFFEFE0FFFFEFE0FFFFEEDEFFFFEEDEFFFFEDDCFFFFEDDCFFFEEC
          DAFFFEECDAFFFEEBD8FFFEEBD8FFFEEAD6FFFFCDA9FFFFBC81FFFFBC81FFFFBC
          81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FFFFBC81FF603E00675034
          0037000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF6EEFFFFF6EEFFFFF5ECFFFFF5
          ECFFFFF4EAFFFFF4EAFFFFF3E8FFFFF3E8FFFFF2E6FFFFF2E6FFFFF1E4FFFFF1
          E4FFFFF0E2FFFFF0E2FFFFEFE0FFFFEFE0FFFFEEDEFFFFEEDEFFFFEDDCFFFFED
          DCFFFFEDDCFFFEECDAFFFEECDAFFFEEBD8FFFFC495FFFFD5BAFFFFD1B2FFFFD1
          B2FFFFD1B2FFFFD1B2FFFFD1B2FFFFD1B2FFFFD1B2FFFFBC81FF2F1E0031120C
          000C000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF7F0FFFFF7F0FFFFF6EEFFFFF6
          EEFFFFF5ECFFFFF5ECFFFFF4EAFFFFF4EAFFFFF3E8FFFFF3E8FFFFF2E6FFFFF2
          E6FFFFF1E4FFFFF1E4FFFFF0E2FFFFF0E2FFFFEFE0FFFFEFE0FFFFEEDEFFFFEE
          DEFFFFEDDCFFFFEDDCFFFEECDAFFFEECDAFFFFC495FFFFDBC3FFFFD5BAFFFFD5
          BAFFFFD5BAFFFFD5BAFFFFD5BAFFFFD5BAFFE7C8A0FF0A08060A0C08000A0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF8F2FFFFF7F0FFFFF7F0FFFFF7
          F0FFFFF6EEFFFFF6EEFFFFF5ECFFFFF5ECFFFFF4EAFFFFF4EAFFFFF3E8FFFFF3
          E8FFFFF2E6FFFFF2E6FFFFF1E4FFFFF1E4FFFFF0E2FFFFF0E2FFFFEFE0FFFFEF
          E0FFFFEEDEFFFFEEDEFFFFEDDCFFFFEDDCFFFFC495FFFFDBC3FFFFDBC3FFFFDB
          C3FFFFDBC3FFFFDBC3FFFFDBC3FFE7C9A1FF000000000000000000000000432B
          0007000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFF9F4FFFFF8F2FFFFF8F2FFFFF7
          F0FFFFF7F0FFFFF6EEFFFFF6EEFFFFF5ECFFFFF5ECFFFFF4EAFFFFF4EAFFFFF4
          EAFFFFF3E8FFFFF3E8FFFFF2E6FFFFF2E6FFFFF1E4FFFFF1E4FFFFF0E2FFFFF0
          E2FFFFEFE0FFFFEFE0FFFFEEDEFFFFEEDEFFFFC495FFFFE1CEFFFFE1CEFFFFDB
          C3FFFFDBC3FFFFDBC3FFFFBC81FF000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFCD9DFFFFFAF6FFFFF9F4FFFFF9F4FFFFF8
          F2FFFFF8F2FFFFF7F0FFFFF7F0FFFFF6EEFFFFF6EEFFFFF5ECFFFFF5ECFFFFF4
          EAFFFFF4EAFFFFF3E8FFFFF3E8FFFFF2E6FFFFF2E6FFFFF1E4FFFFF1E4FFFFF1
          E4FFFFF0E2FFFFF0E2FFFFEFE0FFFFEFE0FFFFC495FFFFEADCFFFFE1CEFFFFE1
          CEFFFFDBC3FFFFBC81FF00000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFD9B3FFFFFBF7FFFFFAF6FFFFFAF6FFFFF9
          F4FFFFF9F4FFFFF8F2FFFFF8F2FFFFF7F0FFFFF7F0FFFFF6EEFFFFF6EEFFFFF5
          ECFFFFF5ECFFFFF4EAFFFFF4EAFFFFF3E8FFFFF3E8FFFFF2E6FFFFF2E6FFFFF1
          E4FFFFF1E4FFFFF0E2FFFFF0E2FFFFEFE0FFFFC495FFFFEADCFFFFEADCFFFFE1
          CEFFFFBC81FF0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFDFBEFFFFFBF7FFFFFBF7FFFFFAF6FFFFFA
          F6FFFFFAF6FFFFF9F4FFFFF9F4FFFFF8F2FFFFF8F2FFFFF7F0FFFFF7F0FFFFF6
          EEFFFFF6EEFFFFF5ECFFFFF5ECFFFFF4EAFFFFF4EAFFFFF3E8FFFFF3E8FFFFF2
          E6FFFFF2E6FFFFF1E4FFFFF1E4FFFFF0E2FFFFC495FFFFF5EEFFFFEADCFFFFBC
          81FF000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFE2C4FFFFE4C9FFFFFCF9FFFFFBF7FFFFFB
          F7FFFFFAF6FFFFFAF6FFFFF9F4FFFFF9F4FFFFF8F2FFFFF8F2FFFFF7F0FFFFF7
          F0FFFFF7F0FFFFF6EEFFFFF6EEFFFFF5ECFFFFF5ECFFFFF4EAFFFFF4EAFFFFF3
          E8FFFFF3E8FFFFF2E6FFFFF2E6FFFFF1E4FFFFC495FFFFF5EEFFFFBC81FF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFE4C982FFE2C4FFFFDFBEFFFFD9B3FFFFCD
          9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFF000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFFFFFFFFFF0000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000010000FFC0000000010000FFC0000000010000FFC0000000010000FFC0
          000000030000FFC00000001D0000FFC00000003F0000FFC00000007F0000FFC0
          000000FF0000FFC0000001FF0000FFC0000003FF0000FFC0000007FF0000FFFF
          FFFFFFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFB658FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF
          9F15FF9F15FF9F15000000000000000000FFCD9DFEDDBBFEDAB5FEDAB5FED7B0
          FED7B0FED4ABFED4ABFED2A6FED2A6FECFA2FECFA2FF9F150000000000000000
          00FFCD9DFEDFC1A95022A95022A94F21A94F21A94F20A94F20A94E1FA94E1FCE
          8759FED2A6FF9F15000000000000000000FFCD9DFEE2C7FEDFC1FEDFC1FEDDBB
          FEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFED2A6FF9F150000000000000000
          00FFCD9DFEE2C7A95124A95023A95023A95022A95022A94F21A94F21A94F20CE
          8A5FFED4ABFF9F15000000000000000000FFCD9DFEE5CDFEE5CDFEE2C7FEE2C7
          FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FF9F150000000000000000
          00FFCD9DFEE8D2A95226A95125A95125A95124A95124A95023A95023A95022CE
          8D64FEDAB5FF9F15000000000000000000FFCD9DFEEBD8FEEBD8FEE8D2FEE8D2
          FEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFF9F150000000000000000
          00FFCD9DFFEEDE983B0DFEEBD8983B0DFEE8D2A95125BA7048C98862CE906BCE
          8E68FEDFC1FF9F15000000000000000000FFCD9DFFF1E4983B0E983B0E983B0D
          FEEBD8FEE8D2FEE8D2FBE1BFFF9F15FF9F15FF9F15FF9F150000000000000000
          00FFCD9DFFF4EA983B0EFFF1E4983B0EFFEEDEA95327FEEBD8F8C88AF4D1ACF5
          BD83F6B677FF9F15000000000000000000FFCD9DFFF4EAFFF4EA983B0EFFF1E4
          FFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4D1ACFF9F150000000000000000000000
          00FFCD9DFFECD6FFF7F0FFF4EAFFF4EAFFF1E4FFF1E4FFEEDEF8C88AFDDEBFFF
          B658000000000000000000000000000000FFCD9DFFCD9DFFCD9DFFCD9DFFCD9D
          FFCD9DFFCD9DFFCD9DFFCD9DFFCD9D0000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008003000080030000800300008003
          0000800300008003000080030000800300008003000080030000800300008007
          0000800F0000801F0000FFFF0000280000001000000020000000010020000000
          00004000000000000000000000000000000000000000000000006C491C2C7E55
          1F5A754F1D62895C217B7F5418877F5418877F5418877F5418877F5418877F54
          18877F5418877F5418877F541887845920680000000000000000FFB658FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FF7F5418870000000000000000FFCD9DFFFEDD
          BBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2A6FFFED2
          A6FFFECFA2FFFECFA2FFFF9F15FF7F5418870000000000000000FFCD9DFFFEDF
          C1FFC04D13FFC04D13FFC04D12FFC04D12FFC04D12FFC04D12FFC04C11FFC04C
          11FFD06F38FFFED2A6FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE2
          C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7
          B0FFFED4ABFFFED2A6FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE2
          C7FFC04E14FFC04E14FFC04E14FFC04D13FFC04D13FFC04D12FFC04D12FFC04D
          12FFD0713BFFFED4ABFFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE5
          CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDA
          B5FFFEDAB5FFFED7B0FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE8
          D2FFC04E15FFC04E15FFC04E15FFC04E14FFC04E14FFC04E14FFC04E14FFC04D
          13FFD0733FFFFEDAB5FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEEB
          D8FFFEEBD8FFFEE8D2FFFEE8D2FFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDF
          C1FFFEDDBBFFFEDDBBFFFF9F15FF895C217B1A130C0800000000FFCD9DFFFFEE
          DEFFC04F17FFFEEBD8FFC04F16FFFEE8D2FFC04F16FFCC6C39FFDC9165FFDC91
          65FFDC9062FFFEDFC1FFFF9F15FF775121641A130C0800000000FFCD9DFFFFF1
          E4FFC05018FFC05018FFC04F17FFFEEBD8FFFEE8D2FFFEE8D2FFFBE1BFFFFF9F
          15CBFF9F15CBFF9F15CBFF9F15FF907150620000000900000000FFD9B3FFFFF4
          EAFFC05018FFFFF1E4FFC05018FFFFEEDEFFC04F17FFFEEBD8FFF8C88AFFF4D1
          ACFFF5BD83FFF6B677FFFF9F15FF9F774D370000000000000000FFDFBEFFFFF4
          EAFFFFF4EAFFC05018FFFFF1E4FFFFEEDEFFFFEEDEFFFEEBD8FFF8C88AFFF5D6
          B2E9F4D1ACFFFF9F15FFFF9F152E000000000000000000000000FFE2C4FFFFEC
          D6FFFFF7F0FFFFF4EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFF8C88AFFFCEE
          DEDBFFB658FFC47A102300000000000000000000000000000000FFE4C982FFE2
          C4FFFFDFBEFFFFD9B3FFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFF975E0C1B0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000080010000800100008001
          0000800000008000000080000000800000008000000080000000800000008000
          0000800100008003000080070000800F0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000FFB658FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF
          9F15FF9F15FF9F15FF9F15000000000000000000FFCD9DFEDDBBFEDAB5FEDAB5
          FED7B0FED7B0FED4ABFED4ABFED2A6FED2A6FECFA2FECFA2FF9F150000000000
          00000000FFCD9DFEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFE
          D4ABFED2A6FED2A6FF9F15000000000000000000FFCD9DFEE2C7FEDFC1FEDFC1
          FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFED2A6FF9F150000000000
          00000000FFCD9DFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FE
          D7B0FED7B0FED4ABFF9F15000000000000000000FFCD9DFEE5CDFEE5CDFEE2C7
          FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FF9F150000000000
          00000000FFCD9DFEE8D2FEE8D2FEE5CDFEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FE
          DDBBFEDDBBFEDAB5FF9F15000000000000000000FFCD9DFEEBD8FEEBD8FEE8D2
          FEE8D2FEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFF9F150000000000
          00000000FFCD9D0000FFFEEBD8FEEBD8FEE8D2FEE8D2FEE5CDFEE5CDFEE2C7FE
          E2C7FEDFC1FEDFC1FF9F150000000000000000FFFFCD9D0000FFFFEEDE0000FF
          FEEBD8FEEBD8FEE8D2FEE8D2FBE1BFFF9F15FF9F15FF9F15FF9F150000000000
          00000000005CFF00E9FF004DFFFFF1E4FFEEDEFFEEDEFEEBD8FEEBD8F8C88AF4
          D1ACF5BD83F6B677FF9F150000000000FF0000FF00E9FF00FFFF00E9FF0000FF
          0000FFFFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4D1ACFF9F150000000000000000
          00000000006AFF00E9FF006AFFFFF4EAFFF4EAFFF1E4FFF1E4FFEEDEF8C88AFC
          EEDEFFB6580000000000000000000000000000FFFFE4C90000FFFFDFBE0000FF
          FFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9D0000000000000000000000000000
          000000000000000000FF00000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF0000C0010000C0010000C0010000C001
          0000C0010000C0010000C0010000C0010000C001000080010000C00100000003
          0000C0070000800F0000EFFF0000280000001000000020000000010020000000
          0000400000000000000000000000000000000000000000000000000000006C49
          1C137E551F27754F1D2A895C21357F54183A7F54183A7F54183A7F54183A7F54
          183A7F54183A7F54183A7F54183A7F54183A845920220000000000000000FFB6
          58FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FF7F54183A0000000000000000FFCD
          9DFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2
          A6FFFED2A6FFFECFA2FFFECFA2FFFF9F15FF7F54183A0000000000000000FFCD
          9DFFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4
          ABFFFED4ABFFFED2A6FFFED2A6FFFF9F15FF7F54183A0000000000000000FFCD
          9DFFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7
          B0FFFED7B0FFFED4ABFFFED2A6FFFF9F15FF7F54183A0000000000000000FFCD
          9DFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDA
          B5FFFED7B0FFFED7B0FFFED4ABFFFF9F15FF7F54183A0000000000000000FFCD
          9DFFFEE5CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDD
          BBFFFEDAB5FFFEDAB5FFFED7B0FFFF9F15FF7F54183A0000000000000000FFCD
          9DFFFEE8D2FFFEE8D2FFFEE5CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDF
          C1FFFEDDBBFFFEDDBBFFFEDAB5FFFF9F15FF7F54183A0000000000000000FFCD
          9DFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8D2FFFEE5CDFFFEE2C7FFFEE2C7FFFEDF
          C1FFFEDFC1FFFEDDBBFFFEDDBBFFFF9F15FF895C21350000000000000001DDB2
          88FD3E3AF7FCD4C4B4FDDBCBBAFFFEE8D2FFFEE8D2FFFEE5CDFFFEE5CDFFFEE2
          C7FFFEE2C7FFFEDFC1FFFEDFC1FFFF9F15FF7751212C0000000F0000FFFFCFA6
          AFFB0000FFFFCFC1E4FB0000FFFFE2D1C0F9FEEBD8FFFEE8D2FFFEE8D2FFFBE1
          BFFFFF9F15F9FF9F15ECFF9F15E9FF9F15FF9071502A0000001A0000FF3F005C
          FFFF00E9FFFF004DFFFFCFC4E9FFDACBBEF7FFEEDEFFFEEBD8FFFEEBD8FFF8C8
          8AFFF4D1ACFFF5BD83FFF6B677FFFF9F15FF9F774D200000FF920000FFFF00E9
          FFFF00FFFFFF00E9FFFF0000FFFF302DFAF6FFEEDEFFFFEEDEFFFEEBD8FFF8C8
          8AFFF5D6B2F5F4D1ACFFFF9F15FFFF9F152E00000000000000000000FF3C006A
          FFFF00E9FFFF006AFFFFCFC6EEFFDCD3CAF8FFF1E4FFFFF1E4FFFFEEDEFFF8C8
          8AFFFCEEDEF4FFB658FFC47A10230000000000000000000000010000FFFFC1AD
          D6FF0000FFFFC1A9CEFF0000FFFFDDB288FDFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFFFFCD9DFF975E0C1B00000000000000000000000000000000000000010000
          00000000FFA80000000900000001000000000000000000000000000000000000
          00000000000000000000000000000000000000000000C0000000C0000000C000
          0000C0000000C0000000C0000000C0000000C0000000C0000000800000000000
          000000000000000100008003000000070000A3FF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFB658FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF
          9F15FF9F15FF9F15000000000000000000FFCD9DFEDDBBFEDAB5FEDAB5FED7B0
          FED7B0FED4ABFED4ABFED2A6FED2A6FECFA2FECFA2FF9F150000000000000000
          00FFCD9DFEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFED4ABFE
          D2A6FED2A6FF9F15000000000000000000FFCD9D46CF5747D0573DAA7A47D057
          47D05747CF5747CF5747CF5747CF5747CF5747CF56FF9F150000000000000000
          00FFCD9D4FCA6E55A7872B44D944A47D65CC6665CC6655A68655A68665CB6565
          CB654FCA6CFF9F15000000000000000000FFCD9DE1D68765CD6955A787718891
          65CC67C9B09A3050CF222EEC55A68665CB664FCA6DFF9F150000000000000000
          00FFCD9DE7DFA0FAE8B2FAE8B1728B9A477996F7D981A490AFA490AFF7D87FCB
          DD97C8DC92FF9F15000000000000000000FFCD9DF7F4DCFDF7E5DBE6C8728FAB
          487A9BF6D778F7D981F7D880A8E1AB76E7C55DE9D1FF9F150000000000000000
          00FFCD9DFBF7E6E9F1E2ADD3B054A66965AF73AEC06AF6D778A7E0A657EBD742
          EDE032EFEAFF9F15000000000000000000FFCD9DFDFDFAC1DAB85BA96C419D5B
          48A05D71AC62ACCF8B65E9D0FF9F15FF9F15FF9F15FF9F150000000000000000
          00FFD9B3E1D788C2CE888DBA7460A9635FA860A1C0736DE7C9F8C88AF4D1ACF5
          BD83F6B677FF9F15000000000000000000FFDFBEFFF4EAFFF4EAFFF1E4FFF1E4
          FFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4D1ACFF9F150000000000000000000000
          00FFE2C4FFECD6FFF7F0FFF4EAFFF4EAFFF1E4FFF1E4FFEEDEF8C88AFCEEDEFF
          B658000000000000000000000000000000FFE4C9FFE2C4FFDFBEFFD9B3FFCD9D
          FFCD9DFFCD9DFFCD9DFFCD9DFFCD9D0000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008003000080030000800300008003
          0000800300008003000080030000800300008003000080030000800300008007
          0000800F0000801F0000FFFF0000280000001000000020000000010020000000
          0000400000000000000000000000000000000000000000000000895C212C895C
          215A895C2162895C217B895C2187895C2187895C2187895C2187895C2187895C
          2187895C2187895C2187895C2187895C21680000000000000000FFB658FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FF895C21870000000000000000FFCD9DFFFEDD
          BBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2A6FFFED2
          A6FFFECFA2FFFECFA2FFFF9F15FF895C21870000000000000000FFCD9DFFFEDF
          C1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4
          ABFFFED2A6FFFED2A6FFFF9F15FF895C2187895C210800000000FFCD9DFF46CF
          57FF47D057FF3DAA7AFF47D057FF47D057FF47CF57FF47CF57FF47CF57FF47CF
          57FF47CF57FF47CF56FFFF9F15FF895C2187895C210800000000FFCD9DFF4FCA
          6EFF55A787FF2B44D9FF44A47DFF65CC66FF65CC66FF55A686FF55A686FF65CB
          65FF65CB65FF4FCA6CFFFF9F15FF895C2187895C210800000000FFCD9DFFE1D6
          87FF65CD69FF55A787FF718891FF65CC67FFC9B09AFF3050CFFF222EECFF55A6
          86FF65CB66FF4FCA6DFFFF9F15FF895C2187895C210800000000FFCD9DFFE7DF
          A0FFFAE8B2FFFAE8B1FF728B9AFF477996FFF7D981FFA490AFFFA490AFFFF7D8
          7FFFCBDD97FFC8DC92FFFF9F15FF895C2187895C210800000000FFCD9DFFF7F4
          DCFFFDF7E5FFDBE6C8FF728FABFF487A9BFFF6D778FFF7D981FFF7D880FFA8E1
          ABFF76E7C5FF5DE9D1FFFF9F15FF895C217B895C210800000000FFCD9DFFFBF7
          E6FFE9F1E2FFADD3B0FF54A669FF65AF73FFAEC06AFFF6D778FFA7E0A6FF57EB
          D7FF42EDE0FF32EFEAFFFF9F15FF895C2164895C210800000000FFCD9DFFFDFD
          FAFFC1DAB8FF5BA96CFF419D5BFF48A05DFF71AC62FFACCF8BFF65E9D0FFFF9F
          15CBFF9F15CBFF9F15CBFF9F15FF895C21620000000900000000FFD9B3FFE1D7
          88FFC2CE88FF8DBA74FF60A963FF5FA860FFA1C073FF6DE7C9FFF8C88AFFF4D1
          ACFFF5BD83FFF6B677FFFF9F15FF895C21370000000000000000FFDFBEFFFFF4
          EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFFFEEDEFFFEEBD8FFF8C88AFFF5D6
          B2E9F4D1ACFFFF9F15FFFF9F152E000000000000000000000000FFE2C4FFFFEC
          D6FFFFF7F0FFFFF4EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFF8C88AFFFCEE
          DEDBFFB658FFC47A102300000000000000000000000000000000FFE4C982FFE2
          C4FFFFDFBEFFFFD9B3FFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFF975E0C1B0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000080010000800100008001
          0000800000008000000080000000800000008000000080000000800000008000
          0000800100008003000080070000800F0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          000000000000000000088888888080000008FFFFFF8087777778FF2FFF808FFF
          FFF8F222FF808FFFFFF872F22F808FFFFFF87FFF27808FFFFFF8FFFFF7808FFF
          FFF8888888808FFFFFFFFF7700008FFFFFFFF88800008FFFFFFF800000008FFF
          FFFF8FFF00008FFFFFFF8FF000008FFFFFFF8F0000008888888880000000FFFF
          8888FE0188880001888800018888000188880001888800018888000188880001
          888800078888000788880007888800078888000F8888001F8888003F88882800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2
          C2C2C2000000FFB658FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15C2C2C2FFFF
          FFFFFFFFE4F8EAFFFFFFFFFFFFFFFFFFC2C2C2000000FFCD9DFEDDBBFEDAB5FE
          DAB5FED7B0FED7B0FED4ABC2C2C2FFFFFFE4F8EA00B93DE4F8EAFFFFFFFFFFFF
          C2C2C2000000FFCD9DFEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0C2C2C2E4F8
          EA00C84200B93D00B93DE4F8EAFFFFFFC2C2C2000000FFCD9DFEE2C7FEDFC1FE
          DFC1FEDDBBFEDDBBFEDAB5C2C2C2CCF1D800D045FFFFFF00B93D00B93DE4F8EA
          C2C2C2000000FFCD9DFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBC2C2C2CCF1
          D8FFFFFFFFFFFFFFFFFF00B93DB6EBC8C2C2C2000000FFCD9DFEE5CDFEE5CDFE
          E2C7FEE2C7FEDFC1FEDFC1C2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB6EBC8
          C2C2C2000000FFCD9DFEE8D2FEE8D2FEE5CDFEE5CDFEE2C7FEE2C7C2C2C2C2C2
          C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2C2000000FFCD9DFEEBD8FEEBD8FE
          E8D2FEE8D2FEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFF9F15000000
          000000000000FFCD9DFFEEDEFEEBD8FEEBD8FEE8D2FEE8D2FEE5CDFEE5CDFEE2
          C7FEE2C7FEDFC1FEDFC1FF9F15000000000000000000FFCD9DFFF1E4FFEEDEFF
          EEDEFEEBD8FEEBD8FEE8D2FEE8D2FBE1BFFF9F15FF9F15FF9F15FF9F15000000
          000000000000FFD9B3FFF4EAFFF1E4FFF1E4FFEEDEFFEEDEFEEBD8FEEBD8F8C8
          8AF4D1ACF5BD83F6B677FF9F15000000000000000000FFDFBEFFF4EAFFF4EAFF
          F1E4FFF1E4FFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4D1ACFF9F15000000000000
          000000000000FFE2C4FFECD6FFF7F0FFF4EAFFF4EAFFF1E4FFF1E4FFEEDEF8C8
          8AFCEEDEFFB658000000000000000000000000000000FFE4C9FFE2C4FFDFBEFF
          D9B3FFCD9DFFCD9DFFCD9DFFCD9DFFCD9DFFCD9D000000000000000000000000
          000000000000FFFFC9FFFE01C9FF0001C9FF0001C9FF0001C9FF0001C9FF0001
          C9FF0001C9FF0001C9FF0007C9FF0007C9FF0007C9FF0007C9FF000FC9FF001F
          C9FF003FC9FF2800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000190000001900000019000000190000
          001900000019000000190000000D6C491C137E551F27754F1D2A895C21357F54
          183A7F54183A7F54183AC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC2C2C2FFC2C2C2FF1A130C1FFFB658FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFC2C2C2FFFFFFFFFFFFFFFFFFE4F8EAFFFFFFFFFFFFFF
          FFFFFFFFFFFFC2C2C2FF1A130C1FFFCD9DFFFEDDBBFFFEDAB5FFFEDAB5FFFED7
          B0FFFED7B0FFFED4ABFFC2C2C2FFFFFFFFFFE4F8EAFF00B93DFFE4F8EAFFFFFF
          FFFFFFFFFFFFC2C2C2FF1A130C1FFFCD9DFFFEDFC1FFFEDDBBFFFEDDBBFFFEDA
          B5FFFEDAB5FFFED7B0FFC2C2C2FFE4F8EAFF00C842FF00B93DFF00B93DFFE4F8
          EAFFFFFFFFFFC2C2C2FF1A130C1FFFCD9DFFFEE2C7FFFEDFC1FFFEDFC1FFFEDD
          BBFFFEDDBBFFFEDAB5FFC2C2C2FFCCF1D8FF00D045FFFFFFFFFF00B93DFF00B9
          3DFFE4F8EAFFC2C2C2FF1A130C1FFFCD9DFFFEE2C7FFFEE2C7FFFEDFC1FFFEDF
          C1FFFEDDBBFFFEDDBBFFC2C2C2FFCCF1D8FFFFFFFFFFFFFFFFFFFFFFFFFF00B9
          3DFFB6EBC8FFC2C2C2FF1A130C1FFFCD9DFFFEE5CDFFFEE5CDFFFEE2C7FFFEE2
          C7FFFEDFC1FFFEDFC1FFC2C2C2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFFB6EBC8FFC2C2C2FF1A130C1FFFCD9DFFFEE8D2FFFEE8D2FFFEE5CDFFFEE5
          CDFFFEE2C7FFFEE2C7FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2C2FFC2C2
          C2FFC2C2C2FFC2C2C2FF1A130C06FFCD9DFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8
          D2FFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFF9F
          15FF895C2135000000001A130C06FFCD9DFFFFEEDEFFFEEBD8FFFEEBD8FFFEE8
          D2FFFEE8D2FFFEE5CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFF9F
          15FF7751212C0000000000000007FFCD9DFFFFF1E4FFFFEEDEFFFFEEDEFFFEEB
          D8FFFEEBD8FFFEE8D2FFFEE8D2FFFBE1BFFFFF9F15F9FF9F15ECFF9F15E9FF9F
          15FF9071502A0000000000000000FFD9B3FFFFF4EAFFFFF1E4FFFFF1E4FFFFEE
          DEFFFFEEDEFFFEEBD8FFFEEBD8FFF8C88AFFF4D1ACFFF5BD83FFF6B677FFFF9F
          15FF9F774D200000000000000000FFDFBEFFFFF4EAFFFFF4EAFFFFF1E4FFFFF1
          E4FFFFEEDEFFFFEEDEFFFEEBD8FFF8C88AFFF5D6B2F5F4D1ACFFFF9F15FFFF9F
          152E000000000000000000000000FFE2C4FFFFECD6FFFFF7F0FFFFF4EAFFFFF4
          EAFFFFF1E4FFFFF1E4FFFFEEDEFFF8C88AFFFCEEDEF4FFB658FFC47A10230000
          0000000000000000000000000000FFE4C982FFE2C4FFFFDFBEFFFFD9B3FFFFCD
          9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFF975E0C1B000000000000
          0000000000000000000000000000FF00C9820000C9820000C9820000C9820000
          C9820000C9820000C9820000C9820000C9820002C9820002C9820003C9820003
          C9820007C982000FC982001FC982}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00FFB658FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF9F15FF
          9F15FF9F15FF9F15000000000000000000FFCD9DFEDDBBFEDAB5FEDAB5FED7B0
          FED7B0FED4ABFED4ABFED2A6FED2A6FECFA2FECFA2FF9F150000000000000000
          00FFCD9DFEDFC189503D89503D894F3A894F3A894E38894E38894E36894E36A9
          7154FED2A6FF9F15000000000000000000FFCD9DFEE2C7FEDFC1FEDFC1FEDDBB
          FEDDBBFEDAB5FEDAB5FED7B0FED7B0FED4ABFED2A6FF9F150000000000000000
          00FFCD9DFEE2C797635097624E97624E97614C97614C976049976049975E46BF
          8D6FFED4ABFF9F15000000000000000000FFCD9DFEE5CDFEE5CDFEE2C7FEE2C7
          FEDFC1FEDFC1FEDDBBFEDDBBFEDAB5FEDAB5FED7B0FF9F150000000000000000
          00FFCD9DFEE8D2A97D6A976452A97A67976350A9796497624EA9776297614CDB
          B395FEDAB5FF9F15000000000000000000FFCD9DFEEBD8FEEBD8FEE8D2FEE8D2
          FEE5CDFEE2C7FEE2C7FEDFC1FEDFC1FEDDBBFEDDBBFF9F150000000000000000
          00FFCD9DFFEEDEA97D6DBF9A89A97D6ABF9985A97A67FEE5CDFEE2C7FEE2C7FE
          DFC1FEDFC1FF9F15000000000000000000FFCD9DFFF1E4FFEEDEFFEEDEFEEBD8
          FEEBD8FEE8D2FEE8D2FBE1BFFF9F15FF9F15FF9F15FF9F150000000000000000
          00FFD2A6FFF4EAC09E91C09E91C09C8DC09C8DBF9A89FEEBD8F8C88AF4D1ACF5
          BD83F6B677FF9F15000000000000000000FFD4ABFFF4EAFFF4EAFFF1E4FFF1E4
          FFEEDEFFEEDEFEEBD8F8C88AF5D6B2F4D1ACFF9F150000000000000000000000
          00FFD6ADFFECD6FFF7F0FFF4EAFFF4EAFFF1E4FFF1E4FFEEDEF8C88AFCEEDEFF
          B658000000000000000000000000000000FFD8B3FFDEBCFFDBB7FFD7AFFFCD9D
          FFCD9DFFCD9DFFCD9DFFCD9DFFCD9D0000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008003000080030000800300008003
          0000800300008003000080030000800300008003000080030000800300008007
          0000800F0000801F0000FFFF0000280000001000000020000000010020000000
          00004000000000000000000000000000000000000000000000006C491C2C7E55
          1F5A754F1D62895C217B7F5418877F5418877F5418877F5418877F5418877F54
          18877F5418877F5418877F541887845920680000000000000000FFB658FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F15FFFF9F
          15FFFF9F15FFFF9F15FFFF9F15FF7F5418870000000000000000FFCD9DFFFEDD
          BBFFFEDAB5FFFEDAB5FFFED7B0FFFED7B0FFFED4ABFFFED4ABFFFED2A6FFFED2
          A6FFFECFA2FFFECFA2FFFF9F15FF7F5418870000000000000000FFCD9DFFFEDF
          C1FF88463DFF88463DFF88463AFF88463AFF884438FF884438FF884436FF8844
          36FFA86A54FFFED2A6FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE2
          C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDAB5FFFEDAB5FFFED7B0FFFED7
          B0FFFED4ABFFFED2A6FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE2
          C7FF965B50FF965A4EFF965A4EFF96584CFF96584CFF965849FF965849FF9656
          46FFBF886FFFFED4ABFFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE5
          CDFFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDFC1FFFEDDBBFFFEDDBBFFFEDA
          B5FFFEDAB5FFFED7B0FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEE8
          D2FFA8756AFF965C52FFA87367FF965B50FFA87264FF965A4EFFA87162FF9658
          4CFFDBB095FFFEDAB5FFFF9F15FF7F5418871A130C0800000000FFCD9DFFFEEB
          D8FFFEEBD8FFFEE8D2FFFEE8D2FFFEE5CDFFFEE2C7FFFEE2C7FFFEDFC1FFFEDF
          C1FFFEDDBBFFFEDDBBFFFF9F15FF895C217B1A130C0800000000FFCD9DFFFFEE
          DEFFA8776DFFBF9589FFA8756AFFBF9385FFA87367FFFEE5CDFFFEE2C7FFFEE2
          C7FFFEDFC1FFFEDFC1FFFF9F15FF775121641A130C0800000000FFCD9DFFFFF1
          E4FFFFEEDEFFFFEEDEFFFEEBD8FFFEEBD8FFFEE8D2FFFEE8D2FFFBE1BFFFFF9F
          15CBFF9F15CBFF9F15CBFF9F15FF907150620000000900000000FFD9B3FFFFF4
          EAFFBF9991FFBF9991FFBF968DFFBF968DFFBF9589FFFEEBD8FFF8C88AFFF4D1
          ACFFF5BD83FFF6B677FFFF9F15FF9F774D370000000000000000FFDFBEFFFFF4
          EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFFFEEDEFFFEEBD8FFF8C88AFFF5D6
          B2E9F4D1ACFFFF9F15FFFF9F152E000000000000000000000000FFE2C4FFFFEC
          D6FFFFF7F0FFFFF4EAFFFFF4EAFFFFF1E4FFFFF1E4FFFFEEDEFFF8C88AFFFCEE
          DEDBFFB658FFC47A102300000000000000000000000000000000FFE4C982FFE2
          C4FFFFDFBEFFFFD9B3FFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD9DFFFFCD
          9DFF975E0C1B0000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000080010000800100008001
          0000800000008000000080000000800000008000000080000000800000008000
          0000800100008003000080070000800F0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010002001010000001001800680300002600000010100000010020006804
          00008E030000280000001000000020000000010018000000000040FFFFFF0000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000FF5D31FF5725FF5725FF5725FF5725
          FF5725FF5725FF5725FF5725FF5725FF5725FF5725FF5725FF5D310000000000
          00FF5725F9E8CCF9E8CCF7E3BFF6DDB3F6DDB3F4D8A7F3D29BF3D29BF1CD8EF0
          C782F0C782F0C782FF5725000000000000FF5725B0D498AFD090AFD090F7E3BF
          B1D3B5B1D3B5AFCFACF4D8A7EDC06FEBBC66EBBC66F1CD8EFF57250000000000
          00FF5725B1D7A000B90000B900F9E8CCB1D7BD00B9B900B9B9F4D8A7EDC478DC
          9200DC9200F1CD8EFF5725000000000000FF5725B2DBA900B90000B900FAEED8
          B3DBC700B9B900B9B9F6DDB3EDC478DC9200DC9200F3D29BFF57250000000000
          00FF5725FDF8F0FDF8F0FCF3E4FAEED8FAEED8F9E8CCF7E3BFF7E3BFF6DDB3F4
          D8A7F4D8A7F4D8A7FF5725000000000000FF5725E4D5FDE2D0F2E2D0F2FCF3E4
          B3DBE3B3DBE3B3D6DAF9E8CCF9A389F99F80F99F80F6DDB3FF57250000000000
          00FF5725E4D3F95725FF5725FFFDF8F0B5DEEC00AAFF00AAFFF9E8CCFBA692FF
          2525FF2525F6DDB3FF5725000000000000FF5725E3D0F25725FF5725FFFFFEFD
          B6E2F400AAFF00AAFFFAEED8FBA692FF2525FF2525F7E3BFFF57250000000000
          00FF5725FEF8EFFEF8EFFFFCF8FFFEFDFFFEFDFDF8F0FCF3E4FCF3E4FAEED8F9
          E8CCF9E8CCF9E8CCFF5725000000000000FF673AFF6537FF6133FF5F31FF5B2D
          FF5627FE5020F84F20F44F20F24F20F24F20F24F20F24F20E7481C0000000000
          00FF7752FF714AFF6E47FF6B43FF6941FF653CFF6037FE5A30F85930F45830F2
          5830F25830F25830F25E38000000000000000000FF7752FF7752FF744FFF714B
          FF6F49FF6B44FF663FFE6038F85F38F45F38F45F38F25E380000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF0000FFFF000080010000800100008001
          0000800100008001000080010000800100008001000080010000800100008001
          000080010000C0030000FFFF0000280000001000000020000000010020000000
          0000400000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00090000000E0000000E0000000E0000000E0000000E0000000E0000000E0000
          000E0000000E0000000E0000000E000000090000000000000000FF5D31B6FF57
          25FEFF5725FEFF5725FEFF5725FEFF5725FEFF5725FEFF5725FEFF5725FEFF57
          25FEFF5725FEFF5725FEFF5725FBFF5D31820000000100000000FF5725FEF9E8
          CCFAF9E8CCFAF7E3BFFAF6DDB3FAF6DDB3FAF4D8A7FAF3D29BFAF3D29BFAF1CD
          8EFAF0C782FAF0C782FAF0C782EBFF5725FD0000000100000000FF5725FEB0D4
          98FCAFD090FCAFD090FCF7E3BFFAB1D3B5FBB1D3B5FBAFCFACFBF4D8A7FAEDC0
          6FFBEBBC66FBEBBC66FBF1CD8EEBFF5725FD0000000100000000FF5725FEB1D7
          A0FC00B900FF00B900FFF9E8CCFAB1D7BDFB00B9B9FF00B9B9FFF4D8A7FAEDC4
          78FBDC9200FFDC9200FFF1CD8EEBFF5725FD0000000100000000FF5725FEB2DB
          A9FC00B900FF00B900FFFAEED8FAB3DBC7FB00B9B9FF00B9B9FFF6DDB3FAEDC4
          78FBDC9200FFDC9200FFF3D29BEBFF5725FD0000000100000000FF5725FEFDF8
          F0FAFDF8F0FAFCF3E4FAFAEED8FAFAEED8FAF9E8CCFAF7E3BFFAF7E3BFFAF6DD
          B3FAF4D8A7FAF4D8A7FAF4D8A7EBFF5725FD0000000100000000FF5725FEE4D5
          FDFBE2D0F2FBE2D0F2FBFCF3E4FAB3DBE3FBB3DBE3FBB3D6DAFBF9E8CCFAF9A3
          89FBF99F80FBF99F80FBF6DDB3EBFF5725FD0000000100000000FF5725FEE4D3
          F9FB5725FFFF5725FFFFFDF8F0FAB5DEECFB00AAFFFF00AAFFFFF9E8CCFAFBA6
          92FBFF2525FFFF2525FFF6DDB3EBFF5725FD0000000100000000FF5725FEE3D0
          F2FB5725FFFF5725FFFFFFFEFDFAB6E2F4FB00AAFFFF00AAFFFFFAEED8FAFBA6
          92FBFF2525FFFF2525FFF7E3BFEBFF5725FD0000000100000000FF5725FEFEF8
          EFFAFEF8EFFAFFFCF8FAFFFEFDFAFFFEFDFAFDF8F0FAFCF3E4FAFCF3E4FAFAEE
          D8FAF9E8CCFAF9E8CCFAF9E8CCEBFF5725FD0000000100000000FF673AFFFF65
          37FEFF6133FEFF5F31FEFF5B2DFEFF5627FEFE5020FEF84F20FEF44F20FEF24F
          20FEF24F20FEF24F20FEF24F20FBE7481CFF0000000100000000FF7752E3FF71
          4AFCFF6E47FCFF6B43FCFF6941FCFF653CFCFF6037FCFE5A30FCF85930FCF458
          30FCF25830FCF25830FCF25830F3F25E38CA0000000000000000FF5D315EFF77
          52E3FF7752E3FF744FE3FF714BE3FF6F49E3FF6B44E3FF663FE3FE6038E3F85F
          38E3F45F38E3F45F38E3F25E38A0FF5D31230000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000000000000000000000000000000FFFF0000C00100008000
          0000800000008000000080000000800000008000000080000000800000008000
          000080000000800000008001000080010000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000000FF0000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          0000000000000000000000000000000000000000000002012121212121000202
          1212121212000201212121212100020212121212120002012121212121000202
          1212121212000201212121212100022000000000000002222222222200000022
          222000000000000000000000000000000000000000000000000000000000FFFF
          0000FFFF00008003000000010000000100000001000000010000000100000001
          0000000100000003000000070000800F0000C1FF0000FFFF0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000021C80020C40020C4001FBC001FBC001ABA001ABA001A
          BA0019B00019B00018AC0018AC0018AC0000000000000022CC5571FF0023D26D
          85FF516EFF516EFF516EFF516EFF516EFF516EFF516EFF2F51FF0736FF516EFF
          0018AC0000000022CC637DFF0024DA7D92FF6D85FF6D85FF6D85FF6D85FF6D85
          FF6D85FF6D85FF516EFF002EF2516EFF0018AC0000000022CC637DFF0024DA7D
          92FF6D85FF6D85FF6D85FF6D85FF6D85FF6D85FF6D85FF516EFF002EF2516EFF
          0018AC0000000022CC6F87FF0025DE899CFF9DADFF7D92FF7D92FF7D92FF7D92
          FF7D92FF7D92FF6D85FF002EF66D85FF0019B20000000023D27D92FF0025E09B
          ABFFB7C5FF9FB1FF9DADFF9DADFF899CFF899CFF899CFF7D92FF002FFA7D92FF
          001FBC0000000023D2899CFF0026E4A9B7FFB9C5FFB9C5FFB9C5FFB7C3FFB7C3
          FFA1B0FFA1B0FF899CFF002FFC899CFF001FBE0000000023D299ACFF0026E455
          71FFA9B7FFA9B7FFA9B7FFA9B7FFA9B7FFA9B7FFA9B7FF9BABFF2F56FF798FFF
          0021C80000000023D2B9C6FF91A6FF0026E40026E40025DE0025DE0024DC0024
          DC0023D60023D60021C80021C80021C80000000000000023D2738AFFD5DDFFD5
          DDFFC5D0FFC5D0FFC5D0FFC5D0FFC5D0FFC5D0FFC5D0FFB7C5FF0022CC000000
          0000000000000000000023D27B91FFE1E8FFD5DDFFD5DDFF738AFF0023D20023
          D20023D20022CC0022CC0000000000000000000000000000000000000023D200
          23D20023D20022CC0022CC000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000FFFF0000800300000001000000010000000100000001
          00000001000000010000000100000003000000070000800F0000C1FF0000FFFF
          0000FFFF00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000B00000024000000310000
          0031000000310000003100000031000000310000003100000031000000310000
          0031000000310000001400000000000000080021C8FF0020C4FF0020C4FF001F
          BCFF001FBCFF001ABAFF001ABAFF001ABAFF0019B0FF0019B0FF0018ACFF0018
          ACFF0018ACFF000000310000001B0022CCEA5571FFFF0023D2FF6D85FFFF516E
          FFFF516EFFFF516EFFFF516EFFFF516EFFFF516EFFFF516EFFFF2F51FFFF0736
          FFFF516EFFFF0018ACFF000000310022CCF5637DFFFF0024DAFF7D92FFFF6D85
          FFFF6D85FFFF6D85FFFF6D85FFFF6D85FFFF6D85FFFF6D85FFFF516EFFFF002E
          F2FF516EFFFF0018ACFF000000310022CCF5637DFFFF0024DAFF7D92FFFF6D85
          FFFF6D85FFFF6D85FFFF6D85FFFF6D85FFFF6D85FFFF6D85FFFF516EFFFF002E
          F2FF516EFFFF0018ACFF000000310022CCF56F87FFFF0025DEFF899CFFFF9DAD
          FFFF7D92FFFF7D92FFFF7D92FFFF7D92FFFF7D92FFFF7D92FFFF6D85FFFF002E
          F6FF6D85FFFF0019B2FF000000310023D2F57D92FFFF0025E0FF9BABFFFFB7C5
          FFFF9FB1FFFF9DADFFFF9DADFFFF899CFFFF899CFFFF899CFFFF7D92FFFF002F
          FAFF7D92FFFF001FBCFF000000310023D2F5899CFFFF0026E4FFA9B7FFFFB9C5
          FFFFB9C5FFFFB9C5FFFFB7C3FFFFB7C3FFFFA1B0FFFFA1B0FFFF899CFFFF002F
          FCFF899CFFFF001FBEFF000000310023D2F599ACFFFF0026E4FF5571FFFFA9B7
          FFFFA9B7FFFFA9B7FFFFA9B7FFFFA9B7FFFFA9B7FFFFA9B7FFFF9BABFFFF2F56
          FFFF798FFFFF0021C8FF0000000F0023D2F5B9C6FFFF91A6FFFF0026E4FF0026
          E4FF0025DEFF0025DEFF0024DCFF0024DCFF0023D6FF0023D6FF0021C8FF0021
          C8FF0021C8FF00030E37000000020023D2F5738AFFFFD5DDFFFFD5DDFFFFC5D0
          FFFFC5D0FFFFC5D0FFFFC5D0FFFFC5D0FFFFC5D0FFFFC5D0FFFFB7C5FFFF0022
          CCFF0000002400000000000000000000001C0023D2FF7B91FFFFE1E8FFFFD5DD
          FFFFD5DDFFFF738AFFFF0023D2FF0023D2FF0023D2FF0022CCFF0022CCFF0000
          0024000000000000000000000000000000000000001B0023D2FF0023D2FF0023
          D2FF0022CCFF0022CCFF00000024000000000000000000000000000000000000
          000000000000000000000000000000000000000000040000000B0000000B0000
          000B0000000B0000000B00000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008001000000000000000000000000
          0000000000000000000000000000000000000000000000000000000300000007
          000080FF000080FF0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          0000000000000000000000000000000000000000000000091919191910000901
          9191919191000909191919191900090191919191910009091919191919000990
          9191919191900990191919191910099900000000000009999999999900000099
          999000000000000000000000000000000000000000000000000000000000FFFF
          0000FFFF00008003000000030000000100000001000000010000000100000000
          0000000000000001000000070000800F0000C1FF0000FFFF0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000000000001DD0001CC8001CC8001BC0001BC00016BE0016BE0016
          BE0015B40015B40015B40015B0001DCE000000000000001DD0001FDE2342FF71
          85FF556DFF556DFF556DFF556DFF556DFF556DFF556DFF556DFF0023F8001DCE
          001DCE000000001DD02B49FF001FDE7588FF7185FF7185FF7185FF7185FF7185
          FF7185FF7185FF7185FF1133FF0022F2001DCE000000001DD04963FF001DD06B
          80FF7185FF7185FF7185FF7185FF7185FF7185FF7185FF7185FF2140FF0528FF
          001DCE000000001DD07387FF001DD0677CFFA1AEFF8193FF8193FF8193FF8193
          FF8193FF8193FF8193FF2947FF2140FF001DCE000000001ED68193FF001FDE4D
          66FFBBC6FFA3B2FFA1AEFFA1AEFF8D9DFF8D9DFF8D9DFF8D9DFF1B3BFF415CFF
          001DCE001DCE001ED68D9DFF435EFF001FDE8D9DFFBDC6FFBDC6FFBBC5FFBBC5
          FFA5B2FFA5B2FFA5B2FF2140FF8D9DFF1F3FFF001DCE001ED69DADFF8193FF00
          1DD03753FF677CFFADB9FFADB9FFADB9FFADB9FFADB9FFADB9FF2544FF7588FF
          2947FF001DCE001ED6BDC8FFB5BFFF7B8EFF0021E80020E20020E20020E00020
          E0001FDA001FDA001FDA001DCC001DCC001DCC000000001ED6778AFFD9DEFFD9
          DEFFC9D2FFC9D2FFC9D2FFC9D2FFC9D2FFC9D2FFC9D2FFBBC6FF001DD0000000
          000000000000000000001ED67F91FFE5EBFFD9DEFFD9DEFF778AFF001ED6001E
          D6001ED6001DD0001DD0000000000000000000000000000000000000001ED600
          1ED6001ED6001DD0001DD0000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000FFFF0000800300000001000000010000000100000001
          00000000000000000000000000000001000000070000800F0000C1FF0000FFFF
          0000FFFF00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000100020B01000224010002310100
          0231010002310100023101000231010002310100023101000231010002310100
          02310100021E000000000000000001000208001DD0F5001CC8FF001CC8FF001B
          C0FF001BC0FF0016BEFF0016BEFF0016BEFF0015B4FF0015B4FF0015B4FF0015
          B0FF001DCEFD000D4C2100000000001DD0F5001FDEF52342FFFB7185FFFF556D
          FFFF556DFFFF556DFFFF556DFFFF556DFFFF556DFFFF556DFFFF556DFFFF0023
          F8FF001DCCFF000C587B00031209001DD0F52B49FFFB001FDEF57588FFFE7185
          FFFF7185FFFF7185FFFF7185FFFF7185FFFF7185FFFF7185FFFF7185FFFF1133
          FFFF0022F2FF0019AECE00072A22001DD0F54963FFFD001DD0F56B80FFFD7185
          FFFF7185FFFF7185FFFF7185FFFF7185FFFF7185FFFF7185FFFF7185FFFF2140
          FFFF0528FFFF001DCEE1000D4C48001DD0F57387FFFF001DD0F5677CFFFDA1AE
          FFFF8193FFFF8193FFFF8193FFFF8193FFFF8193FFFF8193FFFF8193FFFF2947
          FFFF2140FFFF001DCEEA0011685E001ED6F58193FFFF001FDEF54D66FFFBBBC6
          FFFFA3B2FFFFA1AEFFFFA1AEFFFF8D9DFFFF8D9DFFFF8D9DFFFF8D9DFFFF1B3B
          FFFF415CFFFF001DCEFD00148E8F001ED6F58D9DFFFF435EFFFB001FDEF58D9D
          FFFFBDC6FFFFBDC6FFFFBBC5FFFFBBC5FFFFA5B2FFFFA5B2FFFFA5B2FFFF2140
          FFFF8D9DFFFF1F3FFFFF0019AEE6001ED6F59DADFFFF8193FFFD001DD0F53753
          FFFF677CFFFFADB9FFFFADB9FFFFADB9FFFFADB9FFFFADB9FFFFADB9FFFF2544
          FFFF7588FFFF2947FFFF001DCEFD001ED6F5BDC8FFFFB5BFFFFE7B8EFFFF0021
          E8FF0020E2FF0020E2FF0020E0FF0020E0FF001FDAFF001FDAFF001FDAFF001D
          CCFF001DCCFF001DCCFF001DD04B001ED6F5778AFFFFD9DEFFFFD9DEFFFFC9D2
          FFFFC9D2FFFFC9D2FFFFC9D2FFFFC9D2FFFFC9D2FFFFC9D2FFFFBBC6FFFF001D
          D0FF0100024501000218000000000100021C001ED6FF7F91FFFFE5EBFFFFD9DE
          FFFFD9DEFFFF778AFFFF001ED6FF001ED6FF001ED6FF001DD0FF001DD0FF0100
          0239010002160000000000000000000000000100021B001ED6FF001ED6FF001E
          D6FF001DD0FF001DD0FF01000224000000000000000000000000000000000000
          000000000000000000000000000000000000010002040100020B0100020B0100
          020B0100020B0100020B01000204000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008003000000010000000000000000
          0000000000000000000000000000000000000000000000000000000100000003
          000080FF000080FF0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          000000000000000000000000000000000000000000000B03B3B3B3B3B3000B0B
          3B3B3B3B3B000B03B3B3B3B3B3000B0B3B3B3B3B3B000B03B3B3B3B3B3000B0B
          3B3B3B3B3B000B03B3B3B3B3B3000BB00000000000000BBBBBBBBBBB000000BB
          BBB000000000000000000000000000000000000000000000000000000000FFFF
          0000FFFF00008003000000010000000100000001000000010000000100000001
          0000000100000003000000070000800F0000C1FF0000FFFF0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000004B1C604ADC204ADC204A4B904A4B904A1B704A1B704A1
          B70499AE0499AE0493A90493A90493A900000000000004B5CA67DFEF04BBD173
          EBFA59E8F959E8F959E8F959E8F959E8F959E8F959E8F943DBED22D4E559E8F9
          0494AA00000004B5CA75E2F004C1D782EEFB73EBFA73EBFA73EBFA73EBFA73EB
          FA73EBFA73EBFA59E8F916CEDE59E8F90494AA00000004B5CA75E2F004C1D782
          EEFB73EBFA73EBFA73EBFA73EBFA73EBFA73EBFA73EBFA59E8F916CEDE59E8F9
          0494AA00000004B5CA81E3F004C7DD90F0FBA2F2FB82EEFB82EEFB82EEFB82EE
          FB82EEFB82EEFB73EBFA1ACEDF73EBFA049AB000000004BBD18EE5F004C9DF9F
          F2FCBCF6FCA6F3FBA2F2FBA2F2FB90F0FB90F0FB90F0FB82EEFB1DCEDF82EEFB
          04A4B900000004BBD19BE7F004CCE3ADF4FCBCF6FDBCF6FDBCF6FDBAF6FDBAF6
          FDA7F3FCA7F3FC90F0FB1FCEDF90F0FB04A7BC00000004BBD1A8EAF104CCE361
          E5F4ADF4FCADF4FCADF4FCADF4FCADF4FCADF4FCADF4FC9FF2FC47DDEA80ECF9
          04B1C600000004BBD1C1F3F8A2E9F004CBE204CAE204C5DD04C5DD04C2D904C2
          D904BED404BED404B1C604B1C604B1C600000000000004BBD18AE1EBD8FBFED8
          FBFECAF9FDCAF9FDCAF9FDCAF9FDCAF9FDCAF9FDCAF9FDBBF7FD04B5CA000000
          00000000000000000004BBD191E2EBE4FDFED8FBFED8FBFE8AE1EB04BBD104BB
          D104BBD104B5CA04B5CA00000000000000000000000000000000000004BBD104
          BBD104BBD104B5CA04B5CA000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000FFFF0000800300000001000000010000000100000001
          00000001000000010000000100000003000000070000800F0000C1FF0000FFFF
          0000FFFF00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000B00000024000000310000
          0031000000310000003100000031000000310000003100000031000000310000
          00310000003100000014000000000000000804B1C6FF04ADC2FF04ADC2FF04A4
          B9FF04A4B9FF04A1B7FF04A1B7FF04A1B7FF0499AEFF0499AEFF0493A9FF0493
          A9FF0493A9FF000000310000001B04B5CAEA67DFEFFF04BBD1FF73EBFAFF59E8
          F9FF59E8F9FF59E8F9FF59E8F9FF59E8F9FF59E8F9FF59E8F9FF43DBEDFF22D4
          E5FF59E8F9FF0494AAFF0000003104B5CAF575E2F0FF04C1D7FF82EEFBFF73EB
          FAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF59E8F9FF16CE
          DEFF59E8F9FF0494AAFF0000003104B5CAF575E2F0FF04C1D7FF82EEFBFF73EB
          FAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF59E8F9FF16CE
          DEFF59E8F9FF0494AAFF0000003104B5CAF581E3F0FF04C7DDFF90F0FBFFA2F2
          FBFF82EEFBFF82EEFBFF82EEFBFF82EEFBFF82EEFBFF82EEFBFF73EBFAFF1ACE
          DFFF73EBFAFF049AB0FF0000003104BBD1F58EE5F0FF04C9DFFF9FF2FCFFBCF6
          FCFFA6F3FBFFA2F2FBFFA2F2FBFF90F0FBFF90F0FBFF90F0FBFF82EEFBFF1DCE
          DFFF82EEFBFF04A4B9FF0000003104BBD1F59BE7F0FF04CCE3FFADF4FCFFBCF6
          FDFFBCF6FDFFBCF6FDFFBAF6FDFFBAF6FDFFA7F3FCFFA7F3FCFF90F0FBFF1FCE
          DFFF90F0FBFF04A7BCFF0000003104BBD1F5A8EAF1FF04CCE3FF61E5F4FFADF4
          FCFFADF4FCFFADF4FCFFADF4FCFFADF4FCFFADF4FCFFADF4FCFF9FF2FCFF47DD
          EAFF80ECF9FF04B1C6FF0000000F04BBD1F5C1F3F8FFA2E9F0FF04CBE2FF04CA
          E2FF04C5DDFF04C5DDFF04C2D9FF04C2D9FF04BED4FF04BED4FF04B1C6FF04B1
          C6FF04B1C6FF001011370000000204BBD1F58AE1EBFFD8FBFEFFD8FBFEFFCAF9
          FDFFCAF9FDFFCAF9FDFFCAF9FDFFCAF9FDFFCAF9FDFFCAF9FDFFBBF7FDFF04B5
          CAFF0000002400000000000000000000001C04BBD1FF91E2EBFFE4FDFEFFD8FB
          FEFFD8FBFEFF8AE1EBFF04BBD1FF04BBD1FF04BBD1FF04B5CAFF04B5CAFF0000
          0024000000000000000000000000000000000000001B04BBD1FF04BBD1FF04BB
          D1FF04B5CAFF04B5CAFF00000024000000000000000000000000000000000000
          000000000000000000000000000000000000000000040000000B0000000B0000
          000B0000000B0000000B00000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008001000000000000000000000000
          0000000000000000000000000000000000000000000000000000000300000007
          000080FF000080FF0000FFFF0000}
      end
      item
        ImageFormat = ifICO
        ImgData = {
          0000010003001010100001000400280100003600000010100000010018006803
          00005E010000101000000100200068040000C604000028000000100000002000
          00000100040000000000C0000000000000000000000000000000000000000000
          0000000080000080000000808000800000008000800080800000C0C0C0008080
          80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
          000000000000000000000000000000000000000000000003B3B3B3B3B0000B0B
          3B3B3B3B3B000B03B3B3B3B3B3000B0B3B3B3B3B3B000B03B3B3B3B3B3000BB0
          3B3B3B3B3B300BB0B3B3B3B3B3B00BBB0000000000000BBBBBBBBBBB000000BB
          BBB000000000000000000000000000000000000000000000000000000000FFFF
          0000FFFF00008003000000030000000100000001000000010000000100000000
          0000000000000001000000070000800F0000C1FF0000FFFF0000FFFF00002800
          00001000000020000000010018000000000040FFFFFF00000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          00000000000000000004B5CA04ADC204ADC204A4B904A4B904A1B704A1B704A1
          B70499AE0499AE0499AE0493A904B2C700000000000004B5CA04C0D740CEE073
          EBFA59E8F959E8F959E8F959E8F959E8F959E8F959E8F959E8F91FC3D604B1C6
          00000000000004B5CA48D0E104C0D77AEAF873EBFA73EBFA73EBFA73EBFA73EB
          FA73EBFA73EBFA73EBFA2CCEE21BBFD404B2C700000004B5CA5ED9E804B5CA73
          E7F573EBFA73EBFA73EBFA73EBFA73EBFA73EBFA73EBFA73EBFA36D5E827C8DC
          04B2C700000004B5CA81E3F004B5CA73E4F1A2F2FB82EEFB82EEFB82EEFB82EE
          FB82EEFB82EEFB82EEFB3FD6E83ED0E104B2C700000004BBD18EE5F004C1D862
          DAE8BCF6FCA6F3FBA2F2FBA2F2FB90F0FB90F0FB90F0FB90F0FB35D1E355D8E9
          04B2C700000004BBD19BE7F05FD3E104C0D797E9F3BCF6FDBCF6FDBAF6FDBAF6
          FDA7F3FCA7F3FCA7F3FC3AD1E390F0FB3FCCDD04B2C704BBD1A8EAF18BE7F204
          B5CA4ED5E575E2EFADF4FCADF4FCADF4FCADF4FCADF4FCADF4FC40D2E380E6F2
          44D1E204B2C704BBD1C1F3F8BBF1F784E8F304CAE204C5DD04C5DD04C2D904C2
          D904BED404BED404BED404B1C604B1C604B1C600000004BBD18AE1EBD8FBFED8
          FBFECAF9FDCAF9FDCAF9FDCAF9FDCAF9FDCAF9FDCAF9FDBBF7FD04B5CA000000
          00000000000000000004BBD191E2EBE4FDFED8FBFED8FBFE8AE1EB04BBD104BB
          D104BBD104B5CA04B5CA00000000000000000000000000000000000004BBD104
          BBD104BBD104B5CA04B5CA000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          000000000000FFFF0000FFFF0000800300000003000000010000000100000001
          00000001000000000000000000000001000000070000800F0000C1FF0000FFFF
          0000FFFF00002800000010000000200000000100200000000000400000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000B00000024000000310000
          0031000000310000003100000031000000310000003100000031000000310000
          00310000001E00000000000000000000000804B5CAF504ADC2FF04ADC2FF04A4
          B9FF04A4B9FF04A1B7FF04A1B7FF04A1B7FF0499AEFF0499AEFF0499AEFF0493
          A9FF04B2C7FD034046210000000004B5CAF504C0D7F540CEE0FB73EBFAFF59E8
          F9FF59E8F9FF59E8F9FF59E8F9FF59E8F9FF59E8F9FF59E8F9FF59E8F9FF1FC3
          D6FF04B1C6FF034B537B030D0E0904B5CAF548D0E1FB04C0D7F57AEAF8FE73EB
          FAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF2CCE
          E2FF1BBFD4FF0397A9CE0321242204B5CAF55ED9E8FD04B5CAF573E7F5FD73EB
          FAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF73EBFAFF36D5
          E8FF27C8DCFF04B2C7E10340464804B5CAF581E3F0FF04B5CAF573E4F1FDA2F2
          FBFF82EEFBFF82EEFBFF82EEFBFF82EEFBFF82EEFBFF82EEFBFF82EEFBFF3FD6
          E8FF3ED0E1FF04B2C7EA0359625E04BBD1F58EE5F0FF04C1D8F562DAE8FBBCF6
          FCFFA6F3FBFFA2F2FBFFA2F2FBFF90F0FBFF90F0FBFF90F0FBFF90F0FBFF35D1
          E3FF55D8E9FF04B2C7FD037C898F04BBD1F59BE7F0FF5FD3E1FB04C0D7F597E9
          F3FFBCF6FDFFBCF6FDFFBAF6FDFFBAF6FDFFA7F3FCFFA7F3FCFFA7F3FCFF3AD1
          E3FF90F0FBFF3FCCDDFF0397A9E604BBD1F5A8EAF1FF8BE7F2FD04B5CAF54ED5
          E5FF75E2EFFFADF4FCFFADF4FCFFADF4FCFFADF4FCFFADF4FCFFADF4FCFF40D2
          E3FF80E6F2FF44D1E2FF04B2C7FD04BBD1F5C1F3F8FFBBF1F7FE84E8F3FF04CA
          E2FF04C5DDFF04C5DDFF04C2D9FF04C2D9FF04BED4FF04BED4FF04BED4FF04B1
          C6FF04B1C6FF04B1C6FF04B5CA4B04BBD1F58AE1EBFFD8FBFEFFD8FBFEFFCAF9
          FDFFCAF9FDFFCAF9FDFFCAF9FDFFCAF9FDFFCAF9FDFFCAF9FDFFBBF7FDFF04B5
          CAFF0000004500000018000000000000001C04BBD1FF91E2EBFFE4FDFEFFD8FB
          FEFFD8FBFEFF8AE1EBFF04BBD1FF04BBD1FF04BBD1FF04B5CAFF04B5CAFF0000
          0039000000160000000000000000000000000000001B04BBD1FF04BBD1FF04BB
          D1FF04B5CAFF04B5CAFF00000024000000000000000000000000000000000000
          000000000000000000000000000000000000000000040000000B0000000B0000
          000B0000000B0000000B00000004000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000000000000000000000000000000000000000
          0000000000000000000000000000FFFF00008003000000010000000000000000
          0000000000000000000000000000000000000000000000000000000100000003
          000080FF000080FF0000FFFF0000}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB000000206348524D00007A25000080
          830000F9FF000080E9000075300000EA6000003A980000176F925FC546000007
          B54944415478DAE4975B6C1CD519C77FE79CB9ECC59B4D9C8B9D806BEA201102
          A5900B94820B720924512DB5A89122684BCB8B23A054A517280F4895AADE2215
          A9854A804AA2A66A402D0F944094E040632521389040439A38B1491D3B57DF76
          6DEF657666CEE9C3CCDA1B8B007DE2A1475AEDCC9C99F3FF7FFFEFFBFE674618
          63F82C87E4331ED67BEFBD77C9C9300C1142608C4108E1261289DB6CCBBAC3C0
          4A6D4463684C5A8090829C94A21F63F6552A95D73DCF3B00208488A29472EA78
          E610870E1DBA24812008104224EAEAEAEE974A3D50F0C26BCA81416A1F2B2C60
          EB0A0681AF5C0295066991B420ED5AFFF43CEFC962B1F80F21044AA94B12B02E
          05AEB5C6B6ED1B6765327FCC15FDE5955289B993C7693EF716C9A177511383E8
          F224420844723641763185C6150C2DB8990B95A6DBEB5CEBF6FAFAFA97F2F9FC
          C3C69833FF93025A6B52C9E43DB69B786EB8E0A716147B58F4FE33A8933B3026
          40644026C1588001E1832E82298070E7E02DF926A7AEFE1605BB917975CE8713
          1313EB82203828A5FC64025A6B52A9E4BD8E9BDC3256F4C4E2FEBF91EEFA3546
          16B01781C80036A0237088FF25E083CE41700664A689E1B65F30587F0BF3D3D6
          D0F8F8F85D61181E9AA984A82D42630C96657D79D6ACECAEB1A29F68F9E077B8
          5D4FA32E03D50038808A6F6E5801755746E8C6C0991D50CC47644A100C821977
          C87FEDF79CBE6C35F549F9E1C8C8C8CDC0858F6BC374369B7D6E221089CFF56E
          C1DEFD345633A88531B815476F034B1E80155B61C50BB0F245A86F89C8292009
          5633883915666DFB010B46F6530C554B369B7D526B7DB10F68ADD15A138621A9
          54EAC150BA4B678FBE4F62D7AFB01B41CEAD017681440480F46A9631E0E8E8BA
          3B7DBFB50864C263F6CE47B1BD116C37798FE338B71B63A8FE6A15C8A4D375DF
          D72620B377234A7AA8794C4765C72A5449A819DAD9229AB763023226B110C450
          3FB3DFDF842F5D3275753F8E7D05214444C01883EBBA770A377579F2CC01E489
          DD380B6240198359352412331B5880232272B52444A4963317EC837FC12E9CC5
          4EA4EF504AB54CA5A0EA528944622DCAC63EF61A9601EAE2056612B89402CE0C
          0554FCAC049905991BC2EEDF837053AEE3386DD53DA89A02CBB2ECE52A2821FA
          BBB153F102663AC02922323E6786B1087111E8D4B48954B114A8FEB7904A6259
          D64DD51AB0B4D61863160ACB6E965E0E33368048D63C4CCDA201E0553D600681
          309E0B6370717186A40DE6422FCA0428A51657F708196F1AF542C8ACF0CBE015
          11B2267211034E00D96FC0922D201598F2C5042A7968B8179A1F87E20C931220
          1498C230427B809853DDE4ACF8C068A38D94525434680D4AD74455015A56C375
          5B40A5411A10414D179661FE066878380AB51CC081DFC6D61AADA303088DC092
          1203C6B22C84105889440263CC880E829C4866EA039526F04AA8A086C0E5D7C2
          ADDBA62B6FCEB723DF9D92D885853F9A3E5FFA1B982CC2FEA7A2D485E0574027
          16A0EC345EF9DC482E978BB27BDF7DF7B161C386B3C317CE9F74B30DE8D95730
          360C7A1C28C7791F3E0527FF3CB3F12F4E72ED280EC24077F46C11FC31181B03
          B9F06A922997FDFBF7F7B6B7B7D3DEDE8EECEEEEA6ABAB4BBF73A0FBA0E33AD8
          577D85E204948AB17C1A288DC3EBF7C387CF7EF22B4EF114BC7A179CEA9EAA81
          C238947D7097B6610CECDBB7EFDD7C3E4F3E9F9F6E985D6FBCB1AB5CAE90BE79
          3D81128C0F47799BAA010FD8D9017DCF7C3CF8B63530F0EFA8F83CF0CB303E04
          667E23755F58C5D98181E29E3D7BDEAE366B9580DBD9D9B9E75FEFBED33FEBCA
          9558D7AF61E23CE4F360749CEE2026B263039CF808128553F0720C4E74AF3630
          3A0CA51CA4EF7808273D9B5D3B77BCD9D3D37332B633A100A194724BA552494A
          E9DEB9666D5BB26519A36F6EA2321160A7C11220C3B8A502E0C436C836C2FC15
          11D8643FBCB4761ADC8330845C0EC6FAC1345F45D3439B181ACDEBC71E7BECD1
          8181817E21840102152BA080E4B163C77A562C5BF6D56B57DED210CE9AC7F8EE
          6D7865B052A064D479A24AE2E8AB50DF04A9F9F0D7387201BA027E18A9377212
          7C2BC5653F7B9964C3E779FAA93F6CDDB469F3B3710557AA04AA65AC7CDFAF1C
          3972E4485B5BDBDD57DC7497E3299BC9FD6F509C80D002E5C42A18102170623B
          1C7E1173AE0FADC0D791050C5F8822F75592C69FBE40FD756D7476761E7FE491
          471E2C954AE59AAA0A558D5F19C0397FFEFC605F5F5FFFADADADAB9B6F695761
          4333E30777531C2C53F2A272F00D0402FC4053991CC70326CB901F839101983C
          0D342DA1E9F1BF33F7FA55ECDDBBF7744747C7F7060707FF53EDABB8B24C2D81
          AAF7D9BDBDBD478E1E3DDA77C30DCB6E5BFCA53B9399D675948A790A7D27289C
          F6298C4021079339981885FC79C89F86C92108338D64EFFE212D3FD94C7AD195
          747676F67474747CF7F8F1E387639CC95801F3110E32B5F5B8805EBA74E9CA27
          9E78E297ED5FBFBB35E5DA14CF9D64F4EDD7287CD08577AE175D1806696165E6
          E1365D43DD17DB987BE31A9CCC5C864646D9FCFC9FB66EDCB8F1E74343438331
          60390EF4530D0160DB766ADDBA75DF79E5956DFB86C7F22634C6548C31BE36A6
          E2154CA552327E7C2D34C60C9C3E5BDABC79F32BADADADAB6BDE8DE4C7827C9A
          E1388E58BE7CF9F2F5EBD7DFB66AD5AA1B11A2592A2B8531428761DEF3CA27B6
          6EDDBA6FFBF6ED5D870F1FEEF9D451FEDF7F1DFF7700EA3575DCB8B7E6200000
          000049454E44AE42608234373436}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB000000206348524D00007A25000080
          830000F9FF000080E9000075300000EA6000003A980000176F925FC546000007
          B44944415478DAE4977B8C15D51DC73FE7CC9CB9AFBD7281655929B0152B2A56
          5158B02A16C2AB6ADA448D04D494B44DAA4DAD360D366A9ADA3469DA466C6C6A
          6DD2DA165234903E622B56B42CB6ABC8B328487D2CBB16975D64659FF7EEBD3B
          775EE7F48F992B9715AC49FFF08F4EF2CB999CC99CEFF7F7FDBD668431868FF3
          927CCC977DE8D0A1B33E8CA20800630C4288543A9D5EAC945A6E0C0B2243B336
          26274048C1882545B7316697EFFBDB3DCFDB0F2084A0B64A79665FC5C18307CF
          4A200C4380743EDFF01529ADAF973D7D89171944E4634765940E3008029922B4
          73206D3236641DEB1FBEEF3FE2BAEED342880F25609F0D5C6B8D526A613E9FFF
          C5C8983FDF0F5C1A2B9DB4F4ED2273F200D6682FDA2B2310884C8160C2F954A6
          B63230F52AFA53D3973438F692491327FE69A458BCC718F3EED970CEA880D69A
          6C26739B4AA51EEF1F0DB24D6E07D35EFB25D6D1E73126443480CC82B1000322
          003D06BA0C325DA07AD12DF45CF4452AAA99C6BCFAF7E86879551886AF9C4985
          0F10D05A93C9646E7752994D23639E9875ECF7E4DA7F0CB282FD09100D801A97
          BE06D0800F7A04C2774134CC6060D90F383EF16AA634A8FE52A9F4B9288A5EAD
          E5C5FB55508B51ED8152EAEA6CAEE1D7653F1217BEF533B2CF7D1739B1829A0D
          6212904E0828C0A9BB5740066413381782A087C94F7D9596933B18F698529830
          E18FC69826630CF526C76DE40A85C2E3E550A667766EC26E7F0C7B2658D38054
          92314E72AF12329964ADEDD9F19E3D1364C1E79CADDFA469700F95C89A552814
          1ED15A9FB90F68ADC9E57277853235A7307490F40B3FC26E06D9981CAA129014
          904BC3ACDB63E01A89F1441CB0A7814C7B149EBF0FE50D623B99DB94524BB4D6
          A714783F1984C86773B9BB8D09C9EF7C08293CAC1AB855E79D63C3A51BE1D34F
          C0ECF5A7147112B31313F13BEA5C90FDDD145EDB40201DF2F9FCBD495F8915D0
          5A1345118E522BA5939B9E79773FB2AB1D676A72A0A82761C3DC4DD0B43A663D
          FD5EB8E0E790724E9150752488957126833AF024AA720295CA2EB76D7B568D84
          94522284209DCEDC8052A8B79EC536402E01B76ADED870F92698B2E6F43A3A67
          1264CDE904AC24B889C9096015FB51DD3B114E36A5945AFA7E08920AB06D47CD
          B74217D1BD173B5BE7810644E2F969E0064A8F43D76D100631C99AD597A64EF2
          C102D9BD076949946D5F591B82769210E74A4BB5C8EA080CF72033C94151D22C
          176C82E6719E63C0B90CCEDB0DC28A01A903D5801670E449D8FB5384024E7621
          4D88B4ACF36BA55FF37312424E907E15E3B9B1FC1AB0B2B0F8099876D3990769
          FACAFF3EEE4EEC8ECF92A0C706B0F10039B136E4EC241B8D36DA082945A80D46
          83D0402420CAFC6FF3566BD0A023D05A2084C4608C522A56209D4E638C19D461
          382233F949819523F25CA406CA15F8EB4D70FD6668B9F18387FBC7931A4E4260
          C6C55F0870872082C083684A1396CAE155FB0687868662026BD7AE2593C99C78
          F8E19F1C9D3AF7D249BAF049867A07682A804801A60ACFAD81EBB67C90446937
          BC7E27E81042011EB15581AA014F805BC5ABC0F030580B2E26934BB367CF9EAE
          75EBD6C581DCB76F1FEDEDED7AFFFE7DAFA494839AFD59DC12542B89178698FE
          F635D0FDE7D30934DE02B31F86D1128C16A15C679552BCFA1E9551F042485FBC
          14A361F7EEDD078AC522C56211592B9C1D3B76EC70BD80DC55B7125882E22098
          20F12804AA1E3CBF06DE79EA7412036F4159805BF33C9E8AF87115F91E8C0E80
          696CA6E1B2E59C38766CECA5975EDA9B74095123906A6B6BDB79E8C03FBBF39F
          6AC5BEE206CAEF41A9786ACC12029E07DB6E85A34FC7E0FBEF813D0F81676202
          6E1D78009186A101708721B7FC1BA41A26B2A3ED6F7F3F72E4C8D16472080B10
          9665A55CD7752D29522BAFBF6169FABC2B187A6103FE68889305254044B57044
          D0FD2CBCB7175EFBDD29825EB2260A84118C8CC0F03130332F64E6DDBFE5E450
          513F70FFFDF7F5F4F4740B210C105A750D37D3D1D1D1D13A7FDEB24B5AAF991A
          9E338552FB3354AB606741C9F8CB47984489131DB10A419DD73E4401041A8A45
          187C077C2BCBF407FE42A6F93C1E7BF4D1CD1B376EFC55D2B0FD1A016A248220
          F0DF78E38DD7972D5B7E73CBC2154ED57628EF7D81B1124436C8544240278913
          C6664288A218D80D61B01F86BB219019CEBD6F3393E72EA36DFBF623EBD6ADBB
          CB75DD6A9D66915557B90670FAFAFA7ABBBABABA175D7BED752DD77CDED24D2D
          945E6D67ACA74AD54B689B182C30E047500DA1E2C6920FF6C0E87160C645CCF8
          CE1F68BC7C253B5F7EF9F8D7EEBCF3CBBDBDBDEF2459E526DA196B5CEB8800D5
          D5D5F5FA9B6FBEF9F6BC79F316CFFACCCA4C7ED12ADCB12295B73BA91C0F280F
          42A508E5E138C347DE83522F540640E79B9970F3B738FFDB1B699876016D6D6D
          1D77DC71C7973A3B3B0F2738E5440143DDEC1AFF959402F49C3973163CF8E0F7
          7EF8851B6FBA369B528CF51D6568EFB354FEF5225E5F177A6C00236C54BE91D4
          8C4B6898BB94C90BAFC7C94FA67F60888D1B7EB379FDFAF5DFEFEFEFEF4D00AB
          89A31FE912C9476A76D5AA556BB76E7D66D7C070D144C618DF181368633CAF62
          3CDF3541B21719637A8E9F70376CD8B075D1A245D725435D7ED82FA0F8A86C1C
          C711ADADADF357AF5EBD78C58A150B11B2C5B2ACAC31081D85C56AD5EDDCB265
          CBAE6DDBB6BD78F8F0E18E8FECE5FFFDDFF17F06005ABB98C449B45FB8000000
          0049454E44AE42608234373435}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB000000206348524D00007A25000080
          830000F9FF000080E9000075300000EA6000003A980000176F925FC546000007
          B74944415478DAE4976D8C545719C77FE79CFB32776796E9BEC15281AD544B85
          DAE22ED0B4A52F81420BA989A9DA602B46FD20C65A35A1DAB489698C892F496B
          A3B1C648D3251A0346ADD662B7EE2EB6DB222D10D005A1B0BB1496DDC2765FD8
          99D999B973E7CEBDC70FF70E0C149A463FF483277972EEDCC9B9FFFFF37FDEEE
          155A6B3EC825F9809771F0E0C14BFEA1B5260CC373D74208DBB6EDDB2DD3BC33
          D47A79A0456BA875528090828C9262586BBDBB5C2EF7789EB74F6B8D9492EA2E
          E5A57D15FDFDFD97251004014022954A7D594AF5B5BC172CF12A2122F4318302
          46584623F0954D452541281C435067AB573CCF7BCA75DDBF0821DE9380713969
          B4D698A6B9A23E95FAC574D1EFF02B2E4DF901AE1ADB4D627C3F6A6694D0CB23
          1008E70AFC59575368ED6062F64D4CF8F3EF4859E61D8D8DCE1F3399CC37B4D6
          A72F87734905C230C4719CFB4DCBDA3255F0EB5A8A03CCEDFF25EAC4DFD0BA82
          488174401B8006E14358884CD80D781FFB34A7167D9E82D54A73CA7A6B6666E6
          B341101CB8940AEF221081271E306DE737D962592C1CFE1DC9BE1F11AA02E695
          20EA63DD446C44240880328459A89C0652F3995CF57DDE6EB885D9F5E6442E97
          BB2B08827F0A212E5F05B1EC373B75A967F2E5505C73F4A7382F7D17D158C0BA
          0644136003568D99B1598003B205AC4520F5084D7FFA0A6DE33B992EE996743A
          FD07ADF56CAD35B5268510540D48A6D3E92DF94026DA067F8DF1CAD3186DA0E6
          C6C02ADE6D20119B13133062124674CF5800AAA1CCAC1DDFA4656A0F858A5A98
          4EA79FAA56D63905AA4CC23024994C3E5851F6E286B3FD2476FE10B31564738D
          97B5A04E0DF895CB60EED2F3046332C65C50098F2BBA1FC12C4F61D8CEFDA669
          DE11862155933572D4D725930FA10366EDFA31527AC896D86B5523B355A38009
          CC5E0AED5DB0BC0BE62C8EDC52717E98444E8C0F73457F27BEB448A5520F577B
          831022CA01AD35B66DAF9576729E737A1F62B00F734E0C26638FAA2A54C16D60
          F62D70DD4BA09AC16885652FC19C251716B803761318077E8B993F8369D7DDA9
          945A084404AA599948D8EB5116D6D1BF46675335992E2F52A19A07C926504DE7
          036ACE8F95B82EAA8AF89C4C83CA4C609EFA07C2AEB32DCB5A15866194843113
          43195687AA141127F7A29CF8B05060A7C14A5FB81B695069C874C3E826D0A50B
          49DCD8052DD7830F84117143813CF906524A0CC3B8B13A048D38FE73A561B649
          2F83CE9C423AF1C1C61B60F58B20F47935445CF7E71A47F1DD33CD9A07B7BD08
          3DEB61F820489006E8F141A4AE20A5BABA5A7946AC40A310322DCB25F08A8854
          0CA22C48CCF9EFC69CFD21B8AB175E580BA7FE050A74710AA53D10A2A19A7B86
          10021D2F21A5A884A02B2042408BFF6DD6965D285720843080400BCC68426AD3
          3423051289045AEBA9A0E267A453DFE8AB2481E76204402E07E3FB2285654D42
          CA9A361C14A1BE1D64FD85E033C7E1B975303108127C0FC2C46C9499C4F3DE99
          3A7BF66C4460E3C68D388E73E6C9277F72A2F5FA8F37E6D257313D3A49730388
          91C3B07DC5F9E6536D44D58E1700576D80FA2D1782E7DF823FAF87B141D0E015
          603A036AF9B53829873D6FBC31B479F3E6A813EEDDBB97BEBEBE70DFBEBD072C
          D3C45C741BEE4C74081D2763005462F3010F2802F31F806BB6814C5D08FEFC3A
          181F8894D23033039E0F89C5ABD001BCFEFAEBFBB3D92CD96CF6BC98BDBDBD3B
          DDB24FF2A6CFE12B416E2A062BC78025C0050AB1E581A90908B21779BE0ECE0C
          44E4CB502AC1CC24E8E65652D7AFE1CCC870F1B5D75EDB530D649580DDDBDBBB
          AB7FFFFEE1D4D5CB504BD7333306B96CEC7D954895841BFF3EDA0DDDF7409887
          FC083C77378C0D444F2C4345C3F414B8D3905CF37512A90676F674BF3C303070
          220EA65080504AD9AEEBBA524A7BEDBAF5AB9C85ED9C7DB993F24C052B059688
          890435E1F0E3EBB15370E65538D809A36F8206ED4125804C16A68741B72D62C1
          439D8C4F65C2C71E7DF491919191612184062AD5B1A100E7D8B163C796B5B7AF
          5EB2ECE639C1AC16727D3B28B960D681214054405C4C2204DE1981CC386808CA
          500E23F0A993E0AB3AE63DFA3C75AD1FE6E99FFF6CDBD6AD5B7F1537F5729500
          5512BEEF978F1C397278F5EA3BEF6D5BB1C6F20C8BFC9EBF539C81C000C38A13
          A64A20DE7508411001BB7E941AD3C3E02B87B9DFD946D30DABE9E9EE1ED8BCF9
          E1075DD72DD56456A06A5EAA34608D8D8D8D1E1F1A1ABEF5D6DBEE5E70CB3D2A
          98D346EEC0AB14474B144B91D3BE8EE2EB87500EC0AD40A104990C4C8D40FE34
          30FF5A163CF67B9A3FB1965DBB76BDFDD54D9BBE343A3A7A32D6CC8DF5D3B504
          AA05670E0E0D1D3E7AF4CDE3EDEDEDB72FBC71AD53BFF233B8C52C85E343144E
          FB1426219F85FC7494E1B97720370AF9490867B592BEF75B7CE4DB5B495DF951
          7A7A7A8E6DDAB4E98B83838387629C7CAC80A6A69F5DFC9E6803E1E2C58B973F
          FEF8E33FF8E4A7EEBDD5B10C8A632798DED345FEDF7D7863430485499006667D
          33D6BC25D42F5D45D38A7558F54D4C4C9EA5F3D967B63DF1C413DF9B9898188D
          014BB1A3EF6B0900D334EBEEBBEFBE2FECD8B163F76426A703AD75596BED075A
          97BD82F6CAAEF6E37B81D67AE4ED336E6767E70B2B57AEBC3BEE97F2BD3E01DF
          F7B4B12C4B747474746CD8B0E1F6356BD6AC40C836A5549DD65A044125EB954A
          83DBB76FDFDDD5D5F5EAA143878EBD6F2FFFEFBF8EFF330052319949E9791B99
          0000000049454E44AE42608234373438}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7A
          F4000000097048597300000B1300000B1301009A9C1800000A4F694343505068
          6F746F73686F70204943432070726F66696C65000078DA9D53675453E9163DF7
          DEF4424B8880944B6F5215082052428B801491262A2109104A8821A1D91551C1
          114545041BC8A088038E8E808C15512C0C8A0AD807E421A28E83A3888ACAFBE1
          7BA36BD6BCF7E6CDFEB5D73EE7ACF39DB3CF07C0080C9648335135800CA9421E
          11E083C7C4C6E1E42E40810A2470001008B3642173FD230100F87E3C3C2B22C0
          07BE000178D30B0800C04D9BC0301C87FF0FEA42995C01808401C07491384B08
          801400407A8E42A600404601809D98265300A0040060CB6362E300502D006027
          7FE6D300809DF8997B01005B94211501A09100201365884400683B00ACCF568A
          450058300014664BC43900D82D00304957664800B0B700C0CE100BB200080C00
          305188852900047B0060C8232378008499001446F2573CF12BAE10E72A000078
          99B23CB9243945815B082D710757572E1E28CE49172B14366102619A402EC279
          99193281340FE0F3CC0000A0911511E083F3FD78CE0EAECECE368EB60E5F2DEA
          BF06FF226262E3FEE5CFAB70400000E1747ED1FE2C2FB31A803B06806DFEA225
          EE04685E0BA075F78B66B20F40B500A0E9DA57F370F87E3C3C45A190B9D9D9E5
          E4E4D84AC4425B61CA577DFE67C25FC057FD6CF97E3CFCF7F5E0BEE22481325D
          814704F8E0C2CCF44CA51CCF92098462DCE68F47FCB70BFFFC1DD322C44962B9
          582A14E35112718E449A8CF332A52289429229C525D2FF64E2DF2CFB033EDF35
          00B06A3E017B912DA85D6303F64B27105874C0E2F70000F2BB6FC1D428080380
          6883E1CF77FFEF3FFD47A02500806649927100005E44242E54CAB33FC7080000
          44A0812AB0411BF4C1182CC0061CC105DCC10BFC6036844224C4C24210420A64
          801C726029AC82422886CDB01D2A602FD4401D34C051688693700E2EC255B80E
          3D700FFA61089EC128BC81090441C808136121DA8801628A58238E08179985F8
          21C14804128B2420C9881451224B91354831528A542055481DF23D720239875C
          46BA913BC8003282FC86BC47319481B2513DD40CB543B9A8371A8446A20BD064
          74319A8F16A09BD072B41A3D8C36A1E7D0AB680FDA8F3E43C730C0E8180733C4
          6C302EC6C342B1382C099363CBB122AC0CABC61AB056AC03BB89F563CFB17704
          128145C0093604774220611E4148584C584ED848A8201C243411DA0937090384
          51C2272293A84BB426BA11F9C4186232318758482C23D6128F132F107B8843C4
          37241289433227B9900249B1A454D212D246D26E5223E92CA99B34481A2393C9
          DA646BB20739942C202BC885E49DE4C3E433E41BE421F25B0A9D624071A4F853
          E22852CA6A4A19E510E534E5066598324155A39A52DDA8A15411358F5A42ADA1
          B652AF5187A81334759A39CD8316494BA5ADA295D31A681768F769AFE874BA11
          DD951E4E97D057D2CBE947E897E803F4770C0D861583C7886728199B18071867
          197718AF984CA619D38B19C754303731EB98E7990F996F55582AB62A7C1591CA
          0A954A9526951B2A2F54A9AAA6AADEAA0B55F355CB548FA95E537DAE46553353
          E3A909D496AB55AA9D50EB531B5367A93BA887AA67A86F543FA47E59FD890659
          C34CC34F43A451A0B15FE3BCC6200B6319B3782C216B0DAB86758135C426B1CD
          D97C762ABB98FD1DBB8B3DAAA9A13943334A3357B352F394663F07E39871F89C
          744E09E728A797F37E8ADE14EF29E2291BA6344CB931655C6BAA96979658AB48
          AB51AB47EBBD36AEEDA79DA6BD45BB59FB810E41C74A275C2747678FCE059DE7
          53D953DDA70AA7164D3D3AF5AE2EAA6BA51BA1BB4477BF6EA7EE989EBE5E809E
          4C6FA7DE79BDE7FA1C7D2FFD54FD6DFAA7F5470C5806B30C2406DB0CCE183CC5
          35716F3C1D2FC7DBF151435DC34043A561956197E18491B9D13CA3D5468D460F
          8C69C65CE324E36DC66DC6A326062621264B4DEA4DEE9A524DB9A629A63B4C3B
          4CC7CDCCCDA2CDD699359B3D31D732E79BE79BD79BDFB7605A785A2CB6A8B6B8
          6549B2E45AA659EEB6BC6E855A3959A558555A5DB346AD9DAD25D6BBADBBA711
          A7B94E934EAB9ED667C3B0F1B6C9B6A9B719B0E5D806DBAEB66DB67D61676217
          67B7C5AEC3EE93BD937DBA7D8DFD3D070D87D90EAB1D5A1D7E73B472143A563A
          DE9ACE9CEE3F7DC5F496E92F6758CF10CFD833E3B613CB29C4699D539BD34767
          1767B97383F3888B894B82CB2E973E2E9B1BC6DDC8BDE44A74F5715DE17AD2F5
          9D9BB39BC2EDA8DBAFEE36EE69EE87DC9FCC349F299E593373D0C3C843E051E5
          D13F0B9F95306BDFAC7E4F434F8167B5E7232F632F9157ADD7B0B7A577AAF761
          EF173EF63E729FE33EE33C37DE32DE595FCC37C0B7C8B7CB4FC36F9E5F85DF43
          7F23FF64FF7AFFD100A78025016703898141815B02FBF87A7C21BF8E3F3ADB65
          F6B2D9ED418CA0B94115418F82AD82E5C1AD2168C8EC90AD21F7E798CE91CE69
          0E85507EE8D6D00761E6618BC37E0C2785878557863F8E7088581AD131973577
          D1DC4373DF44FA449644DE9B67314F39AF2D4A352A3EAA2E6A3CDA37BA34BA3F
          C62E6659CCD5589D58496C4B1C392E2AAE366E6CBEDFFCEDF387E29DE20BE37B
          17982FC85D7079A1CEC2F485A716A92E122C3A96404C884E3894F041102AA816
          8C25F21377258E0A79C21DC267222FD136D188D8435C2A1E4EF2482A4D7A92EC
          91BC357924C533A52CE5B98427A990BC4C0D4CDD9B3A9E169A76206D323D3ABD
          31839291907142AA214D93B667EA67E66676CBAC6585B2FEC56E8BB72F1E9507
          C96BB390AC05592D0AB642A6E8545A28D72A07B267655766BFCD89CA3996AB9E
          2BCDEDCCB3CADB90379CEF9FFFED12C212E192B6A5864B572D1D58E6BDAC6A39
          B23C7179DB0AE315052B865606AC3CB88AB62A6DD54FABED5797AE7EBD267A4D
          6B815EC1CA82C1B5016BEB0B550AE5857DEBDCD7ED5D4F582F59DFB561FA869D
          1B3E15898AAE14DB1797157FD828DC78E51B876FCABF99DC94B4A9ABC4B964CF
          66D266E9E6DE2D9E5B0E96AA97E6970E6E0DD9DAB40DDF56B4EDF5F645DB2F97
          CD28DBBB83B643B9A3BF3CB8BC65A7C9CECD3B3F54A454F454FA5436EED2DDB5
          61D7F86ED1EE1B7BBCF634ECD5DB5BBCF7FD3EC9BEDB5501554DD566D565FB49
          FBB3F73FAE89AAE9F896FB6D5DAD4E6D71EDC703D203FD07230EB6D7B9D4D51D
          D23D54528FD62BEB470EC71FBEFE9DEF772D0D360D558D9CC6E223704479E4E9
          F709DFF71E0D3ADA768C7BACE107D31F761D671D2F6A429AF29A469B539AFB5B
          625BBA4FCC3ED1D6EADE7AFC47DB1F0F9C343C59794AF354C969DAE982D39367
          F2CF8C9D959D7D7E2EF9DC60DBA2B67BE763CEDF6A0F6FEFBA1074E1D245FF8B
          E73BBC3BCE5CF2B874F2B2DBE51357B8579AAF3A5F6DEA74EA3CFE93D34FC7BB
          9CBB9AAEB95C6BB9EE7ABDB57B66F7E91B9E37CEDDF4BD79F116FFD6D59E393D
          DDBDF37A6FF7C5F7F5DF16DD7E7227FDCECBBBD97727EEADBC4FBC5FF440ED41
          D943DD87D53F5BFEDCD8EFDC7F6AC077A0F3D1DC47F7068583CFFE91F58F0F43
          058F998FCB860D86EB9E383E3939E23F72FDE9FCA743CF64CF269E17FEA2FECB
          AE17162F7EF8D5EBD7CED198D1A197F29793BF6D7CA5FDEAC0EB19AFDBC6C2C6
          1EBEC97833315EF456FBEDC177DC771DEFA3DF0F4FE47C207F28FF68F9B1F553
          D0A7FB93199393FF040398F3FC63332DDB000000206348524D00007A25000080
          830000F9FF000080E9000075300000EA6000003A980000176F925FC546000007
          CD4944415478DAE4975B6C1CD519C77FE7CC756FD88E133B49094E43B9389168
          A84982201121845B4BAA02A1A8F4428B2A0595D252DA52555591FAD016C10352
          A5D24A5C1C0A8AD30BAA041412C5A44D9A9824809B4B49E2C4259838177B37F6
          AEBDBBB3BB33734E1F66365E4C40F489871EE968CECCF966FEFFEFFF5D664668
          ADF92487E4131EE6FEFDFBCFB9A194422935C5544AC7719C6B2CCB5AADB45EA2
          34B3952285401882BC14624808FA2A95CA965AADF6068010A27EEFD9F5F421F6
          EDDBF7A104C23004703399CC3D521ADF2956C345D55023958F1914B1B48F1682
          403AF8460AA449C214246DF98F5AADF6B8E7792F0A213E9280F961D228A5B06D
          7B693A9D7EA250F6BB6A81476B7180F923BB488CBE8931394C5829228440269A
          F19B2EA4DC7E05D9F6ABC83AE7AF4C3BE6CA192D2D2FE40BF9EF69AD4FFE4F0A
          28A5705DF72EDB719ECC15FD649B778439FB7F8FF1CE66B40E10699049D026A0
          41F8A0CAA08B209C166A9D6B79AFF3EB94ACD9B4A6AC778AC5E21D4110F44BF9
          C194137BF7EE9D3A1102A51409D7FDAAE5249ECB97AB62C17B7F22BDED11B451
          C29C0B2213EB6644E0E8389543A0062A0FC14990E979E4AEFB25275AAE6656DA
          CC4E4C4CDC1886E1BFA62B21B5D6D46718869886715522997A6AB2168A8B0FFF
          86E4A69F235A4A5817839801B8801D1348A6A1B9232260030990ED605F0A709C
          D6BF7E9BF9A35BC85799D5DCD4F417A0AD114F6B8D1442509F40AAB9B9F9C962
          28DD8EA3CF616DFB2D660718736300333EDA40C2812B37C2CA9DD0DA1911AA13
          4B80D901A2A546E6E5EFD3766617A5D05CD0D474DEE38D95F5BE3EA094229D4E
          DD1718EEC2E6B17DB85B7F8DD90E72660C6C35789F7460590FB47D01129F82AB
          5E85990BA76C627B730E48A74AF3E687B06B6730EDE45D9665AD544A4D29505F
          0099642A7DBFD601991D8F22451563564CD188091880EBC0E51B61E6AD536EB8
          1DB0E45568590822B6953189B920B24334EF7B86C0B0C964323F6AECBE6709D8
          B67D83B053E7BB27DF401EDD86DD167B2B626003701CF86C0FB47EE983F5E45E
          005D31897A81CB281C562B58FDCF63954E61B9C9D5A6692EA8875DD64BC375DD
          CF635858875E899A43BA015C0096038B3742EBAD1FDE57DD0BE08A57A17921A8
          988004D904329FC57A7707C24E3A9665ADAA87A19E03A669D95D4658460CEDC6
          4C4C2B33BB153EF7C2B93D3F1789659BA075694442474A1A06C8A1D791526259
          D6B27A1864CC648E308C0E51C9A3C78F23EAD26BA2872466C18CABA721050DEB
          F0FD5B89793067557439EE13D2043D3A88D401D2302E945222A53CABC00C846C
          927E055D2D47D2D5BD3780FC61F8E775503D1D59E79E006F6B03973138F1D014
          A9A38FC0C147A2648CF34D18A04B39A4AEA2352D5A6B94529871FD6BADB51652
          8A508156B1E70AA8C6C7D17EE8BF1DCEFF329C78002EFB5B4331BB30FC3B288D
          82B108FA7F0A7ECC474702A900422DB0A29CD3A6692284C0745D17ADF5191504
          7999C8CCF08D1441D5C30862657D201967F5681F14FAA273AC29021A50CD30F8
          6C4458C7F77931F910FC2A28B70D69A5A85646CEE4F3F9A80AEEBEFB6EEEBDF7
          DE53B9D191634E533B61F37CC672A026E207D462152AF1B10A943E1876CA3ADA
          AB35D8F94019FC71181B0739A79344D261D7AED707D7AC59C32DB7DC82DCB367
          0FDBB76F576FBEB1A7DF716CAC4B56E04D82579A920F7FDA832BB1678D0A541B
          662D96DF8FF68A13500DC0EE5C8552D0D7D7F756A150A0502820E37CE7B5AD5B
          5FF32A3552577E055F0A0A3950FE34502FF6BE38AD08D09102A5D8AE3E7DF02B
          3099053D7336E9CB5673EAF8F1F28E1D3B76C75D42D40938BDBDBD3BF6BDF5E6
          50D3454B3017DF4C7114F28538216BD342E14D574043454F85A916812B056339
          288F4372F57771522DBCB665F3DF0706068EC56F0D21010CC3300B85C2F8FAF5
          DD4F55FD80B6AF3D8AEF2638330C1325086B3168395660727A0E6828A968AF14
          D9063E8C8D417E18587009ED6B1EE0F468567577773F094811979F8CDF840A70
          376CD8F0FC96CD9B0E643A16D172CFE3780518391691A8D640790D4484DBF061
          97387B3DAC44F11ECB43EE18D48C24B3EFFF03869BE2D9EEA737F6F5F5ED045C
          1DB742A3FE310418BEEFD70E1E3CF8F6B5D7AEBAEDD3CB6EB43DC36272F756BC
          4950264827925E2B6064000EBD8C3EF047D4DE0D84A387F0C3102F80DC28E487
          C03712CCFE490FAD975D47EF962D471E7CF087F7799E576908686834E4B106EC
          919191E1C1C1C1A1E52B56DC347FF91A236CEF60A27F1BE5E10A5E057C018100
          3F7B1C7FE430D5D387A99C3E4AA9125228C099F7A07812987729F37EF667662E
          BE819D3B779E58B76EDDB7868787DF8DB3C7ABD7482381B865600D0E0EBE7DF8
          D0A1FF2CBEFCF26B3E73E50D89F356DC81572A507EE728A5619F520E4A935179
          4DE66122071327A0940375DE6C9A6EFB0117FE783DE9B917D1DBDB3BB06EDDBA
          6F1E3972E4408C538C15D075E9CFF5B7E400AAB3B373C9C30F3FFCAB2FDE7AFB
          8AA463513A7D8CF1DDAF50FCF776AAA70651E51C081333331367DE22328B57D1
          BAF466EC4C2BD9DC18EBBB9FEE79ECB1C77E91CD668763C0E91DE4238700B02C
          2BB976EDDA6FBCF8E24B7DD9F1820EB4D635AD752D54BA5A2DE96AD5D335155D
          0BB4D6C74F9CF4BABBBB5F5ABE7CF94D0D9F25F223413ECEB06D5B74757575DD
          79E79DD75C7FFDF54B11A2C330AC2468110641A15AAD1CEDE9E9E9DBB469D3F6
          03070E0C7C6C2FFFEFFF8EFF3B00FD31B76652C9D14A0000000049454E44AE42
          608234373730}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000206348524D0000
          7A25000080830000F9FF000080E9000075300000EA6000003A980000176F925F
          C546000003134944415478DA84936D68957518C67FF7FF7939CF73CEB6B37336
          744BE76698FB94D29B10350B4C4D9030F3AD8693442A1DD8872832FA12415111
          455F4A1C586494CE88D9C7B4D40F063146186D8931698E5C4AE7EC6CE7E579FD
          FFFB6009F642175C1FEFDFCD7573DD3269C6500819ED302DD7C84B2B2DE4F069
          C260F84B0A8BC8D40A23139FBCF1C3D50967FDF287DF5A73CBFA719BFFD57588
          8DCDD14B47DE3FD27873BBEAB248A72A0FDED1BE6AADFDDF6306434A448042F8
          76F69BE747CCA1EDEDBD057299023FB9A33D1F5D38F4A20210044FF9B89201E4
          269083C3AFD1D4A35FD4865EF1DA1D726E065714DD5D0B19D367FA140652ADD5
          B92BA70F9C2F8DBE66A19A05F5676E9B5A5A59FEE5FCE1A152EBCF7E2EEBE159
          392CDB266CA4B4C59D653B0E5286C73F7E6FB87C70B039EFA038B0685DA17F97
          2B2E89893A4ED68E9F98F0BE2BE632795CE56109689D52B9A8797AD1DE0FD4C5
          AB134F1C2B0D0D4A3142B930523D3C7021187BA9A6CB9C093E7FFBB47BA25765
          05CFF271C446042A33213B0B7B5FBDBBF3CE0FADC2E3C9C1A9EC8F5D0B9BDA70
          F25974A64E494DF78512AE3E2BC736459906BEE4B044914AC25CADC1EA70EBF0
          B6C5FDFB0D89B69BAC7C25EB64C8FA82F68556A7C86FEE2FEE29EBE85A51E049
          16652C1030916665B5AFF448C78EFD1171A250A8CD3D3B3F53E522A5F92A2AB2
          482D17DBCD22960195B97E4C8144D759505D6636E79FD9E1A89699BA116AC6A0
          96B4F51EDFB7F4E54F75D5A7A1EBA451824E12100368002293E25517B0C11F78
          AEC5E9FC2A8A53D24491240A15D0A83DB464E3EE2DED7B4E56E742425D210E23
          C238264E03025323A909EB6460A8DBBBED9D488737F544993420D09560CBD25D
          BB1F904D93F3E51A41D8200812A230242E5BDC976EFC7A45D3AA4163FE5E3350
          064362622CB12F0FF43CFB5477E32ECA9532F5464865B6CAB2F09E8935CD8FED
          F12517392A83E3181C47DFB0729487A33C52036D5EC7A927BB5F78BDE5F7C54C
          5F9BE2D6F99533DB8AFBB6BACABFA4D1C83FF6835C3193377E4E106262C64BDF
          F75F9E3DBF6145F1DE776F6FBD7FB4CE1C2911FC0BE08F0100B34B4FA6699FE0
          170000000049454E44AE426082}
      end
      item
        ImageFormat = ifPNG
        ImgData = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000097048597300000B1300000B1301009A9C18000000206348524D0000
          7A25000080830000F9FF000080E9000075300000EA6000003A980000176F925F
          C546000003864944415478DA2CC35B6C53751C07F0EFEFFF3FE7F49CAEDDCA2E
          0C06623B192A4666517401125C8851A711030F8B4AC286CE174D880F3E19745E
          1E30869818A6C91263A6449018148421C4780137938920C41BA3DBCAB62E945D
          DAEDB43DEDB9FC7F3EE827F91097A6018350CC659BC63FFD6C773491985DD3F1
          D480707CA5C26104ECA1A25C98BE9493E7CF74BBB65D1B6F7B74C05CB5328BC0
          07D89FC3D2D4C88327BA9293A73681BFD96CF06F07BA8F054B374CE565E1BB53
          2838D78DE1F77B8EFFFC98CE979EACE69FBAB75CCB4F8CACE7600E6467AE26CF
          BFBAE78C317AB9B1B6DA04420C2846E4E917BE6AE979E359453E52877A8FF285
          533BE2CB2220DDC2E242067F1B89C9E4BBFDEDB2B3B5E1CDD2E017DB1AEA2330
          4D42C80A216A44114CFD71B76F973A0A57869EB7864EB6AF8C568135038214AA
          6B62C0AD4CCD4D19713592BA5D25805044479804744D879406229A04FD786CA3
          94127AD402C882217C9046806E02606886C662ED13BBFAD4D6F6EB86E3C13023
          0885C2B04212A66EC00A876159167469C2D018A41B105A188B0B33984D2447E3
          1D3B0F11AB19946FCDAE4D7DD03BB87C62B825128BC19421B024303388014803
          440184F0B1E87898A9BBE76A62DF5BBBCCBAC614F9C53148AD0AEE523E3ED7BF
          FF87BAF4E5B81EA986D00440043083558040981095256456B58E353EF3DA3663
          454D0610D0ECBC8398413064B44835B180E181A0002680001081044022804200
          ABBA21A7C76A32F03C802404090986BA2D75F8E059FEE5FB3B5837A19801C6FF
          19CC80AC1420022018F9EE81F1237D8759D32D9084909AA8BFF2C9C1138B67FB
          93260A501E815D1F2A08C04AFDD727783EA3E012D8CBA370F2BDE7FEFAE8C091
          005E58EEDDBA6EDFF8876FEFAEAB92806E421220044101F0DD0A02CF85520CC7
          0FA02A25D86E0055F6901E1EBE4B36DF99D3ECC9B175A20C141C46888A282280
          521AA89487D77C5F859888D2BF1B4C04AF5C46D971603B0AAA022C4E4D244453
          DB23439515F5582A94912B7AC8951C64733398BFBDF5465DD7EB6DCB7A7A3BF3
          ABD757E6E673C815CB982FBA28D815C8C6D5EE9A871F3F0A2E6569EADCE7AF1C
          DF5ECBA737824F27C1BFBEB4395D4E5FBA976753F0E6D3288D5EDC74E1E5F6F1
          73F783073780BFDEDEC0D3C35FEE659E07F1421A2081ECB58B3BFE39FCF18BA1
          E6E69B1B3ABBDE09471A26B868C3230D8630303DFA673C3538B09F027F79CBCE
          3D7D4D0F6DF916650FFF0E0091FCAF0858BD2EBC0000000049454E44AE426082}
      end>
    Left = 11
    Top = 10
    Bitmap = {}
  end
  object tmr1: TTimer
    Enabled = False
    Interval = 15000
    OnTimer = tmr1Timer
    Left = 41
    Top = 10
  end
  object SkinM: TsSkinManager
    InternalSkins = <>
    MenuSupport.IcoLineSkin = 'ICOLINE'
    MenuSupport.ExtraLineFont.Charset = DEFAULT_CHARSET
    MenuSupport.ExtraLineFont.Color = clWindowText
    MenuSupport.ExtraLineFont.Height = -11
    MenuSupport.ExtraLineFont.Name = 'MS Sans Serif'
    MenuSupport.ExtraLineFont.Style = []
    SkinDirectory = 'c:\Skins'
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    Left = 40
    Top = 103
  end
  object SkinP: TsSkinProvider
    AddedTitle.Font.Charset = DEFAULT_CHARSET
    AddedTitle.Font.Color = clNone
    AddedTitle.Font.Height = -11
    AddedTitle.Font.Name = 'MS Sans Serif'
    AddedTitle.Font.Style = []
    SkinData.SkinSection = 'FORM'
    TitleButtons = <>
    Left = 10
    Top = 101
  end
  object Save_Files: TSaveDialog
    Left = 40
    Top = 72
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 71
    Top = 10
  end
end
