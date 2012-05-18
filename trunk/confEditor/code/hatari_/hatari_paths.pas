unit hatari_paths;

interface
uses
  SysUtils,Classes,ExtCtrls,Forms,IniFiles;

  procedure SetHatari_PathsfromHatariIni;

  procedure Add_hatari_exe_File;
  procedure CreatePathsForFistTime_Hatari;
  procedure Add_hatari_tos_File_and_setup_Hatari;
  procedure CreateFilesForFirstTime_Hatari;
  procedure CreateDiskImagesDirs;
  procedure Check_Tos_Images;
  procedure SetUpHatariforFistTime;


// Menu actions
  procedure Show_hatari_pathspanel;
  procedure em_hatari_paths_ShowDynamicComps;
  procedure em_hatari_paths_FreeDynamicComps;
    
implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_screen,hatari_joy,hatari_database,hatari_system;

var
  OldHatari_Exe,OldHatari_Tos: string;  

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
    end
  else
    begin
      Conf.sEdit18.Enabled := True;
      Conf.sBitBtn106.Enabled := True;
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

procedure CreateDiskImagesDirs;
begin
// Na sinexiso apo edo.
end;

//////////////////////////////////
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
