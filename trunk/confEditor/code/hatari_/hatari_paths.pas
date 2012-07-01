unit hatari_paths;

interface
uses
  SysUtils,Classes,ExtCtrls,Forms,IniFiles,global,FileCtrl;

  procedure SetHatari_PathsfromHatariIni;
  procedure SaveHatari_PathsAtExit;

  procedure Add_hatari_exe_File;
  procedure CreatePathsForFistTime_Hatari;
  procedure Add_hatari_tos_File_and_setup_Hatari;
  procedure CreateFilesForFirstTime_Hatari;
  procedure CreateHatari_MediaAndGame_Paths;
  procedure Check_Tos_Images;
  procedure SetUpHatariforFistTime;

  procedure SetHatari_ScreenshotsPath;
  procedure SetHatari_MusicPath;
  procedure SetHatari_BoxscansPath;
  procedure SetHatari_DiskscansPath;
  procedure SetHatari_AdvertsPath;
  procedure SetHatari_CheatsPath;
  procedure SetHatari_HintsPath;
  procedure SetHatari_InstructionsPath;
  procedure SetHatari_MapsPath;
  procedure SetHatari_SolutionsPath;
  procedure SetHatari_ReviewsPath;
  procedure SetHatari_OtherPath;
  procedure SetUpHatariScreenshotsPath;
  procedure SetUpHatariMusicPath;
  procedure SetUpHatariBoxscansPath;
  procedure SetUpHatariDiskscansPath;
  procedure SetUpHatariAdvertsPath;
  procedure SetUpHatariCheatsPath;
  procedure SetUpHatariHintsPath;
  procedure SetUpHatariInstructionsPath;
  procedure SetUpHatariMapsPath;
  procedure SetUpHatariSolutionsPath;
  procedure SetUpHatariReviewsPath;
  procedure SetUpHatariOtherPath;



// Menu actions
  procedure Show_hatari_pathspanel;
  procedure em_hatari_paths_ShowDynamicComps;
  procedure em_hatari_paths_FreeDynamicComps;
    
implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_screen,hatari_joy,hatari_database,hatari_system;

var
  OldHatari_Exe,oldPath,newPath: string;  

procedure SetHatari_PathsfromHatariIni;
begin
  Hatari_Exe := Hatari_Config.ReadString('Paths','Hatari',Hatari_Exe);
  FullPathHatari_Exe := Hatari_Config.ReadString('Paths','FullPath',FullPathHatari_Exe);
  Conf.sEdit14.Text := FullPathHatari_Exe + Hatari_Exe;
  Hatari_Tos := FullPathHatari_Exe + 'hatari.cfg';
  if FileExists(Hatari_Tos) then
    begin
      Hatari_ini := TIniFile.Create(Hatari_Tos);
      Conf.sEdit18.Enabled := True;
      Conf.sBitBtn106.Enabled := True;
      Conf.sEdit18.Text := Hatari_ini.ReadString('ROM','szTosImageFileName',Conf.sEdit18.Text);

      Conf.sEdit19.Text := Hatari_Config.ReadString('DisksPath','Media_Snapshots',Conf.sEdit19.Text);
      Conf.sEdit20.Text := Hatari_Config.ReadString('DisksPath','Media_Music',Conf.sEdit20.Text);
      Conf.sEdit22.Text := Hatari_Config.ReadString('DisksPath','Media_Boxscans',Conf.sEdit22.Text);
      Conf.sEdit24.Text := Hatari_Config.ReadString('DisksPath','Media_Diskscans',Conf.sEdit24.Text);
      Conf.sEdit21.Text := Hatari_Config.ReadString('DisksPath','Media_Adverts',Conf.sEdit21.Text);
      Conf.sEdit23.Text := Hatari_Config.ReadString('DisksPath','Media_Cheats',Conf.sEdit23.Text);
      Conf.sEdit25.Text := Hatari_Config.ReadString('DisksPath','Media_Hints_Tips',Conf.sEdit25.Text);
      Conf.sEdit26.Text := Hatari_Config.ReadString('DisksPath','Media_Instructions',Conf.sEdit26.Text);
      Conf.sEdit27.Text := Hatari_Config.ReadString('DisksPath','Media_Maps',Conf.sEdit27.Text);
      Conf.sEdit30.Text := Hatari_Config.ReadString('DisksPath','Media_Solutions',Conf.sEdit30.Text);
      Conf.sEdit29.Text := Hatari_Config.ReadString('DisksPath','Media_Reviews',Conf.sEdit29.Text);
      Conf.sEdit28.Text := Hatari_Config.ReadString('DisksPath','Media_Other',Conf.sEdit28.Text);
    end
  else
    begin
      Conf.sEdit18.Enabled := True;
      Conf.sBitBtn106.Enabled := True;
    end;
