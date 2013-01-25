unit loadT;

interface
uses
  Classes,SysUtils,Controls,Windows,Forms,Graphics,Dialogs,IniFiles,
  GLKeyboard, GLHUDObjects,GlFilePNG, GLWindowsFont,GLObjects,
  GLParticleFX, GLBlur, GLPerlinPFX, GLMaterial,
  NativeXml,
  uMain_ListBox;

  procedure Intro(aTime: Double);
  procedure LoadTheProgressIcons;
  procedure FreeIntroScene;
  procedure LoadTheMenuTexturesandSounds;

  function upDateProgressLoad(phase: Integer): string;

  procedure LoadTheMameContent;
  procedure LoadTheZincContent;
  procedure LoadTheHatariContent;
  procedure LoadThePSXContent;
  procedure LoadTheKigbContent;

var
      
  //ExtraFe Globals
  ExtraFePath: string;

  fListBox_Mame,fListBox_Zinc,flistBox_Hatari,fListBox_psx,fListBox_Kigb: TSimpleListBox;

  fnonexistFont: TGLWindowsBitmapFont;
  fexistFont: TGLWindowsBitmapFont;

  progressPos: integer;
  progressText: string;

  //Intro Objects
  fExtraFeL,fMameL,fZincL,fHatariL,fpsxL,fKigbL: TGLHUDSprite;
  fFireCube: TGLCube;

  //Mame Global Vars
  MameTotalRoms: Integer;
  Mame_exe,Mame_path: string;
  MameSnapPath: String;
  FXml_MameDatabase,FXml_MameConfig: TNativeXml;

  //Zinc Global Vars
  ZincTotalRoms: Integer;
  Zinc_exe,zinc_path: string;
  fXml_ZincDatabase: TNativeXml;
  fIni_ZincConfig: TIniFile; 

implementation   


uses
  main,used_pro,
  bass;


procedure Intro(aTime: Double);
begin
  if MainForm.Background_intro.Tag = 0 then
    begin
      progressPos := 0;
      MainForm.GlCamera_intro.TargetObject := MainForm.Background_intro;
      MainForm.GLCadencer.Scene := MainForm.GLS_Intro;
      AddMaterial(MatLib, 'media\extrafe\intro\splash.png', 'splash');
      MainForm.Background_intro.Material.Assign(MatLib.Materials.GetLibMaterialByName('splash').Material);
      MainForm.Background_intro.Height := MainForm.GLSceneViewer.Height;
      MainForm.Background_intro.Width := MainForm.GLSceneViewer.Width;
      MainForm.Background_intro.Position.X := CenterX;
      MainForm.Background_intro.Position.Y := CenterY;
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := -0.8;

      MainForm.GLHUDText_ExtraFE_Ver.Position.X := 40;
      MainForm.GLHUDText_ExtraFE_Ver.Position.Y := 60;
      MainForm.GLHUDText_ExtraFE_Ver.Text := 'Ver : ' +  GetVersionInfo('ExtraFE.exe');
      MainForm.GLHUDText_ExtraFE_Ver.ModulateColor.Alpha := -0.8;
      MainForm.GLHUDText_ExtraFE_Ver.Material.FrontProperties.Diffuse.Alpha := -0.8;

      MainForm.GLHUDText_Loading.Position.X := 20;
      MainForm.GLHUDText_Loading.Position.Y := 640;
      MainForm.GLHUDText_Loading.Text := 'Loading.......';
      MainForm.GLHUDText_Loading.ModulateColor.Alpha := -0.8;
      MainForm.GLHUDText_Loading.Material.FrontProperties.Diffuse.Alpha := - 0.8;

      MainForm.Background_intro.Tag := 1;
      ExtraFePath := ExtractFilePath(Application.ExeName);
    end;

  if MainForm.Background_intro.Tag = 1 then
    if MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha < 1.5 then
      begin
        MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha + 0.4 * dTime;
        MainForm.GLHUDText_ExtraFE_Ver.ModulateColor.Alpha := MainForm.GLHUDText_ExtraFE_Ver.ModulateColor.Alpha + 0.4 * dTime;
        MainForm.GLHUDText_Loading.ModulateColor.Alpha := MainForm.GLHUDText_Loading.ModulateColor.Alpha + 0.4 * dTime;
      end
    else
      begin
        MainForm.Background_intro.Tag := 2;
      end;

  if MainForm.Background_intro.Tag = 2 then
    begin
      LoadTheProgressIcons;
      LoadTheMenuTexturesandSounds;
      fExtraFeL.Visible := True;
      Application.ProcessMessages;
      LoadTheMameContent;
      fMameL.Visible := True;
      LoadTheZincContent;
      fZincL.Visible := True;
      Application.ProcessMessages;
      MainForm.Background_intro.Tag := 3;
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := 2;
    end;

    if MainForm.Background_intro.Tag = 3 then
      if MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha > 0.1 then
        begin
          MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha - 0.01;
          MainForm.GLHUDText_ExtraFE_Ver.ModulateColor.Alpha := MainForm.GLHUDText_ExtraFE_Ver.ModulateColor.Alpha - 0.01;
          MainForm.GLHUDText_Loading.ModulateColor.Alpha := MainForm.GLHUDText_Loading.ModulateColor.Alpha - 0.01;
          fExtraFeL.Material.FrontProperties.Diffuse.Alpha := fExtraFeL.Material.FrontProperties.Diffuse.Alpha - 0.1;
          fMameL.Material.FrontProperties.Diffuse.Alpha := fMameL.Material.FrontProperties.Diffuse.Alpha - 0.1;
          Application.ProcessMessages;
        end
      else
        begin
          FreeIntroScene;
          MainForm.ActiveScene(1);
        end;
