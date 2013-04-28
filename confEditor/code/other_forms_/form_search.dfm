object fSearch: TfSearch
  Left = 283
  Top = 297
  BorderStyle = bsNone
  Caption = 'Form_Search'
  ClientHeight = 27
  ClientWidth = 356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object sEdit1: TsEdit
    Left = 3
    Top = 3
    Width = 233
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnKeyPress = sEdit1KeyPress
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
  object sBitBtn1: TsBitBtn
    Left = 242
    Top = 3
    Width = 21
    Height = 21
    TabOrder = 1
    OnClick = sBitBtn1Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sBitBtn2: TsBitBtn
    Left = 273
    Top = 3
    Width = 21
    Height = 21
    TabOrder = 2
    OnClick = sBitBtn2Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sBitBtn3: TsBitBtn
    Left = 332
    Top = 3
    Width = 21
    Height = 21
    TabOrder = 3
    OnClick = sBitBtn3Click
    SkinData.SkinSection = 'BUTTON'
  end
  object sPanel1: TsPanel
    Left = 4
    Top = 40
    Width = 348
    Height = 41
    BevelOuter = bvNone
    TabOrder = 4
    SkinData.SkinSection = 'PANEL'
    object rMameGameName: TLMDRadioButton
      Left = 32
      Top = 16
      Width = 105
      Height = 17
      Caption = 'Game Name'
      Alignment.Alignment = agTopLeft
      Alignment.Spacing = 4
      Checked = True
      TabOrder = 0
    end
    object rMameRomName: TLMDRadioButton
      Left = 200
      Top = 16
      Width = 105
      Height = 17
      Caption = 'Rom name'
      Alignment.Alignment = agTopLeft
      Alignment.Spacing = 4
      Checked = False
      TabOrder = 1
    end
  end
end