end;

procedure SaveHatari_PathsAtExit;
begin
  if Hatari_Exe <> '' then
    begin
      Hatari_Config.WriteString('DisksPath','Media_Snapshots',Conf.sEdit19.Text);
      Hatari_Config.WriteString('DisksPath','Media_Music',Conf.sEdit20.Text);
      Hatari_Config.WriteString('DisksPath','Media_Boxscans',Conf.sEdit22.Text);
      Hatari_Config.WriteString('DisksPath','Media_Diskscans',Conf.sEdit24.Text);
      Hatari_Config.WriteString('DisksPath','Media_Adverts',Conf.sEdit21.Text);
      Hatari_Config.WriteString('DisksPath','Media_Cheats',Conf.sEdit23.Text);
      Hatari_Config.WriteString('DisksPath','Media_Hints_Tips',Conf.sEdit25.Text);
      Hatari_Config.WriteString('DisksPath','Media_Instructions',Conf.sEdit26.Text);
      Hatari_Config.WriteString('DisksPath','Media_Maps',Conf.sEdit27.Text);
      Hatari_Config.WriteString('DisksPath','Media_Solutions',Conf.sEdit30.Text);
      Hatari_Config.WriteString('DisksPath','Media_Reviews',Conf.sEdit29.Text);
      Hatari_Config.WriteString('DisksPath','Media_Other',Conf.sEdit28.Text);
    end;
end;

procedure Add_hatari_exe_File;
begin
  gFindFiles := 'hatari_paths';
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.Filter := 'Hatari.exe|hatari.exe|Hatari_Falcon.exe|hatari_falcon.exe';
  Conf.Find_Files.Execute;
  OldHatari_Exe := Conf.sEdit14.Text;
end;

procedure CreatePathsForFistTime_Hatari;
begin
  if OldHatari_Exe <> Conf.Find_Files.FileName then
    begin
      Hatari_Exe := ExtractFileName(Conf.Find_Files.FileName);
      FullPathHatari_Exe := ExtractFilePath(Conf.Find_Files.FileName);
      Hatari_confeditor_ini := ExtractFilePath(Application.ExeName)+'media\emulators\computers\atari\hatari\config\config.ini';
      Conf.sEdit14.Text := FullPathHatari_Exe + Hatari_Exe;
      if not FileExists(Hatari_confeditor_ini) then
        Hatari_Config := TIniFile.Create(Hatari_confeditor_ini);
      Hatari_Config.WriteString('Paths','Hatari',Hatari_Exe);
      Hatari_Config.WriteString('Paths','FullPath',FullPathHatari_Exe);
      if OldHatari_Exe <> '' then
        begin
          Conf.sEdit18.Enabled := False;
          Conf.sEdit18.Text := '';
          Conf.sBitBtn106.Enabled := False;
        end
      else
        begin
          Conf.sEdit18.Enabled := True;
          Conf.sBitBtn106.Enabled := True;
        end;
    end;
end;

procedure Add_hatari_tos_File_and_setup_Hatari;
begin
  gFindFiles := 'hatari_tos';
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.Filter := 'Tos images|*.img; *.rom';
  Conf.Find_Files.Execute;
end;

procedure SetUpHatariforFistTime;
begin
  Hatari_Tos := ExtractFileName(Conf.Find_Files.FileName);
  Hatari_FullPathTos := ExtractFilePath(Conf.Find_Files.FileName);
  Conf.sEdit18.Text := Hatari_FullPathTos + Hatari_Tos;
  CreateFilesForFirstTime_Hatari;
  Check_Tos_Images;
  CreateHatari_MediaAndGame_Paths;
  SetHatari_SystemfromHatariIni;
  SetHatari_RomsfromHatariIni;
  SetHatari_ScreenfromHatariIni;
  SetHatari_JoyfromHatariIni;
  SetHatari_DatabasefromHatariIni;
end;

