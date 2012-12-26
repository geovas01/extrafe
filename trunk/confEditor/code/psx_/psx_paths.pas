unit psx_paths;

interface
uses
  SysUtils,Classes,ExtCtrls,IniFiles,Forms;

  procedure SetpSX_PathsfrompSXIni;
  procedure SavepSX_PathsAtExit;

  procedure Add_pSX_exe_file;
  procedure CreatepSX_paths_firstTime;
  procedure Add_pSX_bios_file;
  procedure CreatepSX_configuration_forfirstTime;
  procedure CreateDefault_pSXIni;
  procedure SetpSX_ScreenShotsDir;
  procedure SetpSX_CDImagesDir;
  procedure SetpSX_SaveStatesDir;
  procedure SetpSX_MemoryCardsDir;
  procedure SetpSX_Card1;
  procedure SetpSX_Card2;
  procedure SetUPpSXCard1;
  procedure SetUPpSXCard2;
  procedure SetUPpSXScreenShotsDir;
  procedure SetUPpSXCDImagesDir;
  procedure SetUPpSXSaveStatesDir;
  procedure SetUPpSXMemoryCardsDir;
  procedure EjectpSX_Card1;
  procedure EjectpSX_Card2;

// Menu actions
  procedure Show_psx_pathspanel;
  procedure em_psx_paths_ShowDynamicComps;
  procedure em_psx_paths_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  psx_screen,psx_sound,psx_others,psx_database;

var
  OldpSX_exe:string;
  BiosFindFromStart: Boolean;

procedure SetpSX_PathsfrompSXIni;
var
  paths_str: string;
begin
  if pSX_Exe <> '' then
    begin
      if Started = True then
        begin
          Conf.sEdit81.Text := FullPathpSX_Exe + pSX_Exe;
          Conf.sEdit82.Enabled := True;
          Conf.sBitBtn77.Enabled := True;
          Conf.sEdit82.Text := pSX_Config.ReadString('Paths','BiosName',Conf.sEdit82.Text)
        end;
      paths_str := pSX_Ini.ReadString('Paths','ScreenShotsPath',paths_str);
      if paths_str = 'screenshots' then
        Conf.sEdit83.Text := FullPathpSX_Exe + 'screenshots'
      else
        Conf.sEdit83.Text := paths_str;
      paths_str := pSX_Ini.ReadString('Paths','CDImagePath',paths_str);
      if paths_str = 'cdimages' then
        Conf.sEdit84.Text := FullPathpSX_Exe + 'cdimages'
      else
        Conf.sEdit84.Text := paths_str;
      paths_str := pSX_Ini.ReadString('Paths','SaveStatePath',paths_str);
      if paths_str = 'saves' then
        Conf.sEdit85.Text := FullPathpSX_Exe + 'saves'
      else
        Conf.sEdit85.Text := paths_str;
      paths_str := pSX_Ini.ReadString('Paths','MemoryCardPath',paths_str);
      if paths_str = 'cards' then
        conf.sEdit86.Text := FullPathpSX_Exe + 'cards'
      else
        Conf.sEdit86.Text := paths_str;
      Conf.sEdit87.Text := pSX_Ini.ReadString('Cards','Card1',Conf.sEdit87.Text);
      Conf.sEdit88.Text := pSX_Ini.ReadString('Cards','Card2',Conf.sEdit88.Text)
    end;
end;

procedure SavepSX_PathsAtExit;
begin
  if pSX_Exe <> '' then
    begin
      pSX_Ini.WriteString('Paths','ScreenShotsPath',Conf.sEdit83.Text);
      pSX_Ini.WriteString('Paths','CDImagePath',Conf.sEdit84.Text);
      pSX_Ini.WriteString('Paths','SaveStatePath',Conf.sEdit85.Text);
      pSX_Ini.WriteString('Paths','MemoryCardPath',Conf.sEdit86.Text);
      pSX_Ini.WriteString('Cards','Card1',Conf.sEdit87.Text);
      pSX_Ini.WriteString('Cards','Card2',Conf.sEdit88.Text);
    end;
