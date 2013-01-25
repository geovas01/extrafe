unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,StdCtrls,
  GLCrossPlatform, BaseClasses, GLScene, GLWin32Viewer,GLCoordinates,
  GLObjects, GLHUDObjects, GLMaterial, GLTexture, GLCadencer, GLBitmapFont,
  GLWindowsFont,GLColor,
  uBaseButton,uTweener, ExtCtrls,
  GLSpaceText, GLParticleFX, GLBlur, AsyncTimer, BMDThread;

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
    Mame_background: TGLHUDSprite;
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
    GLHUDText_Loading: TGLHUDText;
    GLSprite_Cursor: TGLSprite;
    GLLightSource3: TGLLightSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GLCadencerProgress(Sender: TObject; const deltaTime,
      newTime: Double);
    function IsMouseOverImage(const AButton: TGLHudSprite; const X, Y: Integer): Boolean;
    procedure GLSceneViewerMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
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
  TurnNum: Integer;

  MainForm: TMainForm;
  Frequency,oldResolutionX,oldResolutionY: Integer;
  dTime,nTime: Double;
  CenterX,CenterY: Real;
  fTweener: TTweener;

  MatLib: TGLMaterialLibrary;

  oldPick: TGLCustomSceneObject;

implementation

{$R *.dfm}

uses
  main_menu,used_pro,jpeg,loadT,
  mame,zinc;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  if MatLib=nil then
    MatLib := TGLMaterialLibrary.Create(MainForm);
  Frequency := GetDisplayFrequency;
  GLSceneViewer.Cursor := crNone;
  SetScreen(32,1024,768,Frequency);
  TurnNum := 10;
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
    MameMenu(nTime)
  else if EmuList[3] = True then
    ZincMenu(nTime);
end;

procedure TMainForm.ActiveScene(scene: Integer);
var
  i : Integer;
begin
  for i := 0 to 7 do
    EmuList[i] := False;
  EmuList[scene] := True;
end;

function TMainForm.IsMouseOverImage(const AButton: TGLHudSprite; const X, Y: Integer): Boolean;
begin
  Result := (X >= AButton.Position.X - AButton.Width / 2) and (X <= AButton.Position.X + AButton.Width / 2) and
            (Y >= AButton.Position.Y - AButton.Height / 2) and (Y <= AButton.Position.Y + AButton.Height / 2);
end;

procedure TMainForm.GLSceneViewerMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
 var
	pick : TGLCustomSceneObject;
begin
	// find what's under the mouse
	pick:=(GLSceneViewer.Buffer.GetPickedObject(x, y) as TGLCustomSceneObject);
	// if it has changed since last MouseMove...
	if (pick<>oldPick)then begin
		// ...turn to black previous "hot" object...
		if Assigned(oldPick) then
			oldPick.Material.FrontProperties.Emission.Color:=clrBlack;
		// ...and heat up the new selection...
		if Assigned(pick) then
			pick.Material.FrontProperties.Emission.Color:=clrRed;
		// ...and don't forget it !
		oldPick:=pick;
	end;

//  if EmuList[1] = True then
//    begin
//      GLSprite_Cursor.Position.X := X;
//      GLSprite_Cursor.Position.Y := Y;
//      GLCadencer.Progress;
//    end;
end;
{
procedure TForm1.GLSceneViewer1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
	pick : TGLCustomSceneObject;
begin
	// find what's under the mouse
	pick:=(GLSceneViewer1.Buffer.GetPickedObject(x, y) as TGLCustomSceneObject);
	// if it has changed since last MouseMove...
	if (pick<>oldPick) then begin
		// ...turn to black previous "hot" object...
		if Assigned(oldPick) then
			oldPick.Material.FrontProperties.Emission.Color:=clrBlack;
		// ...and heat up the new selection...
		if Assigned(pick) then
			pick.Material.FrontProperties.Emission.Color:=clrRed;
		// ...and don't forget it !
		oldPick:=pick;
	end;
end;

procedure TForm1.GLSceneViewer1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
	pick : TGLCustomSceneObject;
begin
	// if an object is picked...
	pick:=(GLSceneViewer1.Buffer.GetPickedObject(x, y) as TGLCustomSceneObject);
	if Assigned(pick) then begin
		// ...turn it to yellow and show its name
		pick.Material.FrontProperties.Emission.Color:=clrYellow;
		ShowMessage('You clicked the '+pick.Name);
	end;}

end.
