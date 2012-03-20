object MainForm: TMainForm
  Left = 167
  Top = 109
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
    object Progress_Bar: TGLDummyCube
      CubeSize = 1.000000000000000000
      object Background_intro: TGLHUDSprite
        Position.Coordinates = {0000000000000000000080BF0000803F}
        object Bar: TGLHUDSprite
        end
        object Progress: TGLHUDSprite
          object mask: TGLHUDSprite
          end
        end
      end
      object GLHUDText_ExtraFE_Ver: TGLHUDText
        BitmapFont = GLWindowsBitmapFont
      end
      object GLHUDText_confEditor_Ver: TGLHUDText
        BitmapFont = GLWindowsBitmapFont
      end
      object GLHUDText_Progress: TGLHUDText
        BitmapFont = GLWindowsBitmapFont
      end
    end
    object GlCamera_intro: TGLCamera
      DepthOfView = 100.000000000000000000
      FocalLength = 50.000000000000000000
      CameraStyle = csOrthogonal
    end
  end
  object GLCadencer_Intro: TGLCadencer
    Scene = GLS_Intro
    OnProgress = GLCadencer_IntroProgress
    Left = 48
    Top = 8
  end
  object GLWindowsBitmapFont: TGLWindowsBitmapFont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = '00 Starmap Truetype'
    Font.Style = []
    Left = 88
    Top = 8
  end
end
