object FGeneral: TFGeneral
  Left = 220
  Top = 177
  BorderIcons = []
  BorderStyle = bsSingle
  ClientHeight = 443
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object img1: TImage
    Left = 152
    Top = 64
    Width = 329
    Height = 281
    Stretch = True
  end
  object lbl1: TLabel
    Left = 384
    Top = 368
    Width = 16
    Height = 13
    Caption = '2X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    OnClick = lbl1Click
    OnMouseEnter = lbl1MouseEnter
    OnMouseLeave = lbl1MouseLeave
  end
  object sButton1: TsButton
    Left = 304
    Top = 312
    Width = 40
    Height = 15
    Caption = 'Close'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = sButton1Click
    SkinData.SkinSection = 'BUTTON'
  end
end
