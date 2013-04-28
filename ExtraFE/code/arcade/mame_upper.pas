unit mame_upper;

interface
uses
  SysUtils,Windows,Graphics,Classes,Forms,ExtCtrls,Controls,Dialogs,
  used_pro,loadT,uMain_ListBox,vitru_key,mame_res,
  GLScene,VectorGeometry,GLCrossPlatform,GLObjects,GLHUDObjects,
  GLFilePNG,GLMaterial,PasLibVlcPlayerUnit,
  NativeXML;

  procedure ShowInfoPanelForGame(mGame,mRom: String);
  function IsInfoPanelShowing: Boolean;
  procedure CloseInfoPanel;
  procedure FreeInfoPanel;

var
  // Info Panel
  iInfo,iPanel :TGLHUDSprite;
  iGameName,iYear,iManuf,iPlayers,iPSim,iPAlt,iLevels,iGenre: TGLHUDText;
  iDYear,iDManuf,iDPlayers,iDPSim,iDPAlt,iDLevels,iDGenre: string;

implementation

uses
  main,mame;


// Info Panel  
procedure ShowInfoPanelForGame(mGame,mRom: String);
var
  ImgNum: Integer;
  ImgMName: String;
  node: TXmlNode;
  i,iPos: integer;
begin
  MainForm.Dummy_infotext.Visible := True;
  with FXml_ArcadeDatabase.Root do
    for i := 0 to NodeCount - 1 do
      begin
        node := FXml_ArcadeDatabase.Root.Nodes[i];
        if node.Name = 'row' then
          if node.ReadAttributeString('RomName') = mRom then
            begin
              iDManuf := node.ReadAttributeString('Manufactor');
              iDYear := node.ReadAttributeString('Year');
              iDPlayers := node.ReadAttributeString('Players');
              iDPSim := node.ReadAttributeString('Sim');
              iDPAlt := node.ReadAttributeString('Alt');
              iDLevels := node.ReadAttributeString('Levels');
              iDGenre := node.ReadAttributeString('Genre');
              iPos := Pos('/',iDGenre);
              if iPos <> 0 then
                iDGenre := Trim(Copy(iDGenre,0,iPos - 1));
              Break;
            end;         
      end;
  if not Assigned(iInfo) then
    begin
      iInfo := TGLHUDSprite.CreateAsChild(MainForm.Dummy_info);
      iInfo.Material.MaterialLibrary := MatLib;
      iInfo.Material.LibMaterialName := 'info_glow';
      iInfo.Name := 'iInfo0';
      iInfo.Width := iInfo.Material.GetActualPrimaryTexture.Image.Width;
      iInfo.Height := iInfo.Material.GetActualPrimaryTexture.Image.Height;
      iInfo.SetSize(64,64);
      iInfo.Position.SetPoint(115,140,0);
      iInfo.Visible := true;
    end;
  if not Assigned(iGameName) then
    begin
      iGameName := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iGameName.BitmapFont := loadT.fexistFont;
      iGameName.ModulateColor.AsWinColor := clWhite;
      iGameName.Layout := tlCenter;
      iGameName.Position.X := 160;
      iGameName.Position.Y := 126;
      iGameName.Text := mGame;
      iGameName.Visible := true;
    end
  else
    iGameName.Text := mGame;
  if not Assigned(iManuf) then
    begin
      iManuf := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iManuf.BitmapFont := loadT.fexistFont;
      iManuf.ModulateColor.AsWinColor := clWhite;
      iManuf.Layout := tlCenter;
      iManuf.Position.X := 120;
      iManuf.Position.Y := 190;
      iManuf.Text := 'Manufactor : ' + iDManuf;
      iManuf.Visible := true;
    end
  else
    iManuf.Text := 'Manufactor : ' + iDManuf;
  if not Assigned(iYear) then
    begin
      iYear := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iYear.BitmapFont := loadT.fexistFont;
      iYear.ModulateColor.AsWinColor := clWhite;
      iYear.Layout := tlCenter;
      iYear.Position.X := 120;
      iYear.Position.Y := 210;
      iYear.Text := 'Year : ' + iDYear;
      iYear.Visible := true;
    end
  else
    iYear.Text := 'Year : ' + iDYear;
  if not Assigned(iGenre) then
    begin
      iGenre := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iGenre.BitmapFont := loadT.fexistFont;
      iGenre.ModulateColor.AsWinColor := clWhite;
      iGenre.Layout := tlCenter;
      iGenre.Position.X := 120;
      iGenre.Position.Y := 250;
      iGenre.Text := 'Genre : ' + iDGenre;
      iGenre.Visible := true;
    end
  else
    iGenre.Text := 'Genre : ' + iDGenre;
  if not Assigned(iPlayers) then
    begin
      iPlayers := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iPlayers.BitmapFont := loadT.fexistFont;
      iPlayers.ModulateColor.AsWinColor := clWhite;
      iPlayers.Layout := tlCenter;
      iPlayers.Position.X := 120;
      iPlayers.Position.Y := 290;
      iPlayers.Text := 'Players : ' + iDPlayers;
      iPlayers.Visible := true;
    end
  else
    iPlayers.Text := 'Players : ' + iDPlayers;
  if not Assigned(iPSim) then
    begin
      iPSim := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iPSim.BitmapFont := loadT.fexistFont;
      iPSim.ModulateColor.AsWinColor := clWhite;
      iPSim.Layout := tlCenter;
      iPSim.Position.X := 120;
      iPSim.Position.Y := 310;
      iPSim.Text := 'Can play together? : ' + iDPSim;
      iPSim.Visible := true;
    end
  else
    iPSim.Text := 'Can play together? : ' + iDPSim;
  if not Assigned(iPAlt) then
    begin
      iPAlt := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iPAlt.BitmapFont := loadT.fexistFont;
      iPAlt.ModulateColor.AsWinColor := clWhite;
      iPAlt.Layout := tlCenter;
      iPAlt.Position.X := 120;
      iPAlt.Position.Y := 330;
      iPAlt.Text := 'Can play alternative? : ' + iDPAlt;
      iPAlt.Visible := true;
    end
  else
    iPAlt.Text := 'Can play alternative? : ' + iDPAlt;
  if not Assigned(iLevels) then
    begin
      iLevels := TGLHUDText.CreateAsChild(MainForm.Dummy_infotext);
      iLevels.BitmapFont := loadT.fexistFont;
      iLevels.ModulateColor.AsWinColor := clWhite;
      iLevels.Layout := tlCenter;
      iLevels.Position.X := 120;
      iLevels.Position.Y := 390;
      iLevels.Text := 'Levels : ' + iDLevels;
      iLevels.Visible := true;
    end
  else
    iLevels.Text := 'Levels : ' + iDLevels;
  if not Assigned(iPanel) then
    begin
      AddMaterial(MatLib,ProgramPath + ExtraFeMamePath_images + 'info\infopanel.png','iPanel');
      iPanel := TGLHUDSprite.CreateAsChild(MainForm.Dummy_info);
      iPanel.Material.MaterialLibrary := MatLib;
      iPanel.Material.LibMaterialName := 'iPanel';
      iPanel.Name := 'iPanel0';
      iPanel.Width := iPanel.Material.GetActualPrimaryTexture.Image.Width;
      iPanel.Height := iPanel.Material.GetActualPrimaryTexture.Image.Height;
      iPanel.Position.SetPoint(512,384,0);
      iPanel.Visible := true;
    end;
  if PlayVideo = true then
    begin
      MainForm.video.Visible := false;
      MyVideo.SetAudioVolume(50);
    end;
end;

function IsInfoPanelShowing: Boolean;
begin
  Result := MainForm.Dummy_infotext.Visible;
end;

procedure CloseInfoPanel;
begin
  MainForm.Dummy_infotext.Visible := false;
  fade_blurS := false;
  Sleep(200);
  if PlayVideo = true then
    begin
      MainForm.video.Visible := true;
      MyVideo.SetAudioVolume(100);
    end;
end;

procedure FreeInfoPanel;
begin
  iInfo.Free;
  iPanel.Free;
  iGameName.Free;
  iManuf.Free;
  iYear.Free;
  iGenre.Free;
  iPlayers.Free;
  iPSim.Free;
  iPAlt.Free;
  iLevels.Free;
end;

end.
