unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls,
  GLCrossPlatform, BaseClasses, GLScene, GLWin32Viewer,GLCoordinates,
  GLObjects, GLHUDObjects, GLMaterial, GLTexture, GLCadencer, GLBitmapFont,
  GLWindowsFont,uBaseButton,uTweener, ExtCtrls,
  GLSpaceText, GLParticleFX, GLBlur;

  type
  TMainForm = class(TForm)
    GLS_Intro: TGLScene;
    GLSceneViewer: TGLSceneViewer;
    GlCamera_intro: TGLCamera;
    Background_intro: TGLHUDSprite;
    GLCadencer: TGLCadencer;
    GLHUDText_ExtraFE_Ver: TGLHUDText;
    Font_Intro: TGLWindowsBitmapFont;
    GLS_MainMenu: TGLScene;
    GlCamera_MainMenu: TGLCamera;
    BackGround: TGLHUDSprite;
    Dummy_mainmenu: TGLDummyCube;
    GLS_mame: TGLScene;
    Dummy_mame: TGLDummyCube;
    GlCamera_mame: TGLCamera;
    Mame_Background: TGLHUDSprite;
    GLS_zinc: TGLScene;
    GLS_atarist: TGLScene;
    GLS_playstation: TGLScene;
    GLS_gameboy: TGLScene;
    GLS_widgets: TGLScene;
    atarist_back: TGLHUDSprite;
    GLCamera_atarist: TGLCamera;
    GLDummy_atarist: TGLDummyCube;
    gameboy_back: TGLHUDSprite;
    GLCamera_gameboy: TGLCamera;
    GLDummy_gameboy: TGLDummyCube;
    playstation_back: TGLHUDSprite;
    GLCamera_playstation: TGLCamera;
    GLDummy_playstation: TGLDummyCube;
    zinc_back: TGLHUDSprite;
    GLCamera_zinc: TGLCamera;
    GLDummy_zinc: TGLDummyCube;
    widgets_back: TGLHUDSprite;
    GLCamera_widgets: TGLCamera;
    GLDummy_widgets: TGLDummyCube;
    GLLightSource1: TGLLightSource;
    GLLightSource2: TGLLightSource;
    GLDummyCube_Intro: TGLDummyCube;
    GLCube1: TGLCube;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GLCadencerProgress(Sender: TObject; const deltaTime,
      newTime: Double);
  private
    { Private declarations }
  public
    procedure ActiveScene(scene: Integer);
    { Public declarations }
  end;

var
// SceneList = (0.intro) (1.MainMenu) (2.Mame) (3.Zinc)
//   (4.Atari ST) (5.Playstation) (6.Gameboy) (7.Widgets)

  EmuList: array [0..7] of Boolean;
  fromback: Boolean;

  MainForm: TMainForm;
  Frequency,oldResolutionX,oldResolutionY: Integer;
  dTime,nTime: Double;
  CenterX,CenterY: Real;
  fTweener: TTweener;

  MatLib: TGLMaterialLibrary;


implementation

{$R *.dfm}

uses
  main_menu,used_pro,jpeg,loadT,
  mame;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  if MatLib=nil then
    MatLib := TGLMaterialLibrary.Create(MainForm);
  Frequency := GetDisplayFrequency;
  GLSceneViewer.Cursor := crNone;
  SetScreen(32,1024,768,Frequency);

  ActiveScene(0);
  fromback := False;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SetScreen(32,oldResolutionX,OldResolutionY,Frequency);
  GLCadencer.Enabled:=false;
  GLSceneViewer.Free;
end;

procedure TMainForm.GLCadencerProgress(Sender: TObject;
  const deltaTime, newTime: Double);
begin
  dTime := deltaTime;
  nTime := newTime;
  if GLSceneViewer <> nil then
    begin
      CenterX := GLSceneViewer.Width div 2;
      CenterY := GLSceneViewer.Height div 2;
    end;

  if EmuList[0] = True then
    Intro(nTime)
  else if EmuList[1] = True then
    LSMainMenu(nTime)
  else if EmuList[2] = True then
    MameMenu(nTime);
end;

procedure TMainForm.ActiveScene(scene: Integer);
var
  i : Integer;
begin
  for i := 0 to 7 do
    EmuList[i] := False;
  EmuList[scene] := True;
end;

end.
