unit loadT;

interface
uses
  Classes,SysUtils,Controls,Windows,Forms,Graphics,Dialogs,
  GLKeyboard, GLHUDObjects,GlFilePNG, GLWindowsFont,
  NativeXml,
  uMain_ListBox;

  procedure Intro(aTime: Double);
  procedure Progress_Bar_Intro(Progresspercent: real);
  procedure LoadTheMenuTexturesandSounds;
  procedure LoadTheMameContent;

var
  Mame_EmulatedRomSets, Mame_FoundRomSets: Integer;
  fListBox: TSimpleListBox;
  fnonexistFont: TGLWindowsBitmapFont;
  fexistFont: TGLWindowsBitmapFont;
  MameTotalRoms: Integer;

  FXml_MameDatabase: TNativeXml;
  FXml_MameConfig: TNativeXml;

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
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha + 0.4 * dTime
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
      LoadTheMenuTexturesandSounds;
      LoadTheMameContent;
      MainForm.Progress.Visible := False;
      MainForm.GLHUDText_Progress_Info.Visible := False;
      MainForm.GLHUDText_ExtraFE_Ver.Visible := False;
      MainForm.GLHUDText_confEditor_Ver.Visible := False;
      AddMaterials(MatLib,'media\extrafe\main_menu\',['background','left_button','left_button_p','right_button','right_button_p'],['background','leftB','leftBP','rightB','rightBP']);
      AddMaterials(MatLib,'media\extrafe\main_menu\',['mame_cab','zinc_cab','hatari_cab','psxemulator_cab','kigb_cab','widgets'],['mameC','zincC','hatariC','psxemulatorC','kigbC','widgets']);
      AddMaterials(MatLib,'media\extrafe\main_menu\',['mame_cab_p','zinc_cab_p','hatari_cab_p','psxemulator_cab_p','kigb_cab_p'],['mameCA','ZincCA','hatariCA','psxemulatorCA','kigbCA']);
      Application.ProcessMessages;
      MainForm.Background_intro.Tag := 3;
      MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := 2;
    end;

    if MainForm.Background_intro.Tag = 3 then
      if MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha > 0.1 then
        begin
          MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha := MainForm.Background_intro.Material.FrontProperties.Diffuse.Alpha - 0.01; // * dTime
          Application.ProcessMessages;          
        end
      else
        MainForm.ActiveScene(1);        

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
      Application.ProcessMessages;
    end
  end
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
  MainForm.GLHUDText_Progress_Info.Text := 'Load Menu Materials';
  Progress_Bar_Intro(10);
  // load the fonts
  fexistFont := TGLWindowsBitmapFont.Create(MainForm);
  fexistFont.Font.Name := 'Norton';
  fexistFont.Font.Size := 12;
  
  fnonexistFont := TGLWindowsBitmapFont.Create(MainForm);
  fnonexistFont.Font.Name := 'Norton';
  fnonexistFont.Font.Size := 10;
  Progress_Bar_Intro(20);
end;

procedure LoadTheMameContent;
const
  MamePathDatabase : string = 'media\emulators\arcade\mame\database\';
  MameConfig : string = 'media\emulators\arcade\mame\config\config.xml';
  MameMats: array [1..4] of String = ('front_list','back_list','selection_list','back_mame');

var
  Mame_Exe,MameData: string;
  count,i: Integer;
  gamename,trimgamename,gamezip,romid : string;
  node: TXmlNode;

begin
// Add the materials to library
  MainForm.GLHUDText_Progress_Info.Text := 'Start Mame';
  AddMaterials(MatLib, 'media\emulators\arcade\mame\extrafe\', MameMats, MameMats);
  MainForm.Mame_Background.Material.Assign(MatLib.Materials.GetLibMaterialByName('back_mame').Material);
//  MainForm.Mame_Background.Height := MainForm.GLSceneViewer.Height;
//  MainForm.Mame_Background.Width := MainForm.GLSceneViewer.Width;
//  MainForm.Mame_Background.Position.X := CenterX;
//  MainForm.Mame_Background.Position.Y := CenterY;
  MainForm.GLPlane_Image.Position.X := -100;
  MainForm.GLPlane_Image.Position.Y := -100;
  MainForm.GLPlane_Image.Position.Z := 0;
  Progress_Bar_Intro(30);
  
// Manipulate The XML Database
  if FileExists(MameConfig) then
    begin
      FXml_MameConfig := TNativeXml.CreateName('MameConfig');
      FXml_MameConfig.XmlFormat := xfReadable;
      FXml_MameConfig.LoadFromFile(MameConfig);
      Mame_Exe := FXml_MameConfig.Root.ReadAttributeString('SelectedMame');
      Mame_Exe := Trim(Copy(Mame_Exe,0,Length(Mame_Exe)-4));
      MameData := MamePathDatabase + Mame_Exe + '_efuse.xml';
      if FileExists(MameData) then
        begin
          fListBox := TSimpleListBox.CreateAsChild(MainForm.Dummy_mame,MatLib,fexistFont,fnonexistFont);
          fListBox.Position.X := 240;
          fListBox.Position.Y := 310;
          for i := 0 to 5 do
            fListBox.AddItemTextNum(' ','',i,0);
          FXml_MameDatabase := TNativeXml.CreateName('MameInfo');
          FXml_MameDatabase.XmlFormat := xfReadable;
          Progress_Bar_Intro(50);
          Application.ProcessMessages;
          Fxml_MameDatabase.LoadFromFile(MameData);
          Mame_EmulatedRomSets := Fxml_MameDatabase.Root.ReadAttributeInteger('RomsEmulated');
          Mame_FoundRomSets := Fxml_MameDatabase.Root.ReadAttributeInteger('FinalRomsFound');
          MainForm.GLHUDText_Progress_Info.Text := 'Get Mame Database';
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
              fListBox.AddItemTextNum(trimgamename,gamezip,(count + 6) -4,StrToInt(romid));
            end;
          Progress_Bar_Intro(80);
          FXml_MameConfig.Free;
          Fxml_MameDatabase.Free;
          fListBox.fItems.Sort(CompareNames);
          fListBox.Index := 8;
          MameTotalRoms := Mame_FoundRomSets;
        end;
    end;
end;

end.


//diadikasia emfanisis posostieas monadas poli agri omos...
{              process_num := (count* 100) / (GameList.Length - 1);
              if process_num < 1 then
                process_str := '0'
              else
                process_str := FormatFloat('#####',process_num);
              Progress_Bar_Intro(StrToFloat(process_str));}

