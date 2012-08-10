unit global;

interface

uses
  SysUtils,Forms,GLKeyboard,StdCtrls,sPanel,Graphics,Classes,MMSystem;

  procedure global_Find_FilesCanClose;
  procedure global_Find_FilesClose;
  procedure global_Find_DirsClose;
  procedure global_Save_FilesCanClose;

  //
  procedure global_FindJoyInfo;
  //Configures keys global to Extrafe
  procedure CheckForHittingKey;
  procedure RestoreTheOriginalColor;

var
  CheckedTimes: Integer;
  Joysticks : array [0..7] of string;

implementation

uses
  main,menu,FunctionX,
  mame_dirs,mame_graphics,mame_database,mame_builds,
  zinc_paths,
  hatari_paths,hatari_roms,hatari_joy,
  psx_paths,
  kigb_paths;

procedure global_Find_FilesCanClose;
begin
// Mame
  if gFindFiles = 'mame' then
    CheckForMameAndCreateIni
  else if gFindFiles = 'visual_effect' then
    Conf.sEdit1.Text := Conf.Find_Files.FileName
  else if gFindFiles = 'joystick_map' then
    Conf.sEdit15.Text := Conf.Find_Files.FileName
  else if gFindFiles = 'hiscoredat_mameplus' then
    FindHiScoreDat_MamePlusReturn
  else if gFindFiles = 'hiscoredat_mamext' then
    FindHiScoreDat_MameXTReturn
  else if gFindFiles = 'MameTools_FontName' then
    Conf.sEdit125.Text := Conf.Find_Files.FileName
// Zinc
  else if gFindFiles = 'zinc' then
    SetUpTheNewZincExe
// Hatari
  else if gFindFiles = 'hatari_paths' then
    CreatePathsForFistTime_Hatari
  else if gFindFiles = 'hatari_tos' then
    SetUpHatariforFistTime
  else if gFindFiles = 'hatari_CartridgeImage' then
    SetUpHatariCartridgeImage
  else if gFindFiles = 'hatari_DiskImagesDir' then
    SetUpHatariDiskImagesDir
  else if gFindFiles = 'hatari_HardDiskImage' then
    SetUpHatariHardDiskImage
  else if gFindFiles = 'hatari_MasterIDEImage' then
    SetUpHatariMasterIDEImage
  else if gFindFiles = 'hatari_SlaveIDEImage' then
    SetUpHatariSlaveIDEImage
  else if gFindFiles = 'hatari_GemDosDrive' then
    SetUpHatariGemDosDrive
  else if gFindFiles = 'hatari_mapping' then
    SetUpHatariMapping
// pSX
  else if gFindFiles = 'pSX_exe' then
    CreatepSX_paths_firstTime
  else if gFindFiles = 'pSX_bios' then
    CreatepSX_configuration_forfirstTime
  else if gFindFiles = 'pSX_screenshots' then
    SetUPpSXScreenShotsDir
  else if gFindFiles = 'pSX_cdimages' then
    SetUPpSXCDImagesDir
  else if gFindFiles = 'pSX_savestates' then
    SetUPpSXSaveStatesDir
  else if gFindFiles = 'pSX_memorycards' then  
    SetUPpSXMemoryCardsDir
  else if gFindFiles = 'pSX_card1' then
    SetUPpSXCard1
  else if gFindFiles = 'pSX_card2' then
    SetUPpSXCard2
// Kigb
  else if gFindFiles = 'Kigb_exe' then
    CreateKigb_settings_firstTime
  else if gFindFiles = 'Kigb_rom' then
    SetUpKigbRomPath
  else if gFindFiles = 'Kigb_snap' then
    SetUpKigbSnapshotPath
  else if gFindFiles = 'Kigb_save' then
    SetUpKigbSavePath
  else if gFindFiles = 'Kigb_savestate' then
    SetUpKigbSaveStatePath
  else if gFindFiles = 'Kigb_input' then
    SetUpKigbInputPath
  else if gFindFiles = 'Kigb_configure' then
    SetUPKigbConfigurePath;
