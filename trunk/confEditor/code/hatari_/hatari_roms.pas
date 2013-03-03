unit hatari_roms;

interface
uses
  SysUtils,Classes,ExtCtrls,global,FileCtrl;

  procedure SetHatari_RomsfromHatariIni;
  procedure SaveHatari_RomsAtExit;

  procedure SetHatari_CartridgeImage;
  procedure SetHatari_DiskImagesDir;
  procedure SetHatari_HardDiskImage;
  procedure SetHatari_MasterIDEImage;
  procedure SetHatari_SlaveIDEImage;
  procedure SetHatari_GemDosDrive;
  procedure SetUpHatariCartridgeImage;
  procedure SetUpHatariDiskImagesDir;
  procedure SetUpHatariHardDiskImage;
  procedure SetUpHatariMasterIDEImage;
  procedure SetUpHatariSlaveIDEImage;
  procedure SetUpHatariGemDosDrive;
  procedure EjectHatari_CartridgeImage;
  procedure EjectHatari_HardDiskImage;
  procedure EjectHatari_MasterIDEImage;
  procedure EjectHatari_SlaveIDEImage;
  procedure EjectHatari_GemDosDrive;

// Menu actions
  procedure Show_hatari_romspanel;
  procedure em_hatari_roms_ShowDynamicComps;
  procedure em_hatari_roms_FreeDynamicComps;


implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_system,hatari_screen,hatari_joy,hatari_paths,hatari_database;

var
  oldPath,newPath: string;


procedure SetHatari_RomsfromHatariIni;
var
  Roms_str,Roms_str1: string;
  Roms_int: Integer;
begin
  if Hatari_Exe <> '' then
    begin
      Roms_str := Hatari_ini.ReadString('ROM','szTosImageFileName',Roms_str);
      Conf.sLabel59.Caption := Roms_str;
      Roms_str := Hatari_ini.ReadString('ROM','szCartridgeImageFileName',Roms_str);
      Conf.sLabel71.Caption := Roms_str;
      Roms_str := Hatari_ini.ReadString('Floppy','szDiskImageDirectory',Roms_str);
      Conf.sLabel65.Caption := Roms_str;
      Roms_int := Hatari_ini.ReadInteger('Floppy','nWriteProtection',Roms_int);
      Conf.sComboBox44.ItemIndex := Roms_int;
      Roms_str := Hatari_ini.ReadString('Floppy','bAutoInsertDiskB',Roms_str);
      Conf.sCheckBox90.Checked := StrToBool(Roms_str);
      Roms_str := Hatari_ini.ReadString('Floppy','FastFloppy',Roms_str);
      Conf.sCheckBox61.Checked := StrToBool(Roms_str);
      Roms_str := Hatari_ini.ReadString('HardDisk','bBootFromHardDisk',Roms_str);
      Conf.sCheckBox95.Checked := StrToBool(Roms_str);
      Roms_int := Hatari_ini.ReadInteger('HardDisk','nWriteProtection',Roms_int);
      Conf.sComboBox46.ItemIndex := Roms_int;
      Roms_str := Hatari_ini.ReadString('HardDisk','bUseHardDiskImage',Roms_str);
      if Roms_str = 'TRUE' then
        begin
          Roms_str1 := Hatari_ini.ReadString('HardDisk','szHardDiskImage',Roms_str1);
          Conf.sLabel68.Caption := Roms_str1;
        end
      else
        Conf.sLabel68.Caption := '';
      Roms_str := Hatari_ini.ReadString('HardDisk','bUseIdeMasterHardDiskImage',Roms_str);
      if Roms_str = 'TRUE' then
        begin
          Roms_str1 := Hatari_ini.ReadString('HardDisk','szIdeMasterHardDiskImage',Roms_str1);
          Conf.sLabel73.Caption := Roms_str1;
        end
      else
        Conf.sLabel73.Caption := '';
      Roms_str := Hatari_ini.ReadString('HardDisk','bUseIdeSlaveHardDiskImage',Roms_str);
      if Roms_str = 'TRUE' then
        begin
          Roms_str1 := Hatari_ini.ReadString('HardDisk','szIdeSlaveHardDiskImage',Roms_str1);
          Conf.sLabel75.Caption := Roms_str1;
        end
      else
        Conf.sLabel75.Caption := '';
    end;
end;