end;

procedure LoadTheMenuTexturesandSounds;
const
  MenuMats : array [1..1] of string = ('background');
begin
  AddMaterials(MatLib, 'media\extrafe\main_menu\', MenuMats, MenuMats);
  // Set The Background
  MainForm.BackGround.Material.Assign(MatLib.Materials.GetLibMaterialByName('background').Material);
  MainForm.BackGround.Height := MainForm.GLSceneViewer.Height;
  MainForm.BackGround.Width := MainForm.GLSceneViewer.Width;
  MainForm.BackGround.Position.X := CenterX;
  MainForm.BackGround.Position.Y := CenterY;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(7);

  // load the fonts
  fexistFont := TGLWindowsBitmapFont.Create(MainForm);
  fexistFont.Font.Name := 'Norton';
  fexistFont.Font.Size := 12;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(8);

  fnonexistFont := TGLWindowsBitmapFont.Create(MainForm);
  fnonexistFont.Font.Name := 'Norton';
  fnonexistFont.Font.Size := 10;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(0);

  AddMaterials(MatLib,'media\extrafe\main_menu\',['background','left_button','left_button_p','right_button','right_button_p'],['background','leftB','leftBP','rightB','rightBP']);
  AddMaterials(MatLib,'media\extrafe\main_menu\',['mame_cab','zinc_cab','hatari_cab','psxemulator_cab','kigb_cab','widgets'],['mameC','zincC','hatariC','psxemulatorC','kigbC','widgets']);
  AddMaterials(MatLib,'media\extrafe\main_menu\',['mame_cab_p','zinc_cab_p','hatari_cab_p','psxemulator_cab_p','kigb_cab_p'],['mameCA','ZincCA','hatariCA','psxemulatorCA','kigbCA']);
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(1);

  // Load Virtual Keyboard Matiriels
  AddMaterials(MatLib,'media\extrafe\virtualkey\',['back_key','down_b','up_b'],['VK_BackGround','VK_ButtonDown','VK_ButtonUp']);
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(2);
end;

procedure LoadTheMameContent;
const
  MamePathDatabase : string = 'media\emulators\arcade\mame\database\';
  MameConfig : string = 'media\emulators\arcade\mame\config\config.xml';
  MameMats: array [1..4] of String = ('front_list','back_list','selection_list','back_mame2');

var
  MameData: string;
  Mame_EmulatedRomSets, Mame_FoundRomSets: Integer;
  count,i: Integer;
  gamename,trimgamename,gamezip,romid : string;
  node: TXmlNode;

  MameIni: TextFile;
  text,t1,t2: string;

begin
// Add the materials to library
  AddMaterials(MatLib, 'media\emulators\arcade\mame\extrafe\', MameMats, MameMats);
  MainForm.Mame_Background.Material.Assign(MatLib.Materials.GetLibMaterialByName('back_mame2').Material);
  MainForm.Mame_Background.Height := MainForm.GLSceneViewer.Height;
  MainForm.Mame_Background.Width := MainForm.GLSceneViewer.Width;
  MainForm.Mame_Background.Position.X := CenterX;
  MainForm.Mame_Background.Position.Y := CenterY;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(3);

// Manipulate The XML Database
  if FileExists(MameConfig) then
    begin
      FXml_MameConfig := TNativeXml.CreateName('MameConfig');
      FXml_MameConfig.XmlFormat := xfReadable;
      FXml_MameConfig.LoadFromFile(MameConfig);
      Mame_Path := FXml_MameConfig.Root.ReadAttributeString('FullPathOfSelectedMame');
      AssignFile(MameIni,FXml_MameConfig.Root.ReadAttributeString('FullPathOfSelectedMame')+ 'mame.ini');
      Reset(MameIni);
      while not Eof(MameIni) do
        begin
          Readln(MameIni,text);
          i := Pos(' ',text);
          t1 := Trim(Copy(text,0,i + 1));
          t2 := Trim(Copy(text,i,Length(text) - (i - 1)));
          if t1 = 'snapshot_directory' then
            begin
              if t2 = 'snap' then
                MameSnapPath := Mame_Path + t2 + '\'
              else
                MameSnapPath := t2;
              Break;
            end;
        end;
      CloseFile(MameIni);
      MainForm.GLHUDText_Loading.Text := upDateProgressLoad(4);
      Mame_Exe := FXml_MameConfig.Root.ReadAttributeString('SelectedMame');
      Mame_Exe := Trim(Copy(Mame_Exe,0,Length(Mame_Exe)-4));
      MameData := MamePathDatabase + Mame_Exe + '_efuse.xml';
      if FileExists(MameData) then
        begin
          fListBox_Mame := TSimpleListBox.CreateAsChild(MainForm.Dummy_mame,MatLib,fexistFont,fnonexistFont);
          fListBox_Mame.Position.X := 240;
          fListBox_Mame.Position.Y := 310;
          for i := 0 to 5 do
            fListBox_Mame.AddItemTextNum(' ','',i,0);
          FXml_MameDatabase := TNativeXml.CreateName('MameInfo');
          FXml_MameDatabase.XmlFormat := xfReadable;
          Fxml_MameDatabase.LoadFromFile(MameData);
          Mame_EmulatedRomSets := Fxml_MameDatabase.Root.ReadAttributeInteger('RomsEmulated');
          Mame_FoundRomSets := Fxml_MameDatabase.Root.ReadAttributeInteger('FinalRomsFound');
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
          MameTotalRoms := Mame_FoundRomSets;
        end;
    end;
end;

procedure FreeIntroScene;
begin
  MatLib.Materials.GetLibMaterialByName('splash').Free;
  MainForm.GLS_Intro.Free;
end;

procedure LoadTheProgressIcons;
const
  Icons: array [0..5] of string = ('extrafeL','mameL','zincL','hatariL','psxL','kigbL');
begin
  AddMaterials(MatLib,'media\extrafe\intro\',Icons,Icons);

  fExtraFeL := TGLHUDSprite.CreateAsChild(MainForm.GLDummyCube_Intro);
  fExtraFeL.Material.MaterialLibrary := MatLib;
  fExtraFeL.Material.LibMaterialName := 'extrafeL';
  fExtraFeL.Width := fExtraFeL.Material.GetActualPrimaryTexture.Image.Width;
  fExtraFeL.Height := fExtraFeL.Material.GetActualPrimaryTexture.Image.Height;
  fExtraFeL.Position.X := 221;
  fExtraFeL.Position.Y := 707;
  fExtraFeL.Visible := False;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(0);

  fMameL := TGLHUDSprite.CreateAsChild(MainForm.GLDummyCube_Intro);
  fMameL.Material.MaterialLibrary := MatLib;
  fMameL.Material.LibMaterialName := 'mameL';
  fMameL.Width := fMameL.Material.GetActualPrimaryTexture.Image.Width;
  fMameL.Height := fMameL.Material.GetActualPrimaryTexture.Image.Height;
  fMameL.Position.X := 338;
  fMameL.Position.Y := 706;
  fMameL.Visible := False;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(1);

  fZincL := TGLHUDSprite.CreateAsChild(MainForm.GLDummyCube_Intro);
  fZincL.Material.MaterialLibrary := MatLib;
  fZincL.Material.LibMaterialName := 'zincL';
  fZincL.Width := fZincL.Material.GetActualPrimaryTexture.Image.Width;
  fZincL.Height := fZincL.Material.GetActualPrimaryTexture.Image.Height;
  fZincL.Position.X := 454;
  fZincL.Position.Y := 707;
  fZincL.Visible := False;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(2);

  fHatariL := TGLHUDSprite.CreateAsChild(MainForm.GLDummyCube_Intro);
  fHatariL.Material.MaterialLibrary := MatLib;
  fHatariL.Material.LibMaterialName := 'hatariL';
  fHatariL.Width := fHatariL.Material.GetActualPrimaryTexture.Image.Width;
  fHatariL.Height := fHatariL.Material.GetActualPrimaryTexture.Image.Height;
  fHatariL.Position.X := 548;
  fHatariL.Position.Y := 710;
  fHatariL.Visible := False;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(3);

  fpsxL := TGLHUDSprite.CreateAsChild(MainForm.GLDummyCube_Intro);
  fpsxL.Material.MaterialLibrary := MatLib;
  fpsxL.Material.LibMaterialName := 'psxL';
  fpsxL.Width := fpsxL.Material.GetActualPrimaryTexture.Image.Width;
  fpsxL.Height := fpsxL.Material.GetActualPrimaryTexture.Image.Height;
  fpsxL.Position.X := 656;
  fpsxL.Position.Y := 710;
  fpsxL.Visible := False;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(4);

  fKigbL := TGLHUDSprite.CreateAsChild(MainForm.GLDummyCube_Intro);
  fKigbL.Material.MaterialLibrary := MatLib;
  fKigbL.Material.LibMaterialName := 'kigbL';
  fKigbL.Width := fKigbL.Material.GetActualPrimaryTexture.Image.Width;
  fKigbL.Height := fKigbL.Material.GetActualPrimaryTexture.Image.Height;
  fKigbL.Position.X := 766;
  fKigbL.Position.Y := 708;
  fKigbL.Visible := False;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(5);

  fFireCube := TGLCube.CreateAsChild(MainForm.GLDummyCube_Intro);
  AddMaterial(MatLib,'media\extrafe\intro\cubeback1.png','cubeback');
  fFireCube.Material.MaterialLibrary := MatLib;
  fFireCube.Material.LibMaterialName := 'cubeback';
  fFireCube.CubeWidth := 0.14;
  fFireCube.CubeHeight := 0.14;
  fFireCube.Position.X := 0.55;
  fFireCube.Position.Y := 0.6;
  fFireCube.Visible := True;
  MainForm.GLHUDText_Loading.Text := upDateProgressLoad(6);
end;

procedure LoadTheZincContent;
const
  ZincConfigIni: string = 'media\emulators\arcade\zinc\config\config.ini';
  ZincDatabase: string = 'media\emulators\arcade\zinc\database\zinc_efuse.xml';
  ZincMats: array [1..1] of String = ('zinc_back');

var
  gamezip,gamename: string;
  gameid,romexist: Integer;

  i,k: Integer;
  node: TXmlNode;

begin
  AddMaterials(MatLib, 'media\emulators\arcade\zinc\extrafe\', ZincMats, ZincMats);
  MainForm.zinc_back.Material.Assign(MatLib.Materials.GetLibMaterialByName('zinc_back').Material);
  MainForm.zinc_back.Height := MainForm.GLSceneViewer.Height;
  MainForm.zinc_back.Width := MainForm.GLSceneViewer.Width;
  MainForm.zinc_back.Position.X := CenterX;
  MainForm.zinc_back.Position.Y := CenterY;

  if FileExists(ZincConfigIni) then
    begin
      k := 0;
      ZincTotalRoms := 71;
      fXml_ZincDatabase := TNativeXml.CreateName('Zinc');
      fXml_ZincDatabase.XmlFormat := xfReadable;
      fXml_ZincDatabase.LoadFromFile(ZincDatabase);
      fIni_ZincConfig := TIniFile.Create(ZincConfigIni);
      Zinc_exe := fIni_ZincConfig.ReadString('Zinc_Paths','Zinc_Exe',Zinc_exe);
      zinc_path := fIni_ZincConfig.ReadString('Zinc_Paths','Zinc_Path',zinc_path);
      fListBox_Zinc := TSimpleListBox.CreateAsChild(MainForm.GLDummy_zinc,MatLib,fexistFont,fnonexistFont);
      fListBox_Zinc.Position.X := 240;
      fListBox_Zinc.Position.Y := 310;
      for k := 0 to 5 do
        fListBox_Zinc.AddItemTextNum(' ','',k,0);
      with fXml_ZincDatabase.Root do
        for i := 0 to NodeCount - 1 do
          begin
            node := fXml_ZincDatabase.Root.Nodes[i];
            if node.Name = 'row' then
              begin
                gamename := node.ReadAttributeString('GameName');
                if LengthInPixels(gamename) > 320 then
                  gamename := SetTextInGivenPixels(320,gamename);
                gamezip := node.ReadAttributeString('RomName');
                gameid := node.ReadAttributeInteger('RunGameNumber');
                if node.ReadAttributeString('IfGameExists') = 'ok' then
                  romexist := 1
                else
                  romexist := 0;
                fListBox_Zinc.AddItemTextNum(gamename,gamezip,gameid,romexist);
//                k := k + 1;
              end;
          end;
      fXml_ZincDatabase.Free;
      fIni_ZincConfig.Free;
      fListBox_Zinc.fItems.Sort(CompareNames);
    end;
end;

procedure LoadTheHatariContent;
begin

end;

procedure LoadThePSXContent;
begin

end;

procedure LoadTheKigbContent;
begin

end;

function upDateProgressLoad(phase: Integer): string;
begin
  case phase of
    0 : progressText := 'Loading';
    1 : progressText := 'Loading.';
    2 : progressText := 'Loading..';
    3 : progressText := 'Loading...';
    4 : progressText := 'Loading....';
    5 : progressText := 'Loading.....';
    6 : progressText := 'Loading......';
    7 : progressText := 'Loading.......';
    8 : progressText := 'Loading........';
  end;
  Result := progressText;
end;

end.




