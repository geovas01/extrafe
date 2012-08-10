unit hatari_system;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetHatari_SystemfromHatariIni;
  procedure SaveHatari_SystemAtExit;

  procedure CheckUnCheck_AutoSaveMemeoryState;

// Menu actions
  procedure Show_hatari_systempanel;
  procedure em_hatari_system_ShowDynamicComps;
  procedure em_hatari_system_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_screen,hatari_joy,hatari_paths,hatari_database;

procedure SetHatari_SystemfromHatariIni;
var
  System_Int: Integer;
  System_Str: string;
begin
  if Hatari_Exe <> '' then
    begin
      System_Int := Hatari_ini.ReadInteger('System','nMachineType',System_Int);
      case System_Int of
        0 : Conf.rb13.Checked := True;
        1 : Conf.rb14.Checked := True;
        2 : Conf.rb15.Checked := True;
        3 : Conf.rb16.Checked := True;
      end;
      System_Int := Hatari_ini.ReadInteger('System','nCpuFreq',System_Int);
      Conf.sComboBox43.Text := IntToStr(System_Int);
      System_Int := Hatari_ini.ReadInteger('System','nCpuLevel',System_Int);
      case System_Int of
        0 : Conf.rb17.Checked := True;
        1 : Conf.rb18.Checked := True;
        2 : Conf.rb19.Checked := True;
        3 : Conf.rb20.Checked := True;
        4 : conf.rb21.Checked := True;
      end;
      System_Str := Hatari_ini.ReadString('System','bCompatibleCpu',System_Str);
      Conf.sCheckBox86.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('System','bBlitter',System_Str);
      Conf.sCheckBox87.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('System','bRealTimeClock',System_Str);
      Conf.sCheckBox88.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('System','bPatchTimerD',System_Str);
      Conf.sCheckBox89.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('System','bFastBoot',System_Str);
      Conf.sCheckBox60.Checked := StrToBool(System_Str);
      System_Int := Hatari_ini.ReadInteger('System','nDSPType',System_Int);
      Conf.sComboBox45.ItemIndex := System_Int;
      System_Int := Hatari_ini.ReadInteger('Memory','nMemorySize',System_Int);
      case System_Int of
        0 : Conf.rb22.Checked := True;
        1 : Conf.rb23.Checked := True;
        2 : Conf.rb24.Checked := True;
        4 : Conf.rb25.Checked := True;
        8 : Conf.rb26.Checked := True;
        14 : Conf.rb27.Checked := True;
      end;
      System_Str := Hatari_ini.ReadString('Memory','bAutoSave',System_Str);
      Conf.sCheckBox91.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('Memory','szMemoryCaptureFileName',System_Str);
      Conf.sLabel22.Caption := System_Str;
      System_Str := Hatari_ini.ReadString('Printer','bEnablePrinting',System_Str);
      Conf.sCheckBox92.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('Printer','szPrintToFileName',System_Str);
      Conf.sLabel23.Caption := System_Str;
      System_Str := Hatari_ini.ReadString('RS232','bEnableRS232',System_Str);
      Conf.sCheckBox93.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('RS232','szOutFileName',System_Str);
      Conf.sLabel26.Caption := System_Str;
      System_Str := Hatari_ini.ReadString('RS232','szInFileName',System_Str);
      Conf.sLabel53.Caption := System_Str;
      System_Str := Hatari_ini.ReadString('Midi','bEnableMidi',System_Str);
      Conf.sCheckBox94.Checked := StrToBool(System_Str);
      System_Str := Hatari_ini.ReadString('Midi','sMidiOutFileName',System_Str);
      Conf.sLabel55.Caption := System_Str;
      System_Str := Hatari_ini.ReadString('Midi','sMidiInFileName',System_Str);
      Conf.sLabel57.Caption := System_Str;
    end;
end;

