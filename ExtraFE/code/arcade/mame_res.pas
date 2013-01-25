unit mame_res;

interface
uses
  SysUtils,Windows,Graphics,Classes,Forms,ExtCtrls,
  used_pro,loadT,uMain_ListBox,vitru_key,
  GLScene,VectorGeometry,GLCrossPlatform,GLObjects,GLHUDObjects,
  GLFilePNG;

procedure loadText;
procedure loadImages;
procedure load3dObjects;

implementation
uses
  main,mame;

procedure loadText;
begin
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
      fShowNum.ModulateColor.AsWinColor := clRed;
      fShowNum.Layout := tlCenter;
      fShowNum.Alignment := taRightJustify;
      fShowNum.Position.X := 980;
      fShowNum.Position.Y := 20;
    end;
  if not Assigned(fInfoImageText) then
    begin
      fInfoImageText := TGLHUDText.CreateAsChild(MainForm.Dummy_mame);
      fInfoImageText.BitmapFont := loadT.fexistFont;
      fInfoImageText.ModulateColor.AsWinColor := clWhite;
      fInfoImageText.Layout := tlCenter;
      fInfoImageText.Rotation := 90;
      fInfoImageText.Position.X := 940;
      fInfoImageText.Position.Y := 360;
    end;
end;

procedure loadImages;
begin
  if not Assigned(fImgFav) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'fav.png','fav');
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'fav_glow.png','fav_glow');
      fImgFav := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fImgFav.Material.MaterialLibrary := MatLib;
      fImgFav.Material.LibMaterialName := 'fav';
      fImgFav.Width := fImgFav.Material.GetActualPrimaryTexture.Image.Width;
      fImgFav.Height := fImgFav.Material.GetActualPrimaryTexture.Image.Height;
      fImgFav.SetSize(32,32);
      fImgFav.Position.X := 60;
      fImgFav.Position.Y := 16;
      fImgFav.Visible := True;
    end;
  if not Assigned(fMovie) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'movie.png','movie');
      fMovie := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fMovie.Material.MaterialLibrary := MatLib;
      fMovie.Material.LibMaterialName := 'movie';
      fMovie.Width := fMovie.Material.GetActualPrimaryTexture.Image.Width;
      fMovie.Height := fMovie.Material.GetActualPrimaryTexture.Image.Height;
      fMovie.SetSize(50,40);
      fMovie.Position.X := 1032; //1002 out //1032 in
      fMovie.Position.Y := 200;
      fMovie.Visible := True;
    end;
  if not Assigned(fISnap) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_snap.png','snapshot');
      fISnap := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fISnap.Material.MaterialLibrary := MatLib;
      fISnap.Material.LibMaterialName := 'snapshot';
      fISnap.Width := fISnap.Material.GetActualPrimaryTexture.Image.Width;
      fISnap.Height := fISnap.Material.GetActualPrimaryTexture.Image.Height;
      fISnap.SetSize(50,35);
      fISnap.Position.X := 999; //999 out //1029 in 
      fISnap.Position.Y := 245;
      fISnap.Visible := True;
    end;
  if not Assigned(fICab) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_cab.png','cabinet');
      fICab := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fICab.Material.MaterialLibrary := MatLib;
      fICab.Material.LibMaterialName := 'cabinet';
      fICab.Width := fICab.Material.GetActualPrimaryTexture.Image.Width;
      fICab.Height := fICab.Material.GetActualPrimaryTexture.Image.Height;
      fICab.SetSize(50,35);
      fICab.Position.X := 1029;
      fICab.Position.Y := 285;
      fICab.Visible := True;
    end;
  if not Assigned(fIfly) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_flyer.png','flyer');
      fIfly := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fIfly.Material.MaterialLibrary := MatLib;
      fIfly.Material.LibMaterialName := 'flyer';
      fIfly.Width := fIfly.Material.GetActualPrimaryTexture.Image.Width;
      fIfly.Height := fIfly.Material.GetActualPrimaryTexture.Image.Height;
      fIfly.SetSize(50,35);
      fIfly.Position.X := 1029;
      fIfly.Position.Y := 325;
      fIfly.Visible := True;
    end;
  if not Assigned(fIMarq) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_marquee.png','marquee');
      fIMarq := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fIMarq.Material.MaterialLibrary := MatLib;
      fIMarq.Material.LibMaterialName := 'marquee';
      fIMarq.Width := fIMarq.Material.GetActualPrimaryTexture.Image.Width;
      fIMarq.Height := fIMarq.Material.GetActualPrimaryTexture.Image.Height;
      fIMarq.SetSize(50,35);
      fIMarq.Position.X := 1029;
      fIMarq.Position.Y := 365;
      fIMarq.Visible := True;
    end;
  if not Assigned(fICPan) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_controlpanel.png','controlpanel');
      fICPan := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fICPan.Material.MaterialLibrary := MatLib;
      fICPan.Material.LibMaterialName := 'controlpanel';
      fICPan.Width := fICPan.Material.GetActualPrimaryTexture.Image.Width;
      fICPan.Height := fICPan.Material.GetActualPrimaryTexture.Image.Height;
      fICPan.SetSize(50,35);
      fICPan.Position.X := 1029;
      fICPan.Position.Y := 405;
      fICPan.Visible := True;
    end;
  if not Assigned(fIPcb) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_pcb.png','pcb');
      fIPcb := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fIPcb.Material.MaterialLibrary := MatLib;
      fIPcb.Material.LibMaterialName := 'pcb';
      fIPcb.Width := fIPcb.Material.GetActualPrimaryTexture.Image.Width;
      fIPcb.Height := fIPcb.Material.GetActualPrimaryTexture.Image.Height;
      fIPcb.SetSize(50,35);
      fIPcb.Position.X := 1029;
      fIPcb.Position.Y := 445;
      fIPcb.Visible := True;
    end;
  if not Assigned(fITit) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_title.png','title');
      fITit := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fITit.Material.MaterialLibrary := MatLib;
      fITit.Material.LibMaterialName := 'title';
      fITit.Width := fITit.Material.GetActualPrimaryTexture.Image.Width;
      fITit.Height := fITit.Material.GetActualPrimaryTexture.Image.Height;
      fITit.SetSize(50,35);
      fITit.Position.X := 1029;
      fITit.Position.Y := 485;
      fITit.Visible := True;
    end;
  if not Assigned(fIScor) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_score.png','score');
      fIScor := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fIScor.Material.MaterialLibrary := MatLib;
      fIScor.Material.LibMaterialName := 'score';
      fIScor.Width := fIScor.Material.GetActualPrimaryTexture.Image.Width;
      fIScor.Height := fIScor.Material.GetActualPrimaryTexture.Image.Height;
      fIScor.SetSize(50,35);
      fIScor.Position.X := 1029;
      fIScor.Position.Y := 525;
      fIScor.Visible := True;
    end;
  if not Assigned(fIbos) then
    begin
      AddMaterial(MatLib,ExtraFePath + ExtraFeMamePath_images + 'image_boss.png','boss');
      fIbos := TGLHUDSprite.CreateAsChild(MainForm.Dummy_mame);
      fIbos.Material.MaterialLibrary := MatLib;
      fIbos.Material.LibMaterialName := 'boss';
      fIbos.Width := fIbos.Material.GetActualPrimaryTexture.Image.Width;
      fIbos.Height := fIbos.Material.GetActualPrimaryTexture.Image.Height;
      fIbos.SetSize(50,35);
      fIbos.Position.X := 1029;
      fIbos.Position.Y := 565;
      fIbos.Visible := True;
    end;
end;

procedure load3dObjects;
begin
  if not Assigned(fCube1) then
    begin
      fCube1 := TGLCube.CreateAsChild(MainForm.Dummy_mame);
//      fCube1 := TGLCube.Create(MainForm.GLS_mame);
//      AddMaterial(MatLib,'media\extrafe\intro\cubeback1.png','cubeback');
      fCube1.Material.MaterialLibrary := MatLib;
      fCube1.Material.LibMaterialName := 'cubeback';
      fCube1.CubeWidth := 1;
      fCube1.CubeHeight := 1;
      fCube1.CubeDepth := 1;
      fCube1.Position.X := 0;
      fCube1.Position.Y := 0;
      fCube1.Position.Z := 0;
      fCube1.Visible := True;
    end;
end;

end.
