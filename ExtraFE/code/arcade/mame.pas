unit mame;

interface
uses
  SysUtils,Windows,Graphics,Classes,Forms,ExtCtrls,
  used_pro,loadT,uMain_ListBox,
  GLScene,VectorGeometry,GLCrossPlatform,GLObjects,GLHUDObjects,
  GLFilePNG;

  procedure MameMenu(aTime: Double);
  procedure ReturnToMainMenu;

  procedure ShowImage(ImgName: String);
  procedure FogScene(active: Boolean);
  procedure UpDateFog(sTime: Single);
  procedure RunGame(game: string);
  procedure DoNothing;
  procedure UpDateImage(sTime,speed: Single);
  procedure ShowFPS;

//const
//  SkinsNames: array [1..8] of String = ('white', 'blue', 'shadow', 'transparent', 'marene', 'orange', 'green', 'bloody');

var
  fMousePressed: Boolean;
  fNumOfGames: TGLHUDText;
  fShowNum: TGLHUDText;
  fImgShow: TGLHUDSprite;

  IsImgShowed: Boolean;
  dFog: Single;
  fFog: Boolean;


implementation

uses
  main,main_menu,GLKeyboard;

procedure MameMenu(aTime: Double);
var
  Mpos: TPoint;
  Game: TSimpleListItem;

begin
  if MainForm.Tag = 0 then
    begin
// Init objects
      if MainForm.Mame_Background.Tag = 0 then
        begin
          MainForm.GLCadencer.Scene := MainForm.GLS_mame;
          MainForm.GLSceneViewer.Camera := MainForm.GlCamera_mame;

          fListBox.fYPosition := 0;
          sItem := 6;

          if not Assigned(fNumOfGames) then
            begin
              fNumOfGames := TGLHUDText.CreateAsChild(MainForm.Dummy_mame);
              fNumOfGames.BitmapFont := loadT.fnonexistFont;
              fNumOfGames.ModulateColor.AsWinColor := clWhite;
              fNumOfGames.Layout := tlCenter;
              fNumOfGames.Alignment := taRightJustify;
              fNumOfGames.Position.X := 440;
              fNumOfGames.Position.Y := 20;
            end;
          if not Assigned(fShowNum) then
            begin
              fShowNum := TGLHUDText.CreateAsChild(MainForm.Dummy_mame);
              fShowNum.BitmapFont := loadT.fexistFont;
              fShowNum.ModulateColor.AsWinColor := clBlue;
              fShowNum.Layout := tlCenter;
              fShowNum.Alignment := taRightJustify;
              fShowNum.Position.X := 800;
              fShowNum.Position.Y := 40;
            end;

          if IsKeyDown(VK_RETURN) then
            DoNothing;

          IsImgShowed := False;
          dFog := 0;
          fFog := False;
          
          MainForm.Mame_Background.Tag := 1;
        end;
// Start the loop
      if MainForm.Mame_Background.Tag = 1 then
        begin
          Game := fListBox.GetItemByIndex(sItem);
          fNumOfGames.Text := IntToStr(sItem - 5) + '/' + IntToStr(MameTotalRoms);
          if IsKeyDown(VK_RETURN) then
            RunGame(Game.GameZip)
          else if IsKeyDown(VK_ESCAPE) then
            ReturnToMainMenu
          else if IsKeyDown('i') then
            begin
              if fFog = True then
                FogScene(False)
              else
                FogScene(True);
            end
          else if IsKeyDown(VK_DOWN) then
            fListBox.DoClickDown
          else if IsKeyDown(VK_UP ) then
            fListBox.DOClickUp
          else if IsKeyDown(VK_LEFT) then
            fListBox.DOClickLeft
          else if IsKeyDown(VK_RIGHT) then
            fListBox.DOClickRight
          else
            fListBox.CancelClick;
          Game := fListBox.GetItemByIndex(sItem);
          if IsImgShowed = False then
            ShowImage(Game.GameZip);
          UpDateImage(aTime,2);
          UpDateFog(aTime * 2);
          ShowFPS;
          MainForm.GLSceneViewer.Invalidate;
        end;
    end;
end;

procedure RunGame(game: string);
begin
  ShellExecAndWait('mame.exe',game,'D:\emulators\arcade\mame',0);
end;

procedure DoNothing;
begin
  Sleep(200);
end;

procedure FogScene(active: Boolean);
begin
  MainForm.GLSceneViewer.Buffer.FogEnable := active;
  fFog := active;
end;

procedure UpDateFog;
begin
  if fFog = True then
    begin
      with MainForm.GLSceneViewer.Buffer.FogEnvironment do
        begin
          FogStart := -600;
          FogEnd := 600;
        end;
    end;
end;

procedure ShowImage(ImgName: String);
var
  SnapImg: string;
  ImgNum: Integer;
begin
  if sleeping > 100 then
    begin
      SnapImg := 'D:\emulators\arcade\mame\snap\' + ImgName + '\0000.png';
      if not FileExists(SnapImg) then
        SnapImg := ExtractFilePath(Application.ExeName)+'media\emulators\arcade\mame\extrafe\noimg.png';
      if Assigned(fImgShow) then
        begin
          ImgNum := MatLib.Materials.GetLibMaterialByName('showImg').Index;
          MatLib.Materials.Delete(ImgNum);
          fImgShow.Free;
        end;
      AddMaterial(MatLib,SnapImg,'showImg');

      fImgShow := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fImgShow.Material.MaterialLibrary := MatLib;
      fImgShow.Material.LibMaterialName := 'showImg';
      fImgShow.Material.GetActualPrimaryTexture.Image.Width;
      fImgShow.Width := fImgShow.Material.GetActualPrimaryTexture.Image.Width;
      fImgShow.Height := fImgShow.Material.GetActualPrimaryTexture.Image.Height;

      if fImgShow.Width > fImgShow.Height then
        fImgShow.SetSize(220,180)
      else
        fImgShow.SetSize(160,200);
      fImgShow.Position.X := 665;
      fImgShow.Position.Y := 360;

      IsImgShowed := True;
    end;
end;

procedure UpDateImage(sTime,speed: Single);
begin
  fImgShow.Up.y := sTime * speed/ 1000;
  fImgShow.Direction.Z := sTime * speed;
//  fShowNum.Text := FloatToStr(fImgShow.TurnAngle);
end;


procedure ShowFPS;
begin
  fShowNum.Text := Format('%.1f FPS',
                   [MainForm.GLSceneViewer.FramesPerSecond]);
  Mainform.GLSceneViewer.ResetPerformanceMonitor;
end;

procedure ReturnToMainMenu;
begin
  MainForm.ActiveScene(1);
  Start := False;
  fromback := True;
  MainForm.Mame_Background.Tag := 0;
end;

end.
