unit mame;

interface
uses
  SysUtils,Windows,Graphics,Classes,Forms,ExtCtrls,Controls,Dialogs,
  used_pro,loadT,uMain_ListBox,vitru_key,mame_res,mame_upper,
  GLScene,VectorGeometry,GLCrossPlatform,GLObjects,GLHUDObjects,
  GLFilePNG,GLMaterial,PasLibVlcPlayerUnit,
  NativeXML;

const
  MamePathDatabase : string = 'media\emulators\arcade\mame\database\';
  MameConfig : string = 'media\emulators\arcade\mame\config\config.xml';
  MameMats: array [1..3] of String = ('front_list','selection_list','back_mame');

  procedure LoadMame;
  
  procedure MameMenu(aTime: Double);
  procedure ReturnToMainMenu;

  procedure ShowImage(ImgName: String);
  procedure RunGame(game: string);
  procedure DoNothing;
  procedure ShowFPS;
  procedure CheckUpIcons(x,y,tabNum: Integer);
  procedure CheckRSideImages(x,y:Integer);
  procedure CheckInfoState(x,y: Integer);
  procedure CheckBars(x,y: integer);

  procedure fade(var delta:single; spd:single; f:boolean);
  procedure updBlurS(s: Single);
  procedure LoadVideoFile(VideoName: String);


const
  ExtraFeMamePath_images = 'media\emulators\arcade\mame\extrafe\';  


var

  MameTotalRoms,MameRomsEmulated: Integer;
  Mame_exe,Mame_path: string;

  Game: TSimpleListItem;

  fMousePressed: Boolean;
  fNumOfGames: TGLHUDText;
  fShowNum,fInfoImageText: TGLHUDText;
  fImgShow,fLed,frLed: TGLHUDSprite;
  fUFav,fUInfo,fUAvailable,fUGenre,fUYear,fSearch: TGLHUDSprite; //Up Bar
  fBarUp,fBardown,fBarLeft,fBarRight: TGLHUDSprite;//Arrows
  fMovie,fISnap,fICab,fIfly,fIMarq,fICPan,fIPcb,fITit,fIScor,fIbos: TGLHUDSprite; //Images and Video
  fCube1: TGLCube;

// Video Vars


// Vitual KeyBoard

  VK_Create: Boolean;

//  fImgShow: TGLPlane;
  IsImgShowed,showPicWaiting: Boolean;
  MTab,SideStateImage,fImgSnapNumOld,fSnapImgCountState: integer;
  pImgPath: array [0..9] of string;


  fade_blurS: boolean;
  delta_blurS: single;
  tw: integer = 1024;
  th: integer = 768;

// Mouse
  Mpos: TPoint;
implementation

uses
  main,main_menu,GLKeyboard, RTLConsts,GLContext;

procedure MameMenu(aTime: Double);
var
  comp: Tcomponent;
  i: Integer;

begin
  if MainForm.Tag = 0 then
    begin
// Init objects
      if MainForm.Mame_Background.Tag = 0 then
        begin

          MainForm.GLCadencer.Scene := MainForm.GLS_mame;
          MainForm.GLSceneViewer.Camera := MainForm.GlCamera_mame;
          MainForm.GlCamera_mame.TargetObject := MainForm.Mame_background;
          MainForm.mvp.Camera := MainForm.GlCamera_mame;

          loadText;
          loadImages;
