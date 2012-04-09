unit main_menu;

interface
  uses
    SysUtils,Classes,Windows,Forms,
    uSImpleAnimationsObjects,uRadiualGroup,uTweener,uGlSceneProfiler,
    GLHUDObjects,GLWindowsFont,GLFilePNG,GLCrossPlatform,GLKeyboard,VectorGeometry;


  const
    EarthMats: array [1..6] of String = ('back', 'mame', 'emulators', 'arcade', 'zinc','exit');
    PlanetMats: array [1..4] of String = ('planet_1', 'planet_2', 'planet_3','planet_4');

  type
  TGroupPlanet = record
    fplanet: TPlanetButton;
    fGroup: TRadialGroup;
  end;

  procedure LSMainMenu(aTime: Double);

  type
    UsePlanets = class

    protected
      function GetGroupByPlanet(aPlanet: TGlHudSprite): TGroupPlanet;
      function GetGroupByRadialMenu(aRadialMenu: TGlHudSprite): TGroupPlanet;
      procedure OnPlanetOut(aSelf: TGlHudSprite);
      procedure OnPlanetOver(aSelf: TGlHudSprite);
      procedure OnItemMouseClick(aSelf: TRadialGroup; aItem: TRadialElement; aItemIndex: Integer);
      procedure ChangeMenuTo(RemoveItems,AddItems: array of string; CenterText: string);
  end;

  var
  {Text Objects}
  fHudText: TGLHUDText;
  fClickedText: TGLHUDText;
  fCenterText: TGLHUDText;

  //fGroup: TRadialGroup;
  fPlanet : TGroupPlanet;
  fHint : TSimpleImageHint;
  fPlanets: array [1..4] of TGroupPlanet;


  {Tween-objects}
  fTweener: TTweener;

  MousePressed: Boolean;

  Planets: UsePlanets;

implementation

uses
  main,used_pro;



procedure LSMainMenu(aTime: Double);
var
  MPos: TPoint;
  i : Integer;
begin
  //tag = 0 then load textures and other stuff.
  if MainForm.Tag = 0 then
    begin
//    load the main background
      if MainForm.BackGround.Tag = 0 then
        begin
          AddMaterial(MatLib, 'media\extrafe\main_menu\main_menu.png', 'background');
          MainForm.BackGround.Material.Assign(MatLib.Materials.GetLibMaterialByName('background').Material);
          MainForm.BackGround.Height := MainForm.GLSceneViewer.Height;
          MainForm.BackGround.Width := MainForm.GLSceneViewer.Width;
          MainForm.BackGround.Position.X := CenterX;
          MainForm.BackGround.Position.Y := CenterY;
          MainForm.BackGround.Material.FrontProperties.Diffuse.Alpha := 0;
          MainForm.BackGround.Material.FrontProperties.Ambient.Red := 255;
          MainForm.BackGround.Material.FrontProperties.Ambient.Green := 255;
          MainForm.BackGround.Material.FrontProperties.Ambient.Blue := 255;
          AddMaterial(MatLib, 'media\extrafe\main_menu\left_w.png', 'left_wing');
          MainForm.Left_Wing.Material.Assign(MatLib.Materials.GetLibMaterialByName('left_wing').Material);
          MainForm.Left_Wing.Height := 768;
          MainForm.Left_Wing.Width := 389;
          MainForm.Left_Wing.Position.X := 186;
          MainForm.Left_Wing.Position.Y := CenterY;
          AddMaterial(MatLib, 'media\extrafe\main_menu\right_w.png', 'right_wing');
          MainForm.Right_Wing.Material.Assign(MatLib.Materials.GetLibMaterialByName('right_wing').Material);
          MainForm.Right_Wing.Height := 768;
          MainForm.Right_Wing.Width := 389;
          MainForm.Right_Wing.Position.X := 1100;
          MainForm.Right_Wing.Position.Y := CenterY;