procedure SaveHatari_SystemAtExit;
begin
  if Hatari_Exe <> '' then
    begin
      if Conf.rb13.Checked = True then
        Hatari_ini.WriteInteger('System','nMachineType',0)
      else if Conf.rb14.Checked = True then
        Hatari_ini.WriteInteger('System','nMachineType',1)
      else if Conf.rb15.Checked = True then
        Hatari_ini.WriteInteger('System','nMachineType',2)
      else if Conf.rb16.Checked = True then
        Hatari_ini.WriteInteger('System','nMachineType',3);
      Hatari_ini.WriteInteger('System','nCpuFreq',StrToInt(Conf.sComboBox43.Text));
      if  Conf.rb17.Checked = True then
        Hatari_ini.WriteInteger('System','nCpuLevel',0)
      else if Conf.rb18.Checked = True then
        Hatari_ini.WriteInteger('System','nCpuLevel',1)
      else if Conf.rb19.Checked = True then
        Hatari_ini.WriteInteger('System','nCpuLevel',2)
      else if Conf.rb20.Checked = True then
        Hatari_ini.WriteInteger('System','nCpuLevel',3)
      else if Conf.rb21.Checked = True then
        Hatari_ini.WriteInteger('System','nCpuLevel',4);
      if Conf.sCheckBox86.Checked = True then
        Hatari_ini.WriteString('System','bCompatibleCpu','TRUE')
      else
        Hatari_ini.WriteString('System','bCompatibleCpu','FALSE');
      if Conf.sCheckBox87.Checked = True then
        Hatari_ini.WriteString('System','bBlitter','TRUE')
      else
        Hatari_ini.WriteString('System','bBlitter','FALSE');
      if Conf.sCheckBox88.Checked = True then
        Hatari_ini.WriteString('System','bRealTimeClock','TRUE')
      else
        Hatari_ini.WriteString('System','bRealTimeClock','FALSE');
      if Conf.sCheckBox89.Checked = True then
        Hatari_ini.WriteString('System','bPatchTimerD','TRUE')
      else
        Hatari_ini.WriteString('System','bPatchTimerD','FALSE');
      if Conf.sCheckBox60.Checked = True then
        Hatari_ini.WriteString('System','bFastBoot','TRUE')
      else
        Hatari_ini.WriteString('System','bFastBoot','FALSE');
      Hatari_ini.WriteInteger('System','nDSPType',Conf.sComboBox45.ItemIndex);
      if Conf.rb22.Checked = True then
        Hatari_ini.WriteInteger('Memory','nMemorySize',0)
      else if Conf.rb23.Checked = True then
        Hatari_ini.WriteInteger('Memory','nMemorySize',1)
      else if Conf.rb24.Checked = True then
        Hatari_ini.WriteInteger('Memory','nMemorySize',2)
      else if Conf.rb25.Checked = True then
        Hatari_ini.WriteInteger('Memory','nMemorySize',4)
      else if Conf.rb26.Checked = True then
        Hatari_ini.WriteInteger('Memory','nMemorySize',8)
      else if Conf.rb27.Checked = True then
        Hatari_ini.WriteInteger('Memory','nMemorySize',14);
      if Conf.sCheckBox91.Checked = True then
        Hatari_ini.WriteString('Memory','bAutoSave','TRUE')
      else
        Hatari_ini.WriteString('Memory','bAutoSave','FALSE');
      Hatari_ini.WriteString('Memory','szMemoryCaptureFileName',Conf.sLabel22.Caption);
      if Conf.sCheckBox92.Checked = True then
        Hatari_ini.WriteString('Printer','bEnablePrinting','TRUE')
      else
        Hatari_ini.WriteString('Printer','bEnablePrinting','FALSE');
      Hatari_ini.WriteString('Printer','szPrintToFileName',Conf.sLabel23.Caption);
      if Conf.sCheckBox93.Checked = True then
        Hatari_ini.WriteString('RS232','bEnableRS232','TRUE')
      else
        Hatari_ini.WriteString('RS232','bEnableRS232','FALSE');
      Hatari_ini.WriteString('RS232','szOutFileName',Conf.sLabel26.Caption);
      Hatari_ini.WriteString('RS232','szInFileName',Conf.sLabel53.Caption);
      if Conf.sCheckBox94.Checked = True then
        Hatari_ini.WriteString('Midi','bEnableMidi','TRUE')
      else
        Hatari_ini.WriteString('Midi','bEnableMidi','FALSE');
      Hatari_ini.WriteString('Midi','sMidiOutFileName',Conf.sLabel55.Caption);
      Hatari_ini.WriteString('Midi','sMidiInFileName',Conf.sLabel57.Caption);
    end;
end;

procedure CheckUnCheck_AutoSaveMemeoryState;
var
  Memory_Path: string;
begin
  if Conf.sCheckBox91.Checked = True then
    begin
      Memory_Path := Hatari_ini.ReadString('Memory','szAutoSaveFileName',Memory_Path);
      Conf.sLabel22.Caption := Memory_Path;
      Hatari_ini.WriteString('Memory','bAutoSave','TRUE');
    end
  else
    begin
      Memory_Path := Hatari_ini.ReadString('Memory','szMemoryCaptureFileName',Memory_Path);
      Conf.sLabel22.Caption := Memory_Path;
      Hatari_ini.WriteString('Memory','bAutoSave','FALSE');
    end;
end;


//////////////////////////////////////////////////////////////////////////////
procedure Show_hatari_systempanel;
begin
  if (Cmenustate = 'em_computers_hatari_paths') then
    em_hatari_paths_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_roms') then
    em_hatari_roms_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_screen') then
    em_hatari_screen_FreeDynamicComps
  else if  (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_database') then
    em_hatari_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn7.Caption,False,True);
  Cmenustate := 'em_computers_hatari_system';
  em_hatari_system_ShowDynamicComps;
  ShowButtonDown(7,'EM_COMPUTERS_ATARI_HATARI_SYSTEM');
  Conf.Pem_hatari_joy.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_hatari_system');
end;

procedure em_hatari_system_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_system,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_system,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_system,'media\confeditor\images\hatari\system.png',
              606,2,129,71,i,True);
      end;
    end;
end;

procedure em_hatari_system_FreeDynamicComps;
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