procedure Check_Tos_Images;
begin
  if (Hatari_Tos = 'Tos100.img') or (Hatari_Tos = 'Tos100.rom') or (Hatari_Tos = 'Tos102.img') or (Hatari_Tos = 'Tos102.rom') or
    (Hatari_Tos = 'Tos104.img') or (Hatari_Tos = 'Tos104.rom') or (Hatari_Tos = 'Tos202.img') or (Hatari_Tos = 'Tos202.rom') or
    (Hatari_Tos = 'Tos205.img') or (Hatari_Tos = 'Tos205.rom') or (Hatari_Tos = 'Tos206.img') or (Hatari_Tos = 'Tos206.rom') then
    begin
      Hatari_ini.WriteInteger('System','nMachineType',0);
      Hatari_ini.WriteInteger('System','nCpuFreq',8);
      Hatari_ini.WriteInteger('System','nCpuLevel',0);
    end
  else if (Hatari_Tos = 'Tos106.img') or (Hatari_Tos = 'Tos106.rom') or (Hatari_Tos = 'Tos162.img') or (Hatari_Tos = 'Tos162.rom') then
    begin
      Hatari_ini.WriteInteger('System','nMachineType',1);
      Hatari_ini.WriteInteger('System','nCpuFreq',8);
      Hatari_ini.WriteInteger('System','nCpuLevel',0);
    end
  else if (Hatari_Tos = 'Tos301.img') or (Hatari_Tos = 'Tos301.rom') or (Hatari_Tos = 'Tos305.img') or (Hatari_Tos = 'Tos305.rom') or
    (Hatari_Tos = 'Tos306.img') or (Hatari_Tos = 'Tos306.rom') then
    begin
      Hatari_ini.WriteInteger('System','nMachineType',2);
      Hatari_ini.WriteInteger('System','nCpuFreq',32);
      Hatari_ini.WriteInteger('System','nCpuLevel',3);
    end
  else if (Hatari_Tos = 'Tos400.img') or (Hatari_Tos = 'Tos400.rom') or (Hatari_Tos = 'Tos401.img') or (Hatari_Tos = 'Tos401.rom') or
    (Hatari_Tos = 'Tos402.img') or (Hatari_Tos = 'Tos402.rom') or (Hatari_Tos = 'Tos404.img') or (Hatari_Tos = 'Tos404.rom') or
    (Hatari_Tos = 'Tos492.img') or (Hatari_Tos = 'Tos492.rom') or (Hatari_Tos = 'Tos498.img') or (Hatari_Tos = 'Tos498.rom') then
    begin
      Hatari_ini.WriteInteger('System','nMachineType',3);
      Hatari_ini.WriteInteger('System','nCpuFreq',16);
      Hatari_ini.WriteInteger('System','nCpuLevel',3);
    end;
end;

procedure CreateFilesForFirstTime_Hatari;
var
  rf: TStringList;