end;

procedure Add_pSX_exe_file;
begin
  gFindFiles := 'pSX_exe';
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.Filter := 'psxfin.exe|psxfin.exe';
  Conf.Find_Files.Execute;
  OldpSX_exe := Conf.sEdit81.Text;
end;

procedure CreatepSX_paths_firstTime;
begin
  if OldpSX_exe <> Conf.Find_Files.FileName then
    begin
      pSX_Exe := ExtractFileName(Conf.Find_Files.FileName);
      FullPathpSX_Exe := ExtractFilePath(Conf.Find_Files.FileName);
      Conf.sEdit81.Text := FullPathpSX_Exe + pSX_Exe;
      pSX_confEditor_ini := ExtractFilePath(Application.ExeName) + 'media\emulators\consoles\playstation\psxemulator\config\config.ini';
      pSX_Config := TIniFile.Create(pSX_confEditor_ini);
      pSX_Config.WriteString('Paths','ExeName',pSX_Exe);
      pSX_Config.WriteString('Paths','FullPathExe',FullPathpSX_Exe);
      Conf.sEdit82.Enabled := True;
      Conf.sBitBtn77.Enabled := True;
      if FileExists(FullPathpSX_Exe + '\bios\scph1001.bin') then
        begin
          BiosFindFromStart := True;
          CreatepSX_configuration_forfirstTime;
        end
    end;
end;

procedure Add_pSX_bios_file;
begin
  gFindFiles := 'pSX_bios';
  Conf.Find_Files.InitialDir := Program_Path+'emulators';
  Conf.Find_Files.Filter := 'scph1001.bin|scph1001.bin';
  Conf.Find_Files.Execute;
end;

procedure CreatepSX_configuration_forfirstTime;
begin
  if pSX_Exe <> '' then
    begin
      if BiosFindFromStart = True then
        Conf.sEdit82.Text := FullPathpSX_Exe + 'bios\scph1001.bin'
      else
        Conf.sEdit82.Text := Conf.Find_Files.FileName;
      pSX_Config.WriteString('Paths','FoundBIOS','ok');
      pSX_Config.WriteString('Paths','BiosName',Conf.sEdit82.Text);
      if FileExists(Program_Path + 'media\emulators\consoles\playstation\database\playstation.xml') then
        begin
          pSX_Config.WriteBool('Paths','FoundDatabase',True);
          pSX_Config.WriteString('Paths','DatabasePath',Program_Path + 'media\emulators\consoles\playstation\database\playstation.xml');
        end
      else
        begin
          pSX_Config.WriteBool('Paths','FoundDatabase',False);
          pSX_Config.WriteString('Paths','DatabasePath',' ');
        end;
      CreateDefault_pSXIni;
      SetpSX_PathsfrompSXIni;
      SetpSX_ScreenfrompSXIni;
      SetpSX_SoundfrompSXIni;
      SetpSX_OthersfrompSXIni;
      SetpSX_DatabasefrompSXIni;
    end;
end;

procedure SetpSX_ScreenShotsDir;
begin
  gFindFiles := 'pSX_screenshots';
  Conf.Find_Files.Execute;
end;

procedure SetpSX_CDImagesDir;
begin
  gFindFiles := 'pSX_cdimages';
  Conf.Find_Files.Execute;
end;

procedure SetpSX_SaveStatesDir;
begin
  gFindFiles := 'pSX_savestates';
  Conf.Find_Files.Execute;
end;

procedure SetpSX_MemoryCardsDir;
begin
  gFindFiles := 'pSX_memorycards';
  Conf.Find_Files.Execute;
end;

procedure SetpSX_Card1;
begin
  gFindFiles := 'pSX_card1';
  Conf.Find_Files.Filter := 'Playstation Memory Card (*.mcr)|*.mcr';
  Conf.Find_Files.Execute;
end;

