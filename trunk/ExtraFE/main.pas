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
    GLCadencer_Intro: TGLCadencer;
    Progress_Bar: TGLDummyCube;
    Bar: TGLHUDSprite;
    Progress: TGLHUDSprite;
    mask: TGLHUDSprite;
    GLHUDText_ExtraFE_Ver: TGLHUDText;
    GLHUDText_confEditor_Ver: TGLHUDText;
    GLHUDText_Progress: TGLHUDText;
    GLWindowsBitmapFont: TGLWindowsBitmapFont;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GLCadencer_IntroProgress(Sender: TObject; const deltaTime,
      newTime: Double);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;
  Frequency,oldResolutionX,oldResolutionY: Integer;
  Intro : Boolean;
  dTime,nTime: Double;
  CenterX,CenterY: Real;

  MatLib: TGLMaterialLibrary;
implementation

{$R *.dfm}

uses
  used_pro,jpeg,loadT;

procedure TMainForm.FormCreate(Sender: TObject);
begin

if MatLib=nil then
    MatLib := TGLMaterialLibrary.Create(MainForm);

  GLSceneViewer.Cursor := crNone;
  SetScreen(32,1280,768,Frequency);

  Intro := True;

end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  SetScreen(32,oldResolutionX,OldResolutionY,Frequency);
  GLCadencer_Intro.Enabled:=false;
  GLSceneViewer.Free;
end;

procedure TMainForm.GLCadencer_IntroProgress(Sender: TObject;
  const deltaTime, newTime: Double);
begin
  dTime := deltaTime;
  nTime := newTime;
  CenterX := GLSceneViewer.Width div 2;
  CenterY := GLSceneViewer.Height div 2;

  main_menu(nTime);
end;

end.
