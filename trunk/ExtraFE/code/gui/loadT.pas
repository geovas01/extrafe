unit loadT;

interface
uses
  Classes,SysUtils,Controls,Windows,Forms,
  GLKeyboard, GLHUDObjects,GlFilePNG,
  OmniXML,OmniXMLUtils,mame_xmlext,
  uSimpleListBox;

  procedure Intro(aTime: Double);
  procedure Progress_Bar_Intro(Progresspercent: real);
  procedure LoadTheMenuTexturesandSounds;
  procedure LoadTheMameContent;

var
  Mame_EmulatedRomSets, Mame_FoundRomSets: Integer;

  fListBox: TSimpleListBox;
  GameMan: TStringList;
  GameYear: TStringList;
  GameClone: TStringList;  

    
implementation
uses
  main,used_pro,
  bass;


procedure Intro(aTime: Double);
begin
  if MainForm.Background_intro.Tag = 0 then
    begin
      AddMaterial(MatLib, 'media\extrafe\intro\splash.png', 'splash');
      MainForm.Background_intro.Material.Assign(MatLib.Materials.GetLibMaterialByName('splash').Material);
      MainForm.Background_intro.Height := MainForm.GLSceneViewer.Height;
      MainForm.Background_intro.Width := MainForm.GLSceneViewer.Width;
      MainForm.Background_intro.Position.X := CenterX;
      MainForm.Background_intro.Position.Y := CenterY;
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := -0.8;
      MainForm.Background_intro.Material.FrontProperties.Ambient.Red := 255;
      MainForm.Background_intro.Material.FrontProperties.Ambient.Green := 255;
      MainForm.Background_intro.Material.FrontProperties.Ambient.Blue := 255;
      MainForm.Background_intro.Tag := 1;
    end;

  if MainForm.Background_intro.Tag = 1 then
    if MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha < 1.5 then
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha + 0.3 * dTime
    else
      MainForm.Background_intro.Tag := 2;

  if MainForm.Background_intro.Tag = 2 then
    begin
      MainForm.GLHUDText_ExtraFE_Ver.Position.X := 5;
      MainForm.GLHUDText_ExtraFE_Ver.Position.Y := 710;
      MainForm.GLHUDText_ExtraFE_Ver.Text := 'ExtraFE Ver     : '+ GetVersionInfo('ExtraFE.exe');
      MainForm.GLHUDText_confEditor_Ver.Position.X := 5;
      MainForm.GLHUDText_confEditor_Ver.Position.Y := 730;
      MainForm.GLHUDText_confEditor_Ver.Text := 'confEditor Ver : '+ GetVersionInfo('confEditor.exe');
      MainForm.GLHUDText_Progress_Info.Position.X := 380;
      MainForm.GLHUDText_Progress_Info.Position.Y := CenterY - 30;
      MainForm.GLHUDText_Progress_Info.Text := 'Start';

      Progress_Bar_Intro(30);
      LoadTheMenuTexturesandSounds;
      Progress_Bar_Intro(0);
      LoadTheMameContent;
      MainForm.GLHUDText_ExtraFE_Ver.Visible := False;
      MainForm.GLHUDText_confEditor_Ver.Visible := False;
      MainForm.Background_intro.Tag := 3;
    end;

    if MainForm.Background_intro.Tag = 3 then
      if MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha > 0.3 then
        MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha - 0.2 * dTime
      else
        IntroScene := False;

end;

procedure ProgresS_Bar_intro(Progresspercent: real);
var
  NMaskWidth: Single;