procedure SetpSX_Card2;
begin
  gFindFiles := 'pSX_card2';
  Conf.Find_Files.Filter := 'Playstation Memory Card (*.mcr)|*.mcr';
  Conf.Find_Files.Execute;
end;

procedure SetUPpSXScreenShotsDir;
begin
  Conf.sEdit83.Text := Conf.Find_Files.FileName;
end;

procedure SetUPpSXCDImagesDir;
begin
  Conf.sEdit84.Text := Conf.Find_Files.FileName;
end;

procedure SetUPpSXSaveStatesDir;
begin
  Conf.sEdit85.Text := Conf.Find_Files.FileName;
end;

procedure SetUPpSXMemoryCardsDir;
begin
  Conf.sEdit86.Text := Conf.Find_Files.FileName;
end;

procedure SetUPpSXCard1;
begin
  Conf.sEdit87.Text := Conf.Find_Files.FileName;
end;

procedure SetUPpSXCard2;
begin
  Conf.sEdit88.Text := Conf.Find_Files.FileName;
end;

procedure EjectpSX_Card1;
begin
  Conf.sEdit87.Text := '';
end;

procedure EjectpSX_Card2;
begin
  Conf.sEdit88.Text := '';
end;

procedure CreateDefault_pSXIni;
var
  rf: TStringList;