procedure SaveHatari_RomsAtExit;
begin
  if Hatari_Exe <> '' then
    begin
      Hatari_ini.WriteString('ROM','szTosImageFileName',Conf.sLabel59.Caption);
      Hatari_ini.WriteString('ROM','szCartridgeImageFileName',Conf.sLabel71.Caption);
      Hatari_ini.WriteString('Floppy','szDiskImageDirectory',Conf.sLabel65.Caption);
      Hatari_ini.WriteInteger('Floppy','nWriteProtection',Conf.sComboBox44.ItemIndex);
      if Conf.sCheckBox90.Checked = True then
        Hatari_ini.WriteString('Floppy','bAutoInsertDiskB','TRUE')
      else
        Hatari_ini.WriteString('Floppy','bAutoInsertDiskB','FALSE');
      if Conf.sCheckBox61.Checked = True then
        Hatari_ini.WriteString('Floppy','FastFloppy','TRUE')
      else
        Hatari_ini.WriteString('Floppy','FastFloppy','FALSE');
      if Conf.sCheckBox95.Checked = True then
        Hatari_ini.WriteString('HardDisk','bBootFromHardDisk','TRUE')
      else
        Hatari_ini.WriteString('HardDisk','bBootFromHardDisk','FALSE');
      Hatari_ini.WriteInteger('HardDisk','nWriteProtection',Conf.sComboBox46.ItemIndex);
      Hatari_ini.WriteString('HardDisk','szHardDiskImage',Conf.sLabel68.Caption);
      if Conf.sLabel68.Caption <> '' then
        Hatari_ini.WriteString('HardDisk','bUseHardDiskImage','TRUE')
      else
        Hatari_ini.WriteString('HardDisk','bUseHardDiskImage','FALSE');
      Hatari_ini.WriteString('HardDisk','szIdeMasterHardDiskImage',Conf.sLabel73.Caption);
      if Conf.sLabel73.Caption <> '' then
        Hatari_ini.WriteString('HardDisk','bUseIdeMasterHardDiskImage','TRUE')
      else
        Hatari_ini.WriteString('HardDisk','bUseIdeMasterHardDiskImage','FALSE');
      Hatari_ini.WriteString('HardDisk','szIdeSlaveHardDiskImage',Conf.sLabel75.Caption);
      if Conf.sLabel75.Caption <> '' then
        Hatari_ini.WriteString('HardDisk','bUseIdeSlaveHardDiskImage','TRUE')
      else
        Hatari_ini.WriteString('HardDisk','bUseIdeSlaveHardDiskImage','FALSE');
    end;
end;

procedure SetHatari_CartridgeImage;
begin
  gFindFiles := 'hatari_CartridgeImage';
  Conf.Find_Files.Execute;
end;

procedure SetHatari_DiskImagesDir;
begin
  oldpath := Conf.sLabel65.Caption;
  if FileCtrl.SelectDirectory(newpath,[sdAllowCreate,sdPerformCreate],0) then
    if oldpath <> newpath  then
      begin
        gFindDirs := 'hatari_DiskImagesDir';
        global_Find_DirsClose;
      end;
end;

procedure SetHatari_HardDiskImage;
begin
  gFindFiles := 'hatari_HardDiskImage';
  Conf.Find_Files.Execute;
end;

procedure SetHatari_MasterIDEImage;
begin
  gFindFiles := 'hatari_MasterIDEImage';
  Conf.Find_Files.Execute;
end;

procedure SetHatari_SlaveIDEImage;
begin
  gFindFiles := 'hatari_SlaveIDEImage';
  Conf.Find_Files.Execute;
end;

procedure SetHatari_GemDosDrive;
begin
  gFindFiles := 'hatari_GemDosDrive';
  Conf.Find_Files.Execute;
end;

procedure SetUpHatariCartridgeImage;
begin
  Conf.sLabel71.Caption := Conf.Find_Files.FileName;
end;

procedure SetUpHatariDiskImagesDir;
begin
  Conf.sLabel65.Caption := newPath;
end;

procedure SetUpHatariHardDiskImage;
begin
  Conf.sLabel68.Caption := Conf.Find_Files.FileName;
end;

procedure SetUpHatariMasterIDEImage;
begin
  Conf.sLabel73.Caption := Conf.Find_Files.FileName;
end;

procedure SetUpHatariSlaveIDEImage;
begin
  Conf.sLabel75.Caption := Conf.Find_Files.FileName;
end;

procedure SetUpHatariGemDosDrive;
begin
  Conf.sLabel69.Caption := Conf.Find_Files.FileName;
end;

procedure EjectHatari_CartridgeImage;
begin
  Conf.sLabel71.Caption := '';
end;

procedure EjectHatari_HardDiskImage;
begin
  Conf.sLabel68.Caption := '';
end;

procedure EjectHatari_MasterIDEImage;
begin
  Conf.sLabel73.Caption := '';
end;

procedure EjectHatari_SlaveIDEImage;
begin
  Conf.sLabel75.Caption := '';
end;

procedure EjectHatari_GemDosDrive;
begin
  Conf.sLabel69.Caption := '';
end;


//////////////////////////////////////////////////////////////////////////////
procedure Show_hatari_romspanel;
begin
  if (Cmenustate = 'em_computers_hatari_paths') then
    em_hatari_paths_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_screen') then
    em_hatari_screen_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_database') then
    em_hatari_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn8.Caption,False,True);
  Cmenustate := 'em_computers_hatari_roms';
  em_hatari_roms_ShowDynamicComps;
  ShowButtonDown(8,'EM_COMPUTERS_ATARI_HATARI_DISKS');
  Conf.Pem_hatari_joy.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_hatari_roms');
end;

procedure em_hatari_roms_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_roms,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,'',True,False);
        2 : Image_Comp(Conf.Pem_hatari_roms,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,'',True,False);
        3 : Image_Comp(Conf.Pem_hatari_roms,'media\confeditor\images\hatari\roms.png',
              538,2,185,71,i,'',True,False);
      end;
    end;
end;

procedure em_hatari_roms_FreeDynamicComps;
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