end;

procedure global_Find_FilesClose;
begin
  if gFindFiles = 'mame' then
    CreateNewMameDataBase;          
end;

procedure global_Find_DirsClose;
begin
// Mame
  if FromMame_DirsToFindDirs = True then
    SetMamePath(gFindDirs)
  else if gFindDirs = 'NewRom_Dir' then
    AddNewRom_Dir
  else if gFindDirs = 'IPSDir_mameplus' then
    SetTheNewIPSDir_MamePlus
  else if gFindDirs = 'IPSDir_mamext' then
    SetTheNewIPSDir_MameXT
// ZInc  
  else if gFindDirs = 'AddNewZinc_RomDir' then
    SetTheNewZincRomDirectory
  else if gFindDirs = 'AddNewZinc_SnapDir' then
    SetTheNewZincSnapsDirectory;
end;

procedure global_Save_FilesCanClose;
begin
//
end;


procedure CheckForHittingKey;
var
  component: TComponent;
  i : integer;

  procedure CheckPanel(Panel : TsPanel);
    begin
      if IsKeyDown(KeyNameToVirtualKeyCode(Panel.Caption)) then
      begin
        Panel.Color:=clRed;
        CheckedTimes := CheckedTimes + 1;
      end;
    end;
begin
  if (Conf.Pem_psx_sound.Tag = 1) or (Conf.Pem_psx_others.Tag = 1) then
    begin
      component := FindComponentEx('Conf.sPanel');
      CheckPanel(TsPanel(component));
      for i := 2 to 36 do
        begin
          component := FindComponentEx('Conf.sPanel'+inttostr(i));
          CheckPanel(TsPanel(component));
        end;
    end
  else if (Conf.Pem_hatari_joy.Tag = 1) then
    begin
      for i := 37 to 41 do
        begin
          component := FindComponentEx('Conf.sPanel' + IntToStr(i));
          CheckPanel(TsPanel(component));
        end;
    end
  else if (Conf.Pem_kigb_sound.Tag = 1) then
    begin
      for i := 42 to 68 do
        begin
          component := FindComponentEx('Conf.sPanel' + IntToStr(i));
          CheckPanel(TsPanel(component));
        end;
    end;
end;

procedure RestoreTheOriginalColor;
var
  component: TComponent;
  i: Integer;
begin
  if (Conf.Pem_psx_sound.Tag = 1) or (Conf.Pem_psx_others.Tag = 1) then
    begin
      component := FindComponentEx('Conf.sPanel');
      TsPanel(component).Color := clBtnFace;
      for i := 2 to 36 do
        begin
          component := FindComponentEx('Conf.sPanel'+inttostr(i));
          TsPanel(component).Color := clBtnFace;
        end;
    end
  else if Conf.Pem_hatari_joy.Tag = 1 then
    begin
      for i := 37 to 41 do
        begin
          component := FindComponentEx('Conf.sPanel' + IntToStr(i));
          TsPanel(component).Color := clBtnFace;
        end;
    end
  else if Conf.Pem_kigb_sound.Tag = 1 then
    begin
      for i := 41 to 68 do
        begin
          component := FindComponentEx('Conf.sPanel' + IntToStr(i));
          TsPanel(component).Color := clBtnFace;
        end;
    end;
end;

procedure global_FindJoyInfo;
var
  Joystick : TJoyInfo;
  JoystickCaps: TJoyCaps;
  k: Integer;
begin
  k := 0;
  repeat
    if joyGetDevCaps(JOYSTICKID2,@JoystickCaps,SizeOf(JoystickCaps)) <> 0 then
      begin
        Joysticks[0] := JoystickCaps.szPname;
        k := k + 1;
      end
    else
      k := 0;
  until (k > 8) or (k = 0);
end;

end.