begin
  if not DirectoryExists(FullPathHatari_Exe +'sound_capture') then
    CreateDir(FullPathHatari_Exe +'sound_capture');
  if not DirectoryExists(FullPathHatari_Exe + '.hatari') then
    CreateDir(FullPathHatari_Exe + '.hatari');
  if not DirectoryExists(FullPathHatari_Exe + 'tos') then
    CreateDir(FullPathHatari_Exe + 'tos');
  if not DirectoryExists(FullPathHatari_Exe + 'disks') then
    CreateDir(FullPathHatari_Exe + 'disks');
  rf := TStringList.Create;
  rf.Add('[Log]');
  rf.Add('sLogFileName = stderr');
  rf.Add('sTraceFileName = stderr');
  rf.Add('nTextLogLevel = 4');
  rf.Add('nAlertDlgLogLevel = 1');
  rf.Add('bConfirmQuit = TRUE');
  rf.Add(' ');
  rf.Add('[Debugger]');
  rf.Add('nNumberBase = 10');
  rf.Add('nDisasmLines = 8');
  rf.Add('nMemdumpLines = 8');
  rf.Add(' ');
  rf.Add('[Screen]');
  rf.Add('nMonitorType = 1');
  rf.Add('nFrameSkips = 5');
  rf.Add('bFullScreen = FALSE');
  rf.Add('bKeepResolution = TRUE');
  rf.Add('bKeepResolutionST = FALSE');
  rf.Add('bAllowOverscan = TRUE');
  rf.Add('nSpec512Threshold = 16');
  rf.Add('nForceBpp = 0');
  rf.Add('bAspectCorrect = TRUE');
  rf.Add('bUseExtVdiResolutions = FALSE');
  rf.Add('nVdiWidth = 640');
  rf.Add('nVdiHeight = 480');
  rf.Add('nVdiColors = 2');
  rf.Add('bShowStatusbar = TRUE');
  rf.Add('bShowDriveLed = FALSE');
  rf.Add('bCrop = FALSE');
  rf.Add('bForceMax = FALSE');
  rf.Add('nMaxWidth = 1280');
  rf.Add('nMaxHeight = 768');
  rf.Add(' ');
  rf.Add('[Joystick0]');
  rf.Add('nJoystickMode = 0');
  rf.Add('bEnableAutoFire = FALSE');
  rf.Add('bEnableJumpOnFire2 = FALSE');
  rf.Add('nJoyId = 1');
  rf.Add('nKeyCodeUp = 273');
  rf.Add('nKeyCodeDown = 274');
  rf.Add('nKeyCodeLeft = 276');
  rf.Add('nKeyCodeRight = 275');
  rf.Add('nKeyCodeFire = 305');
  rf.Add(' ');
  rf.Add('[Joystick1]');
  rf.Add('nJoystickMode = 1');
  rf.Add('bEnableAutoFire = FALSE');
  rf.Add('bEnableJumpOnFire2 = FALSE');
  rf.Add('nJoyId = 0');
  rf.Add('nKeyCodeUp = 273');
  rf.Add('nKeyCodeDown = 274');
  rf.Add('nKeyCodeLeft = 276');
  rf.Add('nKeyCodeRight = 275');
  rf.Add('nKeyCodeFire = 305');
  rf.Add(' ');
  rf.Add('[Joystick2]');
  rf.Add('nJoystickMode = 0');
  rf.Add('bEnableAutoFire = FALSE');
  rf.Add('bEnableJumpOnFire2 = FALSE');
  rf.Add('nJoyId = 2');
  rf.Add('nKeyCodeUp = 273');
  rf.Add('nKeyCodeDown = 274');
  rf.Add('nKeyCodeLeft = 276');
  rf.Add('nKeyCodeRight = 275');
  rf.Add('nKeyCodeFire = 305');
  rf.Add(' ');
  rf.Add('[Joystick3]');
  rf.Add('nJoystickMode = 0');
  rf.Add('bEnableAutoFire = FALSE');
  rf.Add('bEnableJumpOnFire2 = FALSE');
  rf.Add('nJoyId = 3');
  rf.Add('nKeyCodeUp = 273');
  rf.Add('nKeyCodeDown = 274');
  rf.Add('nKeyCodeLeft = 276');
  rf.Add('nKeyCodeRight = 275');
  rf.Add('nKeyCodeFire = 305');
  rf.Add(' ');
  rf.Add('[Joystick4]');
  rf.Add('nJoystickMode = 0');
  rf.Add('bEnableAutoFire = FALSE');
  rf.Add('bEnableJumpOnFire2 = FALSE');
  rf.Add('nJoyId = 4');
  rf.Add('nKeyCodeUp = 273');
  rf.Add('nKeyCodeDown = 274');
  rf.Add('nKeyCodeLeft = 276');
  rf.Add('nKeyCodeRight = 275');
  rf.Add('nKeyCodeFire = 305');
  rf.Add(' ');
  rf.Add('[Joystick5]');
  rf.Add('nJoystickMode = 0');
  rf.Add('bEnableAutoFire = FALSE');
  rf.Add('bEnableJumpOnFire2 = FALSE');
  rf.Add('nJoyId = 5');
  rf.Add('nKeyCodeUp = 273');
  rf.Add('nKeyCodeDown = 274');
  rf.Add('nKeyCodeLeft = 276');
  rf.Add('nKeyCodeRight = 275');
  rf.Add('nKeyCodeFire = 305');
  rf.Add(' ');
  rf.Add('[Keyboard]');
  rf.Add('bDisableKeyRepeat = FALSE');
  rf.Add('nKeymapType = 0');
  rf.Add('szMappingFileName =');
  rf.Add(' ');
  rf.Add('[ShortcutsWithModifiers]');
  rf.Add('keyOptions = 111');
  rf.Add('keyFullScreen = 102');
  rf.Add('keyMouseMode = 109');
  rf.Add('keyColdReset = 99');
  rf.Add('keyWarmReset = 114');
  rf.Add('keyScreenShot = 103');
  rf.Add('keyBossKey = 105');
  rf.Add('keyCursorEmu = 106');
  rf.Add('keyFastForward = 120');
  rf.Add('keyRecAnim = 97');
  rf.Add('keyRecSound = 121');
  rf.Add('keySound = 115');
  rf.Add('keyPause = 0');
  rf.Add('keyDebugger = 19');
  rf.Add('keyQuit = 113');
  rf.Add('keyLoadMem = 108');
  rf.Add('keySaveMem = 107');
  rf.Add('keyInsertDiskA = 100');
  rf.Add(' ');
  rf.Add('[ShortcutsWithoutModifiers]');
  rf.Add('keyOptions = 293');
  rf.Add('keyFullScreen = 292');
  rf.Add('keyMouseMode = 0');
  rf.Add('keyColdReset = 0');
  rf.Add('keyWarmReset = 0');
  rf.Add('keyScreenShot = 0');
  rf.Add('keyBossKey = 0');
  rf.Add('keyCursorEmu = 0');
  rf.Add('keyFastForward = 0');
  rf.Add('keyRecAnim = 0');
  rf.Add('keyRecSound = 0');
  rf.Add('keySound = 0');
  rf.Add('keyPause = 19');
  rf.Add('keyDebugger = 0');
  rf.Add('keyQuit = 0');
  rf.Add('keyLoadMem = 0');
  rf.Add('keySaveMem = 0');
  rf.Add('keyInsertDiskA = 0');
  rf.Add(' ');
  rf.Add('[Sound]');
  rf.Add('bEnableMicrophone = TRUE');
  rf.Add('bEnableSound = TRUE');
  rf.Add('nPlaybackFreq = 44100');
  rf.Add('nSdlAudioBufferSize = 0');
  rf.Add('szYMCaptureFileName = ' + FullPathHatari_Exe +'sound_capture\hatari.wav');
  rf.Add('YmVolumeMixing = 2');
  rf.Add(' ');
  rf.Add('[Memory]');
  rf.Add('nMemorySize = 1');
  rf.Add('bAutoSave = FALSE');
  rf.Add('szMemoryCaptureFileName = '+ FullPathHatari_Exe + '.hatari\hatari.sav');
  rf.Add('szAutoSaveFileName = ' + FullPathHatari_Exe + '.hatari\auto.sav');
  rf.Add(' ');
  rf.Add('[Floppy]');
  rf.Add('bAutoInsertDiskB = TRUE');
  rf.Add('FastFloppy = FALSE');
  rf.Add('nWriteProtection = 0');
  rf.Add('szDiskAZipPath =');
  rf.Add('szDiskAFileName =');
  rf.Add('szDiskBZipPath =');
  rf.Add('szDiskBFileName =');
  rf.Add('szDiskImageDirectory = ' + FullPathHatari_Exe);
  rf.Add(' ');
  rf.Add('[HardDisk]');
  rf.Add('bBootFromHardDisk = FALSE');
  rf.Add('bUseHardDiskDirectory = FALSE');
  rf.Add('szHardDiskDirectory = ' + FullPathHatari_Exe);
  rf.Add('nWriteProtection = 0');
  rf.Add('bUseHardDiskImage = FALSE');
  rf.Add('szHardDiskImage = ' + FullPathHatari_Exe);
  rf.Add('bUseIdeMasterHardDiskImage = FALSE');
  rf.Add('bUseIdeSlaveHardDiskImage = FALSE');
  rf.Add('szIdeMasterHardDiskImage = ' + FullPathHatari_Exe);
  rf.Add('szIdeSlaveHardDiskImage = ' + FullPathHatari_Exe);
  rf.Add(' ');
  rf.Add('[ROM]');
  rf.Add('szTosImageFileName = '+ Hatari_FullPathTos + Hatari_Tos);
  rf.Add('bPatchTos = TRUE');
  rf.Add('szCartridgeImageFileName =');
  rf.Add(' ');
  rf.Add('[RS232]');
  rf.Add('bEnableRS232 = FALSE');
  rf.Add('szOutFileName = ' + FullPathHatari_Exe + '/dev/modem');
  rf.Add('szInFileName = '  + FullPathHatari_Exe + '/dev/modem');
  rf.Add(' ');
  rf.Add('[Printer]');
  rf.Add('bEnablePrinting = FALSE');
  rf.Add('bPrintToFile = TRUE');
  rf.Add('szPrintToFileName = ' + FullPathHatari_Exe + '.hatari\hatari.prn');
  rf.Add(' ');
  rf.Add('[Midi]');
  rf.Add('bEnableMidi = FALSE');
  rf.Add('sMidiInFileName = ' + FullPathHatari_Exe + '/dev/snd/midiC1D0');
  rf.Add('sMidiOutFileName = ' + FullPathHatari_Exe + '/dev/snd/midiC1D0');
  rf.Add(' ');
  rf.Add('[System]');
  rf.Add('nCpuLevel = 0');
  rf.Add('nCpuFreq = 8');
  rf.Add('bCompatibleCpu = TRUE');
  rf.Add('nMachineType = 0');
  rf.Add('bBlitter = FALSE');
  rf.Add('nDSPType = 0');
  rf.Add('bRealTimeClock = TRUE');
  rf.Add('bPatchTimerD = TRUE');
  rf.Add('bFastBoot = TRUE');
  rf.Add('bFastForward = FALSE');
  rf.Add(' ');
  rf.Add('[Video]');
  rf.Add('AviRecordVcodec = 2');
  rf.Add('AviRecordFps = 0');
  rf.Add('AviRecordFile = ' + FullPathHatari_Exe + 'hatari.avi');
  rf.Add(' ');
  rf.SaveToFile(FullPathHatari_Exe+'\hatari.cfg');
  rf.Free;
  Hatari_ini := TIniFile.Create(FullPathHatari_Exe + '\hatari.cfg');
