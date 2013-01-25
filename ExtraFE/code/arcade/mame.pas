unit mame;

interface
uses
  SysUtils,Windows,Graphics,Classes,Forms,ExtCtrls,Controls,
  used_pro,loadT,uMain_ListBox,vitru_key,mame_res,
  GLScene,VectorGeometry,GLCrossPlatform,GLObjects,GLHUDObjects,
  GLFilePNG,GLMaterial;

  procedure MameMenu(aTime: Double);
  procedure ReturnToMainMenu;

  procedure ShowImage(ImgName: String);
  procedure RunGame(game: string);
  procedure DoNothing;
  procedure ShowFPS;
  procedure CheckFavIcon(x,y,tabNum: Integer);
  procedure CheckRSideImages(x,y:Integer);

const
  ExtraFeMamePath_images = 'media\emulators\arcade\mame\extrafe\';  


var
  fMousePressed: Boolean;
  fNumOfGames: TGLHUDText;
  fShowNum,fInfoImageText: TGLHUDText;
  fImgShow: TGLHUDSprite;
  fImgFav: TGLHUDSprite;  //UpBar
  fBUp,fBdown: TGLHUDSprite;//Arrows
  fMovie,fISnap,fICab,fIfly,fIMarq,fICPan,fIPcb,fITit,fIScor,fIbos: TGLHUDSprite; //Images and Video
  fCube1: TGLCube;

//  fImgShow: TGLPlane;

  IsImgShowed,showPicWaiting: Boolean;
  MTab: Integer;
  SideStateImage: integer;



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
          MainForm.GlCamera_mame.TargetObject := MainForm.Mame_background;

          loadText;
          loadImages;
//          load3dObjects;
          fListBox_Mame.fYPosition := 0;
          sItem := 6;
          MTab:= 0;
          SideStateImage:= 1;

          if IsKeyDown(VK_RETURN) then
            DoNothing;

          IsImgShowed := False;
          showPicWaiting := False;
          fInfoImageText.Text := 'SNAPSHOTS';
          MainForm.Mame_Background.Tag := 1;
        end;

        // Start the loop
      if MainForm.Mame_Background.Tag = 1 then
        begin
          GetCursorPos(Mpos);
          MPos := MainForm.GLSceneViewer.ScreenToClient(MPos);

          Game := fListBox_Mame.GetItemByIndex(sItem);
          fNumOfGames.Text := IntToStr(sItem - 5) + '/' + IntToStr(MameTotalRoms);
          if IsKeyDown(VK_RETURN) then
            RunGame(Game.GameZip)
          else if IsKeyDown(VK_ESCAPE) then
            ReturnToMainMenu
          else if IsKeyDown(VK_DOWN) then
            fListBox_Mame.DoClickDown
          else if IsKeyDown(VK_UP ) then
            fListBox_Mame.DOClickUp
          else if IsKeyDown(VK_LEFT) then
            fListBox_Mame.DOClickLeft
          else if IsKeyDown(VK_RIGHT) then
            fListBox_Mame.DOClickRight
          else if IsKeyDown(VK_TAB) then
            begin
              if MTab = 1 then
                MTab := 0
              else
                MTab := MTab + 1;
              Sleep(200);
            end
          else
            fListBox_Mame.CancelClick;
          Game := fListBox_Mame.GetItemByIndex(sItem);
          if IsImgShowed = False then
            ShowImage(Game.GameZip);
          CheckFavIcon(Mpos.X,Mpos.Y,MTab);
          CheckRSideImages(Mpos.X,Mpos.y);
          ShowFPS;
          MainForm.GLSceneViewer.Invalidate;
        end;
    end;
end;

procedure RunGame(game: string);
begin
  MainForm.GLSceneViewer.Enabled := False;
  ShellExecAndWait(Mame_exe,game,Mame_path,0);
  MainForm.GLSceneViewer.Enabled := True;
end;

procedure DoNothing;
begin
  Sleep(200);
end;

procedure ShowImage(ImgName: String);
const
  NoPicFoundPath = 'media\emulators\arcade\mame\extrafe\noimg.png';
  PicWaitingPath = 'media\emulators\arcade\mame\extrafe\picwaiting.png';
var
  SnapImg: string;
  ImgNum: Integer;
begin
  ImgName := Trim(Copy(ImgName,0,Length(ImgName)-4));
  if sleeping > 100 then
    begin
      SnapImg := MameSnapPath + ImgName + '\0000.png';
      if not FileExists(SnapImg) then
        SnapImg := ExtraFePath + NoPicFoundPath;
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