//          load3dObjects;
          fListBox_Mame.fYPosition := 0;
          sItem := 6;
          MTab:= 0;
          SideStateImage:= 1;
          fImgSnapNumOld:= 0;
          fSnapImgCountState:= 0;

          fade_blurS := false;
          delta_blurS := 0;


          MainForm.mvp.Height := th;
          MainForm.mvp.Width := tw;
          
          if IsKeyDown(VK_RETURN) then
            DoNothing;

          VK_Create := IsVKeyboardCreated;
          IsImgShowed := False;
          showPicWaiting := False;
          fInfoImageText.Text := 'SNAPSHOTS';
          MyVideo := TPasLibVlcPlayer.Create(MainForm.video);
          MainForm.Mame_Background.Tag := 1;
        end;

        // Start the loop
      if MainForm.Mame_Background.Tag = 1 then
        begin
          MainForm.GLSceneViewer.Invalidate;
          GetCursorPos(Mpos);
          MPos := MainForm.GLSceneViewer.ScreenToClient(MPos);

          if IsVKeyboardShowing = true then
            begin
              if IsKeyDown(VK_ESCAPE) then
                ShowVKeyboard(false);
            end
          else if IsInfoPanelShowing = true then
            begin
              CheckInfoState(Mpos.X,Mpos.Y);
              if IsKeyDown(VK_ESCAPE) then
                CloseInfoPanel;
            end  
          else
            begin
              Game := fListBox_Mame.GetItemByIndex(sItem);
              fNumOfGames.Text := IntToStr(sItem - 5) + '/' + IntToStr(MameTotalRoms) + '/' + IntToStr(MameRomsEmulated);
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
              else if IsKeyDown('s') then
                ShowVKeyboard(true)
              else if IsKeyDown('i') then
                begin
                  ShowInfoPanelForGame(Game.GameName,Trim(Copy(Game.GameZip,0,length(Game.GameZip) - 4)));
                  fade_blurS := true;
                  sleep(200);
                end
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
              CheckUpIcons(Mpos.X,Mpos.Y,MTab);
              CheckRSideImages(Mpos.X,Mpos.y);
              CheckBars(Mpos.X,Mpos.Y);
            end;
          ShowFPS;
          MainForm.Hud_Shandow.Visible := delta_blurS > 0 ;
          updBlurS(dTime * 1.2);
        end;
    end;
end;

procedure RunGame(game: string);
begin
  MainForm.GLSceneViewer.Enabled := False;
  if PlayVideo = true then
    begin
      MainForm.video.Visible := false;
      MyVideo.Pause;
    end;
  ShellExecAndWait(Mame_exe,game,Mame_path,0);
  MainForm.GLSceneViewer.Enabled := True;
  if PlayVideo = true then
    begin
      sleep(300);
      MainForm.video.Visible := true;
      MyVideo.Resume;
    end;
end;

procedure DoNothing;
begin
  Sleep(200);
end;

procedure ShowImage(ImgName: String);
const
  NoPicFoundPath = 'media\emulators\arcade\mame\extrafe\imagenotfound.png';
  PicWaitingPath = 'media\emulators\arcade\mame\extrafe\picwaiting.png';
  NoVidFoundPath = 'media\emulators\arcade\mame\extrafe\videonotfound.png';
var
  SnapImg: string;
  ImgNum,fImgSnapNum,i: Integer;
  comp: TComponent;
begin
  ImgName := Trim(Copy(ImgName,0,Length(ImgName)-4));
  if sleeping > 100 then
    begin
//    Free Video      
      if PlayVideo = true then
        begin
          MyVideo.Stop;
          MainForm.video.Visible := false;
          PlayVideo := false;
        end;