end;

procedure CreateHatari_MediaAndGame_Paths;
var
  i: Integer;
  mediapath: string;
begin
// Create Games dir
  CreateDir(FullPathHatari_Exe + 'disks');
  Hatari_Config.WriteString('DisksPaths','RootPath',FullPathHatari_Exe + 'disks');
  CreateDir(FullPathHatari_Exe + 'disks\games');
  Hatari_Config.WriteString('DisksPath','RootGames',FullPathHatari_Exe + 'disks\games');
  CreateDir(FullPathHatari_Exe + 'disks\games\bigcollections');
  for i:= 0 to Conf.sComboBox40.Items.Count - 1 do
    begin
      if i <> 0 then
        CreateDir(FullPathHatari_Exe + 'disks\games\bigcollections\' + Conf.sComboBox40.Items.Strings[i]);
    end;
  CreateDir(FullPathHatari_Exe + 'disks\games\smallcollections');
  for i:= 0 to Conf.sComboBox41.Items.Count - 1 do
    begin
      if i <> 0 then
        CreateDir(FullPathHatari_Exe + 'disks\games\smallcollections\' + Conf.sComboBox41.Items.Strings[i]);
    end;
  CreateDir(FullPathHatari_Exe + 'disks\games\single');
  CreateDir(FullPathHatari_Exe + 'disks\games\single\hd');
  CreateDir(FullPathHatari_Exe + 'disks\games\single\st');
  CreateDir(FullPathHatari_Exe + 'disks\games\single\stx');
  CreateDir(FullPathHatari_Exe + 'disks\demo');
  CreateDir(FullPathHatari_Exe + 'disks\applications');
  mediapath := FullPathHatari_Exe + 'disks\media\';
  CreateDir(mediapath);
  Hatari_Config.WriteString('DisksPath','RootMedia',mediapath);
//
  CreateDir(mediapath + 'snap');
  Hatari_Config.WriteString('DisksPath','Media_Snapshots',mediapath + 'snap');
  Conf.sEdit19.Text := mediapath + 'snap';

  CreateDir(mediapath + 'music');
  Hatari_Config.WriteString('DisksPath','Media_Music',mediapath + 'music');
  Conf.sEdit20.Text := mediapath + 'music';
  
  CreateDir(mediapath + 'boxscans');
  Hatari_Config.WriteString('DisksPath','Media_Boxscans',mediapath + 'boxscans');
  Conf.sEdit22.Text := mediapath + 'boxscans';

  CreateDir(mediapath + 'diskscans');
  Hatari_Config.WriteString('DisksPath','Media_Diskscans',mediapath + 'diskscans');
  Conf.sEdit24.Text := mediapath + 'diskscans';

  CreateDir(mediapath + 'adverts');
  Hatari_Config.WriteString('DisksPath','Media_Adverts',mediapath + 'adverts');
  Conf.sEdit21.Text := mediapath + 'adverts';

  CreateDir(mediapath + 'cheats');
  Hatari_Config.WriteString('DisksPath','Media_Cheats',mediapath + 'cheats');
  Conf.sEdit23.Text := mediapath + 'cheats';

  CreateDir(mediapath + 'hints_tips');
  Hatari_Config.WriteString('DisksPath','Media_Hints_Tips',mediapath + 'hints_tips');
  Conf.sEdit25.Text := mediapath + 'hints_tips';

  CreateDir(mediapath + 'instructions');
  Hatari_Config.WriteString('DisksPath','Media_Instructions',mediapath + 'instructions');
  Conf.sEdit26.Text := mediapath + 'instructions';

  CreateDir(mediapath + 'maps');
  Hatari_Config.WriteString('DisksPath','Media_Maps',mediapath + 'maps');
  Conf.sEdit27.Text := mediapath + 'maps';

  CreateDir(mediapath + 'solutions');
  Hatari_Config.WriteString('DisksPath','Media_Solutions',mediapath + 'solutions');
  Conf.sEdit30.Text := mediapath + 'solutions';

  CreateDir(mediapath + 'reviews');
  Hatari_Config.WriteString('DisksPath','Media_Reviews',mediapath + 'reviews');
  Conf.sEdit29.Text := mediapath + 'reviews';

  CreateDir(mediapath + 'other');
  Hatari_Config.WriteString('DisksPath','Media_Other',mediapath + 'other');
  Conf.sEdit28.Text := mediapath + 'other';
end;

procedure SetHatari_ScreenshotsPath;
begin
  oldpath := Conf.sEdit19.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Screenshots';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_MusicPath;
begin
  oldpath := Conf.sEdit20.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Music';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_BoxscansPath;
begin
  oldpath := Conf.sEdit22.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Boxscans';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_DiskscansPath;
begin
  oldpath := Conf.sEdit24.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Diskscans';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_AdvertsPath;
begin
  oldpath := Conf.sEdit21.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Adverts';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_CheatsPath;
begin
  oldpath := Conf.sEdit23.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Cheats';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_HintsPath;
begin
  oldpath := Conf.sEdit25.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Hints';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_InstructionsPath;
begin
  oldpath := Conf.sEdit26.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Instructions';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_MapsPath;
begin
  oldpath := Conf.sEdit27.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Maps';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_SolutionsPath;
begin
  oldpath := Conf.sEdit30.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Solutions';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_ReviewsPath;
begin
  oldpath := Conf.sEdit29.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Reviews';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetHatari_OtherPath;
begin
  oldpath := Conf.sEdit28.Text;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_Other';
        global_Find_DirsClose;
      end;
  oldPath := '';
end;

procedure SetUpHatariScreenshotsPath;
begin
  Conf.sEdit19.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariMusicPath;
begin
  Conf.sEdit20.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariBoxscansPath;
begin
  Conf.sEdit22.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariDiskscansPath;
begin
  Conf.sEdit24.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariAdvertsPath;
begin
  Conf.sEdit21.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariCheatsPath;
begin
  Conf.sEdit23.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariHintsPath;
begin
  Conf.sEdit25.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariInstructionsPath;
begin
  Conf.sEdit26.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariMapsPath;
begin
  Conf.sEdit27.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariSolutionsPath;
begin
  Conf.sEdit30.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariReviewsPath;
begin
  Conf.sEdit29.Text := newPath;
  newPath := '';
end;

procedure SetUpHatariOtherPath;
begin
  Conf.sEdit28.Text := newPath;
  newPath := '';
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_hatari_pathspanel;
begin
  if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_roms') then
    em_hatari_roms_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_screen') then
    em_hatari_screen_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_database') then
    em_hatari_database_FreeDynamicComps;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,True);
  Cmenustate := 'em_computers_hatari_paths';
  em_hatari_paths_ShowDynamicComps;
  ShowButtonDown(6,'EM_COMPUTERS_ATARI_HATARI_PATHS');
  Conf.Pem_hatari_joy.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_hatari_paths');
end;

procedure em_hatari_paths_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_paths,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_paths,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_paths,'media\confeditor\images\hatari\paths.png',
              611,2,156,71,i,True);
      end;
    end;
end;

procedure em_hatari_paths_FreeDynamicComps;
var
  i : Integer;
  Comp: TComponent;
begin
  for i := 1 to 3 do
    begin
      Comp := FindComponentEx('Conf.Pic'+IntToStr(i));
      TImage(Comp).Free;
    end;
end;

end.