begin
  MainForm.Progress.Visible := True;
  with MainForm do
  begin
    if Progresspercent < 100 then
    begin
      if Progress.Tag <> 1 then
      begin
        AddMaterial(MatLib, 'media\extrafe\intro\progress.png', 'Progress');
        Progress.Material.Assign(MatLib.Materials.GetLibMaterialByName('Progress').Material);
        Progress.Height := 57;
        Progress.Width := 488;
        Progress.Position.X := CenterX - 20;
        Progress.Position.y := CenterY + 30;
        Progress.Tag := 1;

        AddMaterial(MatLib, 'media\extrafe\intro\mask.png', 'Mask');
        mask.Material.Assign(MatLib.Materials.GetLibMaterialByName('Mask').Material);
      end;

      if Bar.Tag <> 1 then
      begin
        AddMaterial(MatLib, 'media\extrafe\intro\bar.png', 'bar');
        bar.Material.Assign(MatLib.Materials.GetLibMaterialByName('bar').Material);
        Bar.Height := 57;
        Bar.Width := 488;
        Bar.Position.X := CenterX - 20;
        Bar.Position.y := CenterY + 30;
        Bar.Tag := 1;
      end;
      mask.Width := (Bar.Width - 16);
      mask.Height := (Bar.Height - 12);
      mask.Position := Bar.Position;
      mask.Position.X := mask.Position.X + ((mask.Width / 100 * Progresspercent)/2);
      NMaskWidth:=mask.Width - mask.Width / 100 * Progresspercent;
      mask.Width:=NMaskWidth;
      MainForm.GLHUDText_Progress.Position.X := CenterX-20;
      MainForm.GLHUDText_Progress.Position.Y := CenterY+18;
      MainForm.GLHUDText_Progress.Text := FloatToStr(Progresspercent + 1) + '%';
      Progress_Bar.Visible := true;
      Application.ProcessMessages;
    end
   else
    Progress.Visible := False;
  end
end;

procedure LoadTheMenuTexturesandSounds;
const
  MenuMats : array [1..3] of string = ('main_background','left_w','right_w');
  EarthMats: array [1..6] of String = ('back', 'mame', 'emulators', 'arcade', 'zinc','exit');
  PlanetMats: array [1..4] of String = ('planet_1', 'planet_2', 'planet_3','planet_4');