//      fCube1.Material.MaterialLibrary := MatLib;
//      fCube1.Material.LibMaterialName := 'showImg';

      if fImgShow.Width > fImgShow.Height then
        fImgShow.SetSize(280,240)
      else
        fImgShow.SetSize(220,260);
      fImgShow.Position.X := 760;
      fImgShow.Position.Y := 300;

      IsImgShowed := True;
      showPicWaiting := False;
    end
  else
    begin
      if showPicWaiting = False then
        begin
          ImgNum := MatLib.Materials.GetLibMaterialByName('showImg').Index;
          MatLib.Materials.Delete(ImgNum);
          fImgShow.Free;

          SnapImg := ExtraFePath + PicWaitingPath;
          AddMaterial(MatLib,SnapImg,'showImg');

          fImgShow := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
          fImgShow.Material.MaterialLibrary := MatLib;
          fImgShow.Material.LibMaterialName := 'showImg';
          fImgShow.Material.GetActualPrimaryTexture.Image.Width;
          fImgShow.Width := fImgShow.Material.GetActualPrimaryTexture.Image.Width;
          fImgShow.Height := fImgShow.Material.GetActualPrimaryTexture.Image.Height;

          if fImgShow.Width > fImgShow.Height then
            fImgShow.SetSize(280,240)
          else
            fImgShow.SetSize(220,260);
          fImgShow.Position.X := 760;
          fImgShow.Position.Y := 300;

          IsImgShowed := True;
          showPicWaiting := True;
        end;
    end;
    
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

procedure CheckFavIcon(x,y,tabNum: Integer);
begin
  if MTab <> 1 then
    begin
      if MainForm.IsMouseOverImage(fImgFav,x,y) then
//        fImgFav.Material.BlendingMode := bmTransparency
        fImgFav.Material.LibMaterialName := 'fav_glow'
      else
//        fImgFav.Material.BlendingMode := bmOpaque;
        fImgFav.Material.LibMaterialName := 'fav';
    end
  else
    fImgFav.Material.LibMaterialName := 'fav_glow'
end;

procedure CheckRSideImages(x,y:Integer);
begin
  if MainForm.IsMouseOverImage(fMovie,x,y) then
    begin
      fMovie.Position.X := 1002;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 0;
          fInfoImageText.Text := 'MOVIE TRAILER';
        end;
    end
  else
    begin
      if SideStateImage = 0 then
        fMovie.Position.X := 1002
      else
        fMovie.Position.X := 1032;
    end;
  if MainForm.IsMouseOverImage(fISnap,x,y) then
    begin
      fISnap.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 1;
          fInfoImageText.Text := 'SNAPSHOTS';
        end;
    end
  else
    begin
      if SideStateImage = 1 then
        fISnap.Position.X := 999
      else
        fISnap.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fICab,x,y) then
    begin
      fICab.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 2;
          fInfoImageText.Text := 'CABINETS';
        end;
    end
  else
    begin
      if SideStateImage = 2 then
        fICab.Position.X := 999
      else
        fICab.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fIfly,x,y) then
    begin
      fIfly.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 3;
          fInfoImageText.Text := 'FLYERS';
        end;
    end
  else
    begin
      if SideStateImage = 3 then
        fIfly.Position.X := 999
      else
        fIfly.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fIMarq,x,y) then
    begin
      fIMarq.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 4;
          fInfoImageText.Text := 'MARQUEES';
        end;
    end
  else
    begin
      if SideStateImage = 4 then
        fIMarq.Position.X := 999
      else
        fIMarq.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fICPan,x,y) then
    begin
      fICPan.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 5;
          fInfoImageText.Text := 'CONTROL PANELS';
        end;
    end
  else
    begin
      if SideStateImage = 5 then
        fICPan.Position.X := 999
      else
        fICPan.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fIPcb,x,y) then
    begin
      fIPcb.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 6;
          fInfoImageText.Text := 'PCBS';
        end;
    end
  else
    begin
      if SideStateImage = 6 then
        fIPcb.Position.X := 999
      else
        fIPcb.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fITit,x,y) then
    begin
      fITit.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 7;
          fInfoImageText.Text := 'TITLES';
        end;
    end
  else
    begin
      if SideStateImage = 7 then
        fITit.Position.X := 999
      else
        fITit.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fIScor,x,y) then
    begin
      fIScor.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 8;
          fInfoImageText.Text := 'SCORES';          
        end;
    end
  else
    begin
      if SideStateImage = 8 then
        fIScor.Position.X := 999
      else
        fIScor.Position.X := 1029;
    end;
  if MainForm.IsMouseOverImage(fIbos,x,y) then
    begin
      fIbos.Position.X := 999;
      if IsKeyDown(VK_LBUTTON) then
        begin
          SideStateImage := 9;
          fInfoImageText.Text := 'BOSSES';
        end;
    end
  else
    begin
      if SideStateImage = 9 then
        fIbos.Position.X := 999
      else
        fIbos.Position.X := 1029;
    end;
end;

end.
