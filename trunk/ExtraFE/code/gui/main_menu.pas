unit main_menu;

interface
  uses
    SysUtils,Classes,Windows,Forms,
    uSImpleAnimationsObjects,uRadiualGroup,uTweener,uGlSceneProfiler,
    GLHUDObjects,GLWindowsFont,GLFilePNG,GLCrossPlatform,GLKeyboard,VectorGeometry;


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
      if MainForm.BackGround.Tag = 0 then
        begin
// Init the tweener
          MousePressed := false;
          fTweener := TTweener.Create;
// Init sprites

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

          fClickedText := TGLHUDText.CreateAsChild(MainForm.Dummy_mainmenu);
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
                fPlanet := TPlanetButton.CreateAsChild(MainForm.Dummy_mainmenu);
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

                fGroup := TRadialGroup.CreateAsChild(MainForm.Dummy_mainmenu);
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