begin
  AddMaterials(MatLib, 'media\extrafe\main_menu\', MenuMats, MenuMats);
  // Set The Background
  MainForm.BackGround.Material.Assign(MatLib.Materials.GetLibMaterialByName('main_background').Material);
  MainForm.BackGround.Height := MainForm.GLSceneViewer.Height;
  MainForm.BackGround.Width := MainForm.GLSceneViewer.Width;
  MainForm.BackGround.Position.X := CenterX;
  MainForm.BackGround.Position.Y := CenterY;
  MainForm.BackGround.Material.FrontProperties.Diffuse.Alpha := 0;
  MainForm.BackGround.Material.FrontProperties.Ambient.Red := 255;
  MainForm.BackGround.Material.FrontProperties.Ambient.Green := 255;
  MainForm.BackGround.Material.FrontProperties.Ambient.Blue := 255;
  // Set The Left Wing
  MainForm.Left_Wing.Material.Assign(MatLib.Materials.GetLibMaterialByName('left_w').Material);
  MainForm.Left_Wing.Height := 768;
  MainForm.Left_Wing.Width := 389;
  MainForm.Left_Wing.Position.X := 186;
  MainForm.Left_Wing.Position.Y := CenterY;
  // Set The Right Wing
  MainForm.Right_Wing.Material.Assign(MatLib.Materials.GetLibMaterialByName('right_w').Material);
  MainForm.Right_Wing.Height := 768;
  MainForm.Right_Wing.Width := 389;
  MainForm.Right_Wing.Position.X := 1100;
  MainForm.Right_Wing.Position.Y := CenterY;
  MainForm.GLHUDText_Progress_Info.Text := 'Load Menu Materials';
  Progress_Bar_Intro(50);
  AddMaterials(MatLib, 'media\extrafe\main_menu\', EarthMats, EarthMats);
  Progress_Bar_Intro(70);
  AddMaterials(MatLib, 'media\extrafe\main_menu\',PlanetMats, PlanetMats);
  Progress_Bar_Intro(99);
end;

procedure LoadTheMameContent;
const
  MamePathDatabase : string = 'media\emulators\arcade\mame\database\';
  MameConfig : string = 'media\emulators\arcade\mame\config\config.xml';
  MameMats: array [1..4] of String = ('front_list','back_list','selection_list','back_mame');

var
  MameConfig_XML : IXMLDocument;
  MameDatabase_XML: IXMLDocument;
  GameList: IXMLNodeList;
  nodeGame : IXMLNode;  
  Mame_Exe,MameData : string;
  count: Integer;
//  process_num: Real;
//  process_str: string;

begin
// Add the materials to library
  MainForm.GLHUDText_Progress_Info.Text := 'Start Mame';
  AddMaterials(MatLib, 'media\emulators\arcade\mame\extrafe\', MameMats, MameMats);
  MainForm.Mame_Background.Material.Assign(MatLib.Materials.GetLibMaterialByName('back_mame').Material);
  MainForm.Mame_Background.Height := MainForm.GLSceneViewer.Height;
  MainForm.Mame_Background.Width := MainForm.GLSceneViewer.Width;
  MainForm.Mame_Background.Position.X := CenterX;
  MainForm.Mame_Background.Position.Y := CenterY;
// Manipulate The XML Database
  if FileExists(MameConfig) then
    begin
      MameConfig_XML := CreateXMLDoc;
      MameConfig_XML.Load(MameConfig);
      nodeGame := MameConfig_XML.SelectSingleNode('MamePath');
      if GetNodeAttrStr(nodeGame,'SelectedMame','') <> '' then
        Mame_Exe := GetNodeAttrStr(nodegame,'SelectedMame');
      Mame_Exe := Trim(Copy(Mame_Exe,0,Length(Mame_Exe)-4));
      MameData := MamePathDatabase + Mame_Exe + '_efuse.xml';
      MameConfig_XML := nil;
      if FileExists(MameData) then
        begin
          fListBox := TSimpleListBox.CreateAsChild(MainForm.Dummy_mame,MatLib,MainForm.Font_Mame);
          fListBox.Position.X := 250;
          fListBox.Position.Y := 340;
          GameMan := TStringList.Create;
          GameYear := TStringList.Create;
          GameClone := TStringList.Create;
          MameDatabase_XML := CreateXMLDoc;
          MainForm.GLHUDText_Progress_Info.Text := 'Load Mame Database';
          Application.ProcessMessages;
          MameDatabase_XML.Load(MameData);
          nodegame := MameDatabase_XML.SelectSingleNode('MameInfo');
          Mame_EmulatedRomSets := GetNodeAttrInt(nodeGame,'RomsEmulated');
          Mame_FoundRomSets := GetNodeAttrInt(nodeGame,'FinalRomsFound');
          GameList := MameDatabase_XML.SelectNodes('/MameInfo/row');
          MainForm.GLHUDText_Progress_Info.Text := 'Get Mame Database';
          for count := 0 to GameList.Length - 1 do
            begin
              nodeGame := GameList.Item[count];
              fListBox.AddItemText(GetNodeAttrStr(nodeGame,'GameName'));
              if GetNodeAttrStr(nodeGame,'Manufactor','') <> '' then
                GameMan.Insert(count,GetNodeAttrStr(nodeGame,'Manufactor'));
              if GetNodeAttrStr(nodeGame,'Year','') <> '' then
                GameYear.Insert(count,GetNodeAttrStr(nodeGame,'Year'));
              if GetNodeAttrStr(nodeGame,'CloneOf','') <> '' then
                GameClone.Insert(count,GetNodeAttrStr(nodeGame,'CloneOf'))
              else
                GameClone.Insert(count,'Original');
              {process_num := (count* 100) / (GameList.Length - 1);
              if process_num < 1 then
                process_str := '0'
              else
                process_str := FormatFloat('#####',process_num);
              Progress_Bar_Intro(StrToFloat(process_str));}
            end;
          MameDatabase_XML := nil;
        end;
    end;


end;


end.