// Add the planet and the radial matirials
          AddMaterials(MatLib, 'media\extrafe\main_menu\', EarthMats, EarthMats);
          AddMaterials(MatLib, 'media\extrafe\main_menu\',PlanetMats, PlanetMats);
// Init the tweener
          MousePressed := false;
          fTweener := TTweener.Create;
// Init sprites

{          fHudText := TGLHUDText.CreateAsChild(MainForm.GLDummyCube);
          with fHudText do
            begin
              BitmapFont := MainForm.Font_MainMenu;
              Text := 'Created by : Azrael11';
              ModulateColor.SetColor(1, 1, 1, 0.7);
              Position.SetPoint(5, 740, 0);
              MainForm.Font_MainMenu.Font.Size := 16;
              Alignment := taLeftJustify;
            end;}

          fCenterText := TGLHUDText.CreateAsChild(MainForm.BackGround);
          with fCenterText do
            begin
              BitmapFont := MainForm.Font_MainMenu;
              Text := 'MAIN MENU';
              ModulateColor.SetColor(255, 255, 255, 1);
              Position.SetPoint(CenterX, 344, 0);
              MainForm.Font_MainMenu.Font.Size := 36;
              Alignment := taCenter;
            end;

          fClickedText := TGLHUDText.CreateAsChild(MainForm.GLDummyCube);
          with fClickedText do
            begin
              BitmapFont := MainForm.Font_Intro;
              MainForm.Font_Intro.Font.Size := 28; 
              Text := '';
              ModulateColor.SetColor(1, 1, 1, 1);
              Position.SetPoint(CenterX, 690, 0);
              Alignment := taCenter;
            end;

          for i := 1 to 4 do
            with fPlanets[i] do
              begin
                fPlanet := TPlanetButton.CreateAsChild(MainForm.GLDummyCube);
                with fPlanet do
                  begin
                    Material.LibMaterialName := 'planet_' + inttostr(i);
                    Material.MaterialLibrary := MatLib;
                    if i = 4 then
                      begin
                        Width := 400;
                        Height := 400;
                      end
                    else
                      begin
                        Width := 10;
                        Height := 10;
                      end;
                    case i of
                      1: Position.SetPoint(-118, 240, 0);
                      2: Position.SetPoint(-320, 120, 0);
                      3: Position.SetPoint(-470, 290, 0);
                      4: Position.SetPoint(640,344,0);
                    end;
                    if i = 4 then
                      begin
                        OverRadius := 200;
                        OutRadius := 320;
                      end
                    else
                      begin
                        OverRadius := 40;
                        OutRadius := 130;
                      end;
                    OnMouseOver := Planets.OnPlanetOver;
                    OnMouseOut := Planets.OnPlanetOut;
                  end;

                fGroup := TRadialGroup.CreateAsChild(MainForm.GLDummyCube);
                case i of
                  1: fGroup.AddElements(['arcade', 'zinc']);
                  2: fGroup.AddElements(['arcade']);
                  3: fGroup.AddElements(['arcade']);
                  4: fGroup.AddElements(['exit','emulators']);
                end;
                fGroup.Position.SetPoint(fPlanet.Position.AsVector);
                fGroup.Material.MaterialLibrary := MatLib;
                fGroup.OnMouseClick := Planets.OnItemMouseClick;
                if i = 2 then
                  fGroup.GroupRadius := 90
                else if i = 4 then
                  fGroup.GroupRadius := 260
                else
                  fGroup.GroupRadius := 80;
              end;
//          InitGlSceneProfiler(MainForm.GLDummyCube);
// Ready to start the loop
          MainForm.BackGround.Tag := 1;
        end;

        if MainForm.BackGround.Tag = 1 then
          if MainForm.BackGround.Material.FrontProperties.Diffuse.Alpha < 1 then
            MainForm.BackGround.Material.FrontProperties.Diffuse.Alpha := MainForm.BackGround.Material.FrontProperties.Diffuse.Alpha + 0.2 * dTime
          else
            MainForm.BackGround.Tag := 2;

        if MainForm.BackGround.Tag = 2 then
          begin
            fTweener.Update(dTime);

            GetCursorPos(Mpos);
            MPos := MainForm.GLSceneViewer.ScreenToClient(MPos);

            MousePressed := IsKeyDown(vk_LButton);
            for i := 1 to 4 do
              with fPlanets[i] do
                begin
                  fGroup.SetMousePos(VectorMake(MPos.x, MPos.y, 0));
                  fPlanet.SetMousePos(VectorMake(MPos.x, MPos.y, 0));
                end;
          end;
    end;
end;


{ UsePlanets }

procedure UsePlanets.ChangeMenuTo(RemoveItems, AddItems: array of string;
  CenterText: string);
begin
  fPlanets[4].fGroup.RemoveElements(RemoveItems);
  fPlanets[4].fGroup.AddElements(AddItems);
  fCenterText.Text := CenterText;
end;

function UsePlanets.GetGroupByPlanet(aPlanet: TGlHudSprite): TGroupPlanet;
var
  i: integer;
begin
  for i := 1 to 4 do
    if fPlanets[i].fPlanet = aPlanet then
      result := fPlanets[i];
end;

function UsePlanets.GetGroupByRadialMenu( aRadialMenu: TGlHudSprite): TGroupPlanet;
var
  i: integer;
begin
  for i := 1 to 4 do
    if fPlanets[i].fGroup = aRadialMenu then
      result := fPlanets[i];
end;

procedure UsePlanets.OnItemMouseClick(aSelf: TRadialGroup;
  aItem: TRadialElement; aItemIndex: Integer);
begin
  if aItem.fMaterialName <> 'back' then
    begin
      if aItem.fMaterialName = 'emulators' then
       ChangeMenuTo(['exit','emulators'],['back','arcade'],'EMULATORS')
      else if aItem.fMaterialName = 'arcade' then
        ChangeMenuTo(['back','arcade'],['back','mame','zinc'],'ARCADE')
      else if aItem.fMaterialName = 'exit' then
        begin
          Application.Terminate;
          MainForm.Close;
        end
      else if aItem.fMaterialName = 'mame' then
        begin
          MainForm.GLCadencer.Scene := MainForm.GLS_mame;
          MainForm.GLSceneViewer.Camera := MainForm.GlCamera_mame;
          MainMenu := False;
          MameStart := True;
        end;
    end
  else
    begin
      if fCenterText.Text  = 'ARCADE' then
        ChangeMenuTo(['back','mame','zinc'],['back','arcade'],'EMULATORS')
      else if fCenterText.Text = 'EMULATORS' then
        ChangeMenuTo(['back','arcade'],['exit','emulators'],'MAIN MENU');
    end;
end;

procedure UsePlanets.OnPlanetOut(aSelf: TGlHudSprite);
begin
  GetGroupByPlanet(aSelf).fGroup.Hide;
end;

procedure UsePlanets.OnPlanetOver(aSelf: TGlHudSprite);
begin
  GetGroupByPlanet(aSelf).fGroup.Show;
end;

end.