begin
  rf := TStringList.Create;
  rf.Add('[Paths]');
  rf.Add('SaveStatePath=saves');
  rf.Add('MemoryCardPath=cards');
  rf.Add('CDImagePath=cdimages');
  rf.Add('ScreenShotsPath=screenshots');
  rf.Add(' ');
  rf.Add('[BIOS]');
  rf.Add('PS1=bios\scph1001.bin');
  rf.Add('PS2=bios\scph39001.bin');
  rf.Add(' ');
  rf.Add('[Input]');
  rf.Add('Key1Select=57');
  rf.Add('Key1Start=28');
  rf.Add('Key1Up=200');
  rf.Add('Key1Right=205');
  rf.Add('Key1Down=208');
  rf.Add('Key1Left=203');
  rf.Add('Key1L2=29');
  rf.Add('Key1R2=157');
  rf.Add('Key1L1=42');
  rf.Add('Key1R1=54');
  rf.Add('Key1Triangle=30');
  rf.Add('Key1Circle=31');
  rf.Add('Key1Cross=44');
  rf.Add('Key1Square=45');
  rf.Add('Key1L3=-1');
  rf.Add('Key1R3=-1');
  rf.Add('Key1LStickX=-1');
  rf.Add('Key1LStickY=-1');
  rf.Add('Key1RStickX=-1');
  rf.Add('Key1RStickY=-1');
  rf.Add('Joy1SelectType=0');
  rf.Add('Joy1SelectDef=-1');
  rf.Add('Joy1StartType=0');
  rf.Add('Joy1StartDef=-1');
  rf.Add('Joy1UpType=0');
  rf.Add('Joy1UpDef=-1');
  rf.Add('Joy1RightType=0');
  rf.Add('Joy1RightDef=-1');
  rf.Add('Joy1DownType=0');
  rf.Add('Joy1DownDef=-1');
  rf.Add('Joy1LeftType=0');
  rf.Add('Joy1LeftDef=-1');
  rf.Add('Joy1L2Type=0');
  rf.Add('Joy1L2Def=-1');
  rf.Add('Joy1R2Type=0');
  rf.Add('Joy1R2Def=-1');
  rf.Add('Joy1L1Type=0');
  rf.Add('Joy1L1Def=-1');
  rf.Add('Joy1R1Type=0');
  rf.Add('Joy1R1Def=-1');
  rf.Add('Joy1TriangleType=0');
  rf.Add('Joy1TriangleDef=-1');
  rf.Add('Joy1CircleType=0');
  rf.Add('Joy1CircleDef=-1');
  rf.Add('Joy1CrossType=0');
  rf.Add('Joy1CrossDef=-1');
  rf.Add('Joy1SquareType=0');
  rf.Add('Joy1SquareDef=-1');
  rf.Add('Joy1L3Type=0');
  rf.Add('Joy1L3Def=-1');
  rf.Add('Joy1R3Type=0');
  rf.Add('Joy1R3Def=-1');
  rf.Add('Joy1LStickXType=0');
  rf.Add('Joy1LStickXDef=-1');
  rf.Add('Joy1LStickYType=0');
  rf.Add('Joy1LStickYDef=-1');
  rf.Add('Joy1RStickXType=0');
  rf.Add('Joy1RStickXDef=-1');
  rf.Add('Joy1RStickYType=0');
  rf.Add('Joy1RStickYDef=-1');
  rf.Add('Joy1Rumble=1');
  rf.Add('Key2Select=-1');
  rf.Add('Key2Start=-1');
  rf.Add('Key2Up=-1');
  rf.Add('Key2Right=-1');
  rf.Add('Key2Down=-1');
  rf.Add('Key2Left=-1');
  rf.Add('Key2L2=-1');
  rf.Add('Key2R2=-1');
  rf.Add('Key2L1=-1');
  rf.Add('Key2R1=-1');
  rf.Add('Key2Triangle=-1');
  rf.Add('Key2Circle=-1');
  rf.Add('Key2Cross=-1');
  rf.Add('Key2Square=-1');
  rf.Add('Key2L3=-1');
  rf.Add('Key2R3=-1');
  rf.Add('Key2LStickX=-1');
  rf.Add('Key2LStickY=-1');
  rf.Add('Key2RStickX=-1');
  rf.Add('Key2RStickY=-1');
  rf.Add('Joy2SelectType=0');
  rf.Add('Joy2SelectDef=-1');
  rf.Add('Joy2StartType=0');
  rf.Add('Joy2StartDef=-1');
  rf.Add('Joy2UpType=0');
  rf.Add('Joy2UpDef=-1');
  rf.Add('Joy2RightType=0');
  rf.Add('Joy2RightDef=-1');
  rf.Add('Joy2DownType=0');
  rf.Add('Joy2DownDef=-1');
  rf.Add('Joy2LeftType=0');
  rf.Add('Joy2LeftDef=-1');
  rf.Add('Joy2L2Type=0');
  rf.Add('Joy2L2Def=-1');
  rf.Add('Joy2R2Type=0');
  rf.Add('Joy2R2Def=-1');
  rf.Add('Joy2L1Type=0');
  rf.Add('Joy2L1Def=-1');
  rf.Add('Joy2R1Type=0');
  rf.Add('Joy2R1Def=-1');
  rf.Add('Joy2TriangleType=0');
  rf.Add('Joy2TriangleDef=-1');
  rf.Add('Joy2CircleType=0');
  rf.Add('Joy2CircleDef=-1');
  rf.Add('Joy2CrossType=0');
  rf.Add('Joy2CrossDef=-1');
  rf.Add('Joy2SquareType=0');
  rf.Add('Joy2SquareDef=-1');
  rf.Add('Joy2L3Type=0');
  rf.Add('Joy2L3Def=-1');
  rf.Add('Joy2R3Type=0');
  rf.Add('Joy2R3Def=-1');
  rf.Add('Joy2LStickXType=0');
  rf.Add('Joy2LStickXDef=-1');
  rf.Add('Joy2LStickYType=0');
  rf.Add('Joy2LStickYDef=-1');
  rf.Add('Joy2RStickXType=0');
  rf.Add('Joy2RStickXDef=-1');
  rf.Add('Joy2RStickYType=0');
  rf.Add('Joy2RStickYDef=-1');
  rf.Add('Joy2Rumble=1');
  rf.Add('KeyStatusDisplay=15');
  rf.Add('KeyMute=156');
  rf.Add('KeyIncVolume=78');
  rf.Add('KeyDecVolume=74');
  rf.Add('KeyIncXAVolume=209');
  rf.Add('KeyDecXAVolume=201');
  rf.Add('KeySoundStatus=181');
  rf.Add('KeyFastForward=14');
  rf.Add('KeyShowVram=87');
  rf.Add('KeyIncGamma=73');
  rf.Add('KeyDecGamma=81');
  rf.Add('KeyIncBrightness=72');
  rf.Add('KeyDecBrightness=80');
  rf.Add('KeyIncContrast=71');
  rf.Add('KeyDecContrast=79');
  rf.Add('KeyScreenShot=88');
  rf.Add('EscapeMode=0');
  rf.Add('JoystickDevice1=NULL');
  rf.Add('JoystickDevice2=NULL');
  rf.Add(' ');
  rf.Add('[Controllers]');
  rf.Add('Controller1Type=-1');
  rf.Add('Controller2Type=-1');
  rf.Add(' ');
  rf.Add('[Sound]');
  rf.Add('Frequency=-1');
  rf.Add('Sync=1');
  rf.Add('Reverb=1');
  rf.Add('Interpolate=1');
  rf.Add('Latency=20');
  rf.Add('XALatency=20');
  rf.Add('Device=00000000000000000000000000000000');
  rf.Add(' ');
  rf.Add('[Graphics]');
  rf.Add('BilinearInterpolation=1');
  rf.Add('FrameSkip=0');
  rf.Add('SleepWhenIdle=1');
  rf.Add('PauseWhenDefocused=1');
  rf.Add('StatusIcons=0');
  rf.Add('NTSCWidth=-1');
  rf.Add('NTSCHeight=-1');
  rf.Add('NTSCRefresh=-1');
  rf.Add('PALWidth=-1');
  rf.Add('PALHeight=-1');
  rf.Add('PALRefresh=-1');
  rf.Add('FullscreenVSync=1');
  rf.Add('WindowedSync=1');
  rf.Add('Gamma=1.000000');
  rf.Add('Brightness=0.000000');
  rf.Add('Contrast=0.000000');
  rf.Add('ScreenshotFormat=0');
  rf.Add('FullscreenAdapter=-1');
  rf.Add('FullscreenAspectRatio=-1');
  rf.Add(' ');
  rf.Add('[CDROM]');
  rf.Add('Driver=-1');
  rf.Add('SubcodeReading=-1');
  rf.Add(' ');
  rf.Add('[MainWindow]');
  rf.Add('XPosition=92');
  rf.Add('YPosition=176');
  rf.Add(' ');
  rf.Add('[Cards]');
  rf.Add('Card1=');
  rf.Add('Card2=');
  rf.Add(' ');
  rf.Add('[Language]');
  rf.Add('CurrentLanguage=45006e0067006c006900730068000000');
  rf.SaveToFile(FullPathpSX_Exe + 'psx.ini');
  rf.Free;
  pSX_Ini := TIniFile.Create(FullPathpSX_Exe + 'psx.ini');
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_psx_pathspanel;
begin
  if (Cmenustate = 'em_consoles_psx_screen') then
    em_psx_screen_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_sound') then
    em_psx_sound_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_others') then
    em_psx_others_FreeDynamicComps
  else if (Cmenustate = 'em_consoles_psx_database') then
    em_psx_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn6.Caption,False,True);
  Cmenustate := 'em_consoles_psx_paths';
  em_psx_paths_ShowDynamicComps;
  ShowButtonDown(6,'EM_CONSOLES_SONY_PSX_DIRS');
  Conf.Pem_psx_sound.Tag := 0;
  Conf.Pem_psx_others.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_psx_paths');
end;

procedure em_psx_paths_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_psx_paths,'media\confeditor\images\psx\psx.png',
              3,590,100,71,i,'',True,False);
        2 : Image_Comp(Conf.Pem_psx_paths,'media\confeditor\images\psx\psx_image.png',
              587,381,150,280,i,'',True,False);
        3 : Image_Comp(Conf.Pem_psx_paths,'media\confeditor\images\psx\paths.png',
              614,2,121,71,i,'',True,False);
      end;
    end;
end;

procedure em_psx_paths_FreeDynamicComps;
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
 