//    Free Old Leds
      if MainForm.Timer_MameImageRolling.Enabled = false then
        begin
          if fImgSnapNumOld > 1 then
            begin
              for i := 0 to fImgSnapNumOld - 1 do
                begin
                  comp := MainForm.Dummy_mame.FindComponent('fled' + IntToStr(i));
                  TGLHUDSprite(comp).Free;
                end;
              frLed.Position.X := 530;
              frLed.Visible := false;
            end;
        end;
      if SideStateImage = 0  then
        snapImg := 'D:\emulators\arcade\mame\videos\' + ImgName + '.avi'
      else if SideStateImage > 1 then
        SnapImg := pImgPath[SideStateImage] + '\' + ImgName + '.png'
      else
        begin
          if MainForm.Timer_MameImageRolling.Enabled = false then
            begin
              fImgSnapNum := CountFilesOrFolders(pImgPath[1] + '\' + ImgName,'files');
              fImgSnapNumOld := fImgSnapNum;
            end;
          SnapImg := pImgPath[1] + '\' + ImgName + '\000' + IntToStr(fSnapImgCountState) + '.png';
        end;
      if not FileExists(SnapImg) then
        if SideStateImage <> 0 then
          SnapImg := ExtraFePath + NoPicFoundPath
        else
          SnapImg := ExtraFePath + NoVidFoundPath;
      if (SideStateImage = 0) and (SnapImg <> (ExtraFePath + NoVidFoundPath)) then
        begin
          if Assigned(fImgShow) then
            fImgShow.Visible := false;
          sleep(20);
          LoadVideoFile(SnapImg);
          MainForm.video.Visible := true;
          MyVideo.Resume;
          IsImgShowed := true;
          PlayVideo := true;
        end
      else
        begin
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
            fImgShow.SetSize(400,360)
          else
            fImgShow.SetSize(360,400);
          fImgShow.Position.X := 720;
          fImgShow.Position.Y := 390;
          if SideStateImage = 1 then
            if fImgSnapNum > 1 then
              begin
                for i := 0 to fImgSnapNum - 1 do
                  begin
                    fLed := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
                    fLed.Name := 'fLed' + IntToStr(i);
                    fled.Material.MaterialLibrary := MatLib;
                    fLed.Material.LibMaterialName := 'led';
                    fLed.Width := fLed.Material.GetActualPrimaryTexture.Image.Width;
                    fLed.Height := fLed.Material.GetActualPrimaryTexture.Image.Height;
                    fled.SetSize(18,18);
                    fled.Position.X := 530 + (i * 30);
                    fled.Position.Y := 600;
                    fled.Visible := true;
                    fSnapImgCountState := 0;
                    MainForm.Timer_MameImageRolling.Enabled := true;
                  end;
                if not Assigned(frLed) then
                  begin
                    frLed := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
                    frLed.Name := 'frLed0';
                    frLed.Material.MaterialLibrary := MatLib;
                    frLed.Material.LibMaterialName := 'rled';
                    frLed.Width := frLed.Material.GetActualPrimaryTexture.Image.Width;
                    frLed.Height := frLed.Material.GetActualPrimaryTexture.Image.Height;
                    frLed.SetSize(24,24);
                    frLed.Position.X := 530;
                    frLed.Position.Y := 600;
                    frLed.Visible := true;
                  end
                else
                  frLed.Visible := true;
              end;
          fImgShow.Visible := true;
          IsImgShowed := True;
          showPicWaiting := False;
        end
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
            fImgShow.SetSize(400,360)
          else
            fImgShow.SetSize(360,400);
          fImgShow.Position.X := 720;
          fImgShow.Position.Y := 390;

          IsImgShowed := True;
          showPicWaiting := True;
        end;
    end;
end;

procedure ShowFPS;
var
  vpX,vpY,vsX,vsY: string; //VideoPlane
  mX,mY: String; // Mouse
  vkX,vkY: String; // Virtual VkGlow
begin
// Shows FPS
//  fShowNum.Text := Format('%.1f FPS',
//                   [MainForm.GLSceneViewer.FramesPerSecond]);
//  Mainform.GLSceneViewer.ResetPerformanceMonitor;

// Shows The VideoPlane Position
{ vpX := Trim(Copy(FloatToStr(MainForm.Video1.Position.X),0,6));
  vpY := Trim(Copy(FloatToStr(MainForm.Video1.Position.Y),0,6));
  vsX := Trim(Copy(FloatToStr(MainForm.Video1.Scale.X),0,4));
  vsY := Trim(Copy(FloatToStr(MainForm.Video1.Scale.Y),0,4));
  fShowNum.Text := 'Video Panel : Position X=' + vpX + ' , Y='+ vpY + '     Scale X=' + vsX + ' , Y=' + vsY;}

// Shows the mouse cordinates
//   mX := IntToStr(Mpos.X);
//   mY := IntToStr(Mpos.Y);
//   fShowNum.Text := 'Mouse Position X=' + mX + ' , Y=' + mY;

// Shows VirtualKey Glow Position
  if VK_Create = true then
    begin
      vkX := FloatToStr(MyVKGlow.Position.X);
      vkY := FloatToStr(MyVKGlow.Position.Y);
      fShowNum.Text := 'My Glow Key  X=' + vkX + ' , Y=' + vkY;
    end;
end;

procedure ReturnToMainMenu;
begin
  MainForm.ActiveScene(1);
  Start := False;
  fromback := True;
  MainForm.Mame_Background.Tag := 0;
end;

procedure CheckUpIcons(x,y,tabNum: Integer);
begin
  if MTab <> 1 then
    begin
      if MainForm.IsMouseOverImage(fUFav,x,y) then
        begin
          fUFav.Material.LibMaterialName := 'fav_glow';
        end
      else
        fUFav.Material.LibMaterialName := 'fav';
      if MainForm.IsMouseOverImage(fUInfo,x,y) then
        begin
          fUInfo.Material.LibMaterialName := 'info_glow';
          if IsKeyDown(VK_LBUTTON) then
            begin
              fade_blurS := True;
              ShowInfoPanelForGame(Game.GameName,Trim(Copy(Game.GameZip,0,length(Game.GameZip) - 4)));
              sleep(200);              
            end;
        end
      else
        fUInfo.Material.LibMaterialName := 'info';
      if MainForm.IsMouseOverImage(fUAvailable,x,y) then
        fUAvailable.Material.LibMaterialName := 'ava_glow'
      else
        fUAvailable.Material.LibMaterialName := 'ava';
      if MainForm.IsMouseOverImage(fUGenre,x,y) then
        fUGenre.Material.LibMaterialName := 'genres_glow'
      else
        fUGenre.Material.LibMaterialName := 'genres';
      if MainForm.IsMouseOverImage(fUYear,x,y) then
        fUYear.Material.LibMaterialName := 'year_glow'
      else
        fUYear.Material.LibMaterialName := 'year';
      if MainForm.IsMouseOverImage(fSearch,x,y) then
        begin
          fSearch.Material.LibMaterialName := 'mSearch_Glow';
          if IsKeyDown(VK_LBUTTON) then
            ShowVKeyboard(true);  
        end
      else
        fSearch.Material.LibMaterialName := 'mSearch';
    end
  else
    fUFav.Material.LibMaterialName := 'fav_glow'
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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
          IsImgShowed := false;
          MainForm.Timer_MameImageRolling.Enabled := false;
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

procedure LoadMame;
var
  MameData: string;
  count,iPos,i: Integer;
  gamename,trimgamename,gamezip,romid : string;
  node: TXmlNode;
  
  MameIni: TextFile;
  text,t1,t2: String;
begin
  AddMaterials(MatLib, 'media\emulators\arcade\mame\extrafe\', MameMats, MameMats);
  MainForm.Mame_Background.Material.Assign(MatLib.Materials.GetLibMaterialByName('back_mame').Material);
  MainForm.Mame_Background.Height := MainForm.GLSceneViewer.Height;
  MainForm.Mame_Background.Width := MainForm.GLSceneViewer.Width;
  MainForm.Mame_Background.Position.X := CenterX;
  MainForm.Mame_Background.Position.Y := CenterY;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(3);

  if FileExists(MameConfig) then
    begin
      FXml_MameConfig := TNativeXml.CreateName('MameConfig');
      FXml_MameConfig.XmlFormat := xfReadable;
      FXml_MameConfig.LoadFromFile(MameConfig);
      Mame_Path := FXml_MameConfig.Root.ReadAttributeString('FullPathOfSelectedMame');
      Mame_Exe := FXml_MameConfig.Root.ReadAttributeString('SelectedMame');
      AssignFile(MameIni,FXml_MameConfig.Root.ReadAttributeString('FullPathOfSelectedMame')+ 'mame.ini');
      Reset(MameIni);
      while not Eof(MameIni) do
        begin
          Readln(MameIni,text);
          iPos := Pos(' ',text);
          t1 := Trim(Copy(text,0,iPos + 1));
          t2 := Trim(Copy(text,iPos,Length(text) - (iPos - 1)));
          if t1 = 'snapshot_directory' then
            begin
              if t2 = 'snap' then
                pImgPath[1] := Mame_Path + t2 + '\'
              else
                pImgPath[1] := t2;
              break;
            end;
        end;
      CloseFile(MameIni);
      With FXml_MameConfig.Root do 
        for i := 0 to NodeCount - 1 do 
          begin
            node := FXml_MameConfig.Root.Nodes[i];
            if node.Name = 'rowDir' then 
              if node.ReadAttributeString('MameName') = Mame_exe then
                begin
                  pImgPath[2] := node.ReadAttributeString('Cabinets');
                  pImgPath[3] := node.ReadAttributeString('Flyers');
                  pImgPath[4] := node.ReadAttributeString('Marquees');
                  pImgPath[5] := node.ReadAttributeString('Control_Panels');
                  pImgPath[6] := node.ReadAttributeString('PCBs');
                  pImgPath[7] := node.ReadAttributeString('Titles');
                  pImgPath[8] := node.ReadAttributeString('Scores');
                  pImgPath[9] := node.ReadAttributeString('Bosses');
                  break;
                end;
          end;        
      pImgPath[0] := '';
      MainForm.GLHUDText_Loading.Text := upDateProgressLoad(4);      
      Mame_Exe := Trim(Copy(Mame_Exe,0,Length(Mame_Exe)-4));
      MameData := MamePathDatabase + Mame_Exe + '_efuse.xml';
      if FileExists(MameData) then
        begin
          fListBox_Mame := TSimpleListBox.CreateAsChild(MainForm.Dummy_mame,MatLib,fexistFont,fnonexistFont);
          fListBox_Mame.Position.X := 240;
          fListBox_Mame.Position.Y := 330;
          for i := 0 to 5 do
            fListBox_Mame.AddItemTextNum(' ','',i,0);
          FXml_MameDatabase := TNativeXml.CreateName('MameInfo');
          FXml_MameDatabase.XmlFormat := xfReadable;
          Fxml_MameDatabase.LoadFromFile(MameData);
          MameRomsEmulated := Fxml_MameDatabase.Root.ReadAttributeInteger('RomsEmulated');
          MameTotalRoms := Fxml_MameDatabase.Root.ReadAttributeInteger('FinalRomsFound');
          for count := 4 to Fxml_MameDatabase.Root.NodeCount - 1 do
            begin
              node := Fxml_MameDatabase.Root.Nodes[count];
              gamezip := node.Nodes[2].Value;
              gamename := node.Nodes[1].Value;
              if LengthInPixels(gamename) > 320 then
                trimgamename := SetTextInGivenPixels(320,gamename)
              else
                trimgamename := gamename;
              if node.Nodes[3].Value <> ' ' then
                romid := node.Nodes[3].Value
              else
                romid := '0';
              fListBox_Mame.AddItemTextNum(trimgamename,gamezip,(count + 6) -4,StrToInt(romid));
            end;
          FXml_MameConfig.Free;
          Fxml_MameDatabase.Free;
          fListBox_Mame.fItems.Sort(CompareNames);
        end;
    end;
end;

procedure updBlurS;
var    
  g: single;
begin
  fade(delta_blurS, s, fade_blurS);

  MainForm.dc_blurS.Visible := delta_blurS > 0;
  if delta_blurS > 0 then
    begin
      g := 1 - delta_blurS * 0.15;
      MainForm.Hud_Shandow.Material.FrontProperties.Diffuse.SetColor(g, g, g, 1);
      with MainForm.MatLib1.LibMaterialByName('Fast_Blur').Material do
        begin
          MainForm.mvp.Render(MainForm.Dummy_mame);
          MainForm.mvp.CopyToTexture(Texture);
          FrontProperties.Diffuse.Alpha := delta_blurS;
        end;      
    end;    
end;

procedure fade(var delta:single; spd:single; f:boolean);
begin
  if f and (delta < 1) then
    delta := MinFloat(delta + spd, 1)
  else if not f and (delta > 0) then
    delta := MaxFloat(delta - spd * 2, 0);
end;

procedure LoadVideoFile(VideoName: String);
var
  vLeft,vTop: Integer;
begin
  MyVideo.Play(VideoName,100);
  MyVideo.Align := alClient;
  MainForm.video.Width := 400;
  MainForm.video.Height := 400;
  MainForm.video.Left := 520;
  MainForm.video.Top := 190;
  MyVideo.Pause;
end;

// Info State
procedure CheckInfoState(x,y: Integer);
begin
  if MainForm.IsMouseOverImage(iPanel,x,y) then
  else
    begin
      if IsKeyDown(VK_LBUTTON) then
        CloseInfoPanel;
    end;
end;  

// Bars
procedure CheckBars(x,y: integer);
begin
  if MainForm.IsMouseOverImage(fBarUp,x,y) then
    begin
      fBarUp.Visible := true;
      if IsKeyDown(VK_LBUTTON) then
        fListBox_Mame.DOClickUp;
    end
  else
    fBarUp.Visible := False;
  if MainForm.IsMouseOverImage(fBardown,x,y) then
    begin
      fBardown.Visible := true;
      if IsKeyDown(VK_LBUTTON) then
        fListBox_Mame.DOClickDown;
    end
  else
    fBardown.Visible := false;
  if MainForm.IsMouseOverImage(fBarLeft,x,y) then
    begin
      fBarLeft.Visible := true;
      if IsKeyDown(VK_LBUTTON) then
        fListBox_Mame.DOClickLeft;
    end
  else
    fBarLeft.Visible := false;
  if MainForm.IsMouseOverImage(fBarRight,x,y) then
    begin
      fBarRight.Visible := true;
      if IsKeyDown(VK_LBUTTON) then
        fListBox_Mame.DOClickRight;
    end
  else
    fBarRight.Visible := false;
end;

end.



// Kinisi pano kato aristera deksia tou glow....
{              if IsKeyDown(VK_DOWN) then
                MyVKGlow.Position.Y := MyVKGlow.Position.Y + 1
              else if IsKeyDown(VK_UP) then
                MyVKGlow.Position.Y := MyVKGlow.Position.Y - 1
              else if IsKeyDown(VK_LEFT) then
                MyVKGlow.Position.X := MyVKGlow.Position.X - 1
              else if IsKeyDown(VK_RIGHT) then
                MyVKGlow.Position.X := MyVKGlow.Position.X + 1}
