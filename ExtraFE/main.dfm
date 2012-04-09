object MainForm: TMainForm
  Left = 290
  Top = 108
  BorderStyle = bsNone
  Caption = 'MainForm'
  ClientHeight = 523
  ClientWidth = 922
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GLSceneViewer: TGLSceneViewer
    Left = 0
    Top = 0
    Width = 922
    Height = 523
    Camera = GlCamera_intro
    Buffer.BackgroundColor = clBlack
    FieldOfView = 158.350875854492200000
    Align = alClient
    TabOrder = 0
  end
  object GLS_Intro: TGLScene
    Left = 8
    Top = 8
    object Background_intro: TGLHUDSprite
      Position.Coordinates = {0000000000000000000080BF0000803F}
      object GLHUDText_ExtraFE_Ver: TGLHUDText
        BitmapFont = Font_Intro
        ModulateColor.Color = {60E5D03E5C8F023F2DB21D3F0000803F}
      end
      object GLHUDText_confEditor_Ver: TGLHUDText
        BitmapFont = Font_Intro
        ModulateColor.Color = {60E5D03E5C8F023F2DB21D3F0000803F}
      end
      object Progress: TGLHUDSprite
        object Bar: TGLHUDSprite
        end
        object mask: TGLHUDSprite
          object GLHUDText_Progress: TGLHUDText
            BitmapFont = Font_Intro
          end
        end
      end
    end
    object Progress_Bar: TGLDummyCube
      CubeSize = 1.000000000000000000
    end
    object GlCamera_intro: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      CameraStyle = csOrthogonal
    end
  end
  object GLCadencer: TGLCadencer
    Scene = GLS_Intro
    OnProgress = GLCadencerProgress
    Left = 48
    Top = 8
  end
  object Font_Intro: TGLWindowsBitmapFont
    Font.Charset = ANSI_CHARSET
    Font.Color = clAqua
    Font.Height = -19
    Font.Name = 'Another'
    Font.Style = [fsBold]
    Left = 88
    Top = 8
  end
  object GLS_MainMenu: TGLScene
    Left = 8
    Top = 40
    object BackGround: TGLHUDSprite
      object Left_Wing: TGLHUDSprite
      end
      object Right_Wing: TGLHUDSprite
      end
      object GLDummyCube: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
    end
    object GlCamera_MainMenu: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      SceneScale = 0.100000001490116100
      TargetObject = GLDummyCube
      CameraStyle = csOrthogonal
      Position.Coordinates = {00000000000000000000A0400000803F}
    end
  end
  object Font_MainMenu: TGLWindowsBitmapFont
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Another'
    Font.Style = [fsBold]
    Left = 88
    Top = 40
  end
  object GLS_mame: TGLScene
    Left = 8
    Top = 72
    object Mame_Background: TGLHUDSprite
      object GLDummyCube1: TGLDummyCube
        CubeSize = 1.000000000000000000
      end
    end
    object GlCamera_mame: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
    end
  end
  object Font_Mame: TGLWindowsBitmapFont
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -16
    Font.Name = 'Times New Roman'
    Font.Style = [fsBold]
    Left = 88
    Top = 72
  end
end
