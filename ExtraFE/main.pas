unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls,
  GLCrossPlatform, BaseClasses, GLScene, GLWin32Viewer,GLCoordinates,
  GLObjects, GLHUDObjects, GLMaterial, GLTexture, GLCadencer, GLBitmapFont,
  GLWindowsFont;

  type
  TMainForm = class(TForm)
    GLS_Intro: TGLScene;
    GLSceneViewer: TGLSceneViewer;
    GlCamera_intro: TGLCamera;
    Background_intro: TGLHUDSprite;
    GLCadencer: TGLCadencer;
    Progress_Bar: TGLDummyCube;
    Bar: TGLHUDSprite;
    Progress: TGLHUDSprite;
    mask: TGLHUDSprite;
    GLHUDText_ExtraFE_Ver: TGLHUDText;
    GLHUDText_confEditor_Ver: TGLHUDText;
    GLHUDText_Progress: TGLHUDText;
    Font_Intro: TGLWindowsBitmapFont;
    GLS_MainMenu: TGLScene;
    GlCamera_MainMenu: TGLCamera;
    BackGround: TGLHUDSprite;
    GLDummyCube: TGLDummyCube;
    Left_Wing: TGLHUDSprite;
    Right_Wing: TGLHUDSprite;
    Font_MainMenu: TGLWindowsBitmapFont;
    GLS_mame: TGLScene;
    GLDummyCube1: TGLDummyCube;
    GlCamera_mame: TGLCamera;
    Mame_Background: TGLHUDSprite;
    Font_Mame: TGLWindowsBitmapFont;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GLCadencerProgress(Sender: TObject; const deltaTime,
      newTime: Double);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Frequency,oldResolutionX,oldResolutionY: Integer;
  IntroScene,MainMenu,MameStart : Boolean;
  CountScenes : Byte;
  dTime,nTime: Double;
  CenterX,CenterY: Real;

  MatLib: TGLMaterialLibrary;
implementation

{$R *.dfm}

uses
  main_menu,used_pro,jpeg,loadT,
  mame;

procedure TMainForm.FormCreate(Sender: TObject);
begin

  if MatLib=nil then
    MatLib := TGLMaterialLibrary.Create(MainForm);

  GLSceneViewer.Cursor := crNone;
  SetScreen(32,1280,768,Frequency);

  IntroScene := True;
  MainMenu := False;
  MameStart := False;
  CountScenes := 0;

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

  if IntroScene = True then
    Intro(nTime)
  else if CountScenes = 0 then
    begin
      MatLib.Materials.Clear;
      GLCadencer.Scene := GLS_MainMenu;
      GLSceneViewer.Camera := GlCamera_MainMenu;
      GLSceneViewer.Cursor := crDefault;
      MainMenu := True;
      CountScenes := 1;
    end;

  if (MainMenu = True) and (CountScenes = 1) then
    LSMainMenu(nTime);

  if MameStart = True then
    MameMenu(nTime);
end;

end.
