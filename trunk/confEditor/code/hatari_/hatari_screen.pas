unit hatari_screen;

interface
uses
  SysUtils,Classes,ExtCtrls;

  procedure SetHatari_ScreenfromHatariIni;
  procedure SaveHatari_ScreenAtExit;

// Menu actions
  procedure Show_hatari_screenpanel;
  procedure em_hatari_screen_ShowDynamicComps;
  procedure em_hatari_screen_FreeDynamicComps;

implementation

uses
  main,mainconf,menu,FunctionX,onflycomponents,
  hatari_roms,hatari_system,hatari_joy,hatari_paths,hatari_database;

procedure SetHatari_ScreenfromHatariIni;
var
  Screen_Str: string;
  Screen_Int: Integer;
begin
  if Hatari_Exe <> '' then
    begin
      Screen_Str := Hatari_ini.ReadString('Screen','bFullScreen',Screen_Str);
      Conf.sCheckBox96.Checked := StrToBool(Screen_Str);
      Screen_Int := Hatari_ini.ReadInteger('Screen','nFrameSkips',Screen_Int);
      case Screen_Int of
        0 : Conf.sComboBox47.Text := 'Off';
        1 : Conf.sComboBox47.Text := IntToStr(Screen_Int);
        2 : Conf.sComboBox47.Text := IntToStr(Screen_Int);
        4 : Conf.sComboBox47.Text := IntToStr(Screen_Int);
        5 : Conf.sComboBox47.Text := 'Auto';
      end;
      Screen_Int := 0;
      Screen_Str := Hatari_ini.ReadString('Screen','bShowStatusbar',Screen_Str);
      if Screen_Str = 'FALSE' then
        Screen_Int := Screen_Int + 1
      else
        Conf.sComboBox38.ItemIndex := 0;
      Screen_Str := Hatari_ini.ReadString('Screen','bShowDriveLed',Screen_Str);
      if Screen_Str = 'FALSE' then
        Screen_Int := Screen_Int + 1
      else
        Conf.sComboBox38.ItemIndex := 1;
      if Screen_Int = 2 then
        Conf.sComboBox38.ItemIndex := 2;
      Screen_Int := 384;
      Conf.sComboBox49.Items.Clear;
      repeat
        Conf.sComboBox49.Items.Add(IntToStr(Screen_Int));
        Screen_Int := Screen_Int + 8;
      until Screen_Int > 1280;
      Screen_Int := 208;
      Conf.sComboBox48.Items.Clear;
      repeat
        Conf.sComboBox48.Items.Add(IntToStr(Screen_Int));
        Screen_Int := Screen_Int + 8;
      until Screen_Int > 768;
      Screen_Str := Hatari_ini.ReadString('Screen','nMaxWidth',Screen_Str);
      Conf.sComboBox49.Text := Screen_Str;
      Screen_Str := Hatari_ini.ReadString('Screen','nMaxHeight',Screen_Str);
      Conf.sComboBox48.Text := Screen_Str;
      Screen_Str := Hatari_ini.ReadString('Screen','bCrop',Screen_Str);
      Conf.sCheckBox97.Checked := StrToBool(Screen_Str);
      Screen_Str := Hatari_ini.ReadString('Screen','bKeepResolution',Screen_Str);
      Conf.sCheckBox62.Checked := StrToBool(Screen_Str);
      Screen_Int := Hatari_ini.ReadInteger('Screen','nMonitorType',Screen_Int);
      Conf.sComboBox50.ItemIndex := Screen_Int;
      Screen_Str := Hatari_ini.ReadString('Screen','bAllowOverscan',Screen_Str);
      Conf.sCheckBox98.Checked := StrToBool(Screen_Str);
      Screen_Str := Hatari_ini.ReadString('Screen','bUseExtVdiResolutions',Screen_Str);
      Conf.sCheckBox99.Checked := StrToBool(Screen_Str);
      Screen_Int := 384;
      Conf.sComboBox51.Items.Clear;
      repeat
        Conf.sComboBox51.Items.Add(IntToStr(Screen_Int));
        Screen_Int := Screen_Int + 32;
      until Screen_Int > 1280;
      Screen_Int := 208;
      Conf.sComboBox52.Items.Clear;
      repeat
        Conf.sComboBox52.Items.Add(IntToStr(Screen_Int));
        Screen_Int := Screen_Int + 8;
      until Screen_Int > 960;
      Screen_Str := Hatari_ini.ReadString('Screen','nVdiWidth',Screen_Str);
      Conf.sComboBox51.Text := Screen_Str;
      Screen_Str := Hatari_ini.ReadString('Screen','nVdiHeight',Screen_Str);
      Conf.sComboBox52.Text := Screen_Str;
      Screen_Int := Hatari_ini.ReadInteger('Screen','nVdiColors',Screen_Int);
      Conf.sComboBox53.ItemIndex := Screen_Int;
      Screen_Str := Hatari_ini.ReadString('Sound','bEnableSound',Screen_Str);
      Conf.sCheckBox100.Checked := StrToBool(Screen_Str);
      Screen_Str := Hatari_ini.ReadString('Sound','nPlaybackFreq',Screen_Str);
      Conf.sComboBox54.Text := Screen_Str;
      Screen_Int := Hatari_ini.ReadInteger('Sound','YmVolumeMixing',Screen_Int);
      case Screen_Int of
        3 : Conf.sComboBox39.ItemIndex := 0;
        2 : Conf.sComboBox39.ItemIndex := 1;
        1 : Conf.sComboBox39.ItemIndex := 2;
      end;
      Screen_Str := Hatari_ini.ReadString('Sound','szYMCaptureFileName',Screen_Str);
      Conf.sLabel78.Caption := Screen_Str;
    end;
end;

procedure SaveHatari_ScreenAtExit;
begin
  if Hatari_Exe <> '' then
    begin
      if Conf.sCheckBox96.Checked = True then
        Hatari_ini.WriteString('Screen','bFullScreen','TRUE')
      else
        Hatari_ini.WriteString('Screen','bFullScreen','FALSE');
      if Conf.sComboBox47.ItemIndex = 0 then
        Hatari_ini.WriteInteger('Screen','nFrameSkips',0)
      else if Conf.sComboBox47.ItemIndex = 1 then
        Hatari_ini.WriteInteger('Screen','nFrameSkips',1)
      else if Conf.sComboBox47.ItemIndex = 2 then
        Hatari_ini.WriteInteger('Screen','nFrameSkips',2)
      else if Conf.sComboBox47.ItemIndex = 3 then
        Hatari_ini.WriteInteger('Screen','nFrameSkips',4)
      else if Conf.sComboBox47.ItemIndex = 4 then
        Hatari_ini.WriteInteger('Screen','nFrameSkips',5);
      if Conf.sComboBox38.ItemIndex = 0 then
        begin
          Hatari_ini.WriteString('Screen','bShowStatusbar','TRUE');
          Hatari_ini.WriteString('Screen','bShowDriveLed','FALSE');
        end
      else if Conf.sComboBox38.ItemIndex = 1 then
        begin
          Hatari_ini.WriteString('Screen','bShowStatusbar','FALSE');
          Hatari_ini.WriteString('Screen','bShowDriveLed','TRUE');
        end
      else if Conf.sComboBox38.ItemIndex = 2 then
        begin
          Hatari_ini.WriteString('Screen','bShowStatusbar','FALSE');
          Hatari_ini.WriteString('Screen','bShowDriveLed','FALSE');
        end;
      Hatari_ini.WriteInteger('Screen','nMaxWidth',StrToInt(Conf.sComboBox49.Text));
      Hatari_ini.WriteInteger('Screen','nMaxHeight',StrToInt(Conf.sComboBox48.Text));
      if Conf.sCheckBox97.Checked = True then
        Hatari_ini.WriteString('Screen','bCrop','TRUE')
      else
        Hatari_ini.WriteString('Screen','bCrop','FALSE');
      if Conf.sCheckBox62.Checked = True then
        Hatari_ini.WriteString('Screen','bKeepResolution','TRUE')
      else
        Hatari_ini.WriteString('Screen','bKeepResolution','FALSE');
      Hatari_ini.WriteInteger('Screen','nMonitorType',Conf.sComboBox50.ItemIndex);
      if Conf.sCheckBox98.Checked = True then
        Hatari_ini.WriteString('Screen','bAllowOverscan','TRUE')
      else
        Hatari_ini.WriteString('Screen','bAllowOverscan','FALSE');
      if Conf.sCheckBox99.Checked = True then
        Hatari_ini.WriteString('Screen','bUseExtVdiResolutions','TRUE')
      else
        Hatari_ini.WriteString('Screen','bUseExtVdiResolutions','FALSE');
      Hatari_ini.WriteInteger('Screen','nVdiWidth',StrToInt(Conf.sComboBox51.Text));
      Hatari_ini.WriteInteger('Screen','nVdiHeight',StrToInt(Conf.sComboBox52.Text));
      Hatari_ini.WriteInteger('Screen','nVdiColors',StrToInt(Conf.sComboBox53.Text));
      if Conf.sCheckBox100.Checked = True then
        Hatari_ini.WriteString('Sound','bEnableSound','TRUE')
      else
        Hatari_ini.WriteString('Sound','bEnableSound','FALSE');
      Hatari_ini.WriteInteger('Sound','nPlaybackFreq',StrToInt(Conf.sComboBox54.Text));
      if Conf.sComboBox39.ItemIndex = 0 then
        Hatari_ini.WriteInteger('Sound','YmVolumeMixing',3)
      else if Conf.sComboBox39.ItemIndex = 1 then
        Hatari_ini.WriteInteger('Sound','YmVolumeMixing',2)
      else if Conf.sComboBox39.ItemIndex = 2 then
        Hatari_ini.WriteInteger('Sound','YmVolumeMixing',1);
      Hatari_ini.WriteString('Sound','szYMCaptureFileName',Conf.sLabel78.Caption);
    end;
end;

//////////////////////////////////////////////////////////////////////////////
procedure Show_hatari_screenpanel;
begin
  if (Cmenustate = 'em_computers_hatari_paths') then
    em_hatari_paths_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_roms') then
    em_hatari_roms_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_system') then
    em_hatari_system_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_joy') then
    em_hatari_joy_FreeDynamicComps
  else if (Cmenustate = 'em_computers_hatari_database') then
    em_hatari_database_FreeDynamicComps;
  CurrentStateSave;
  ShowPathInCaption(CDirPath,Conf.sBitBtn9.Caption,False,True);
  Cmenustate := 'em_computers_hatari_screen';
  em_hatari_screen_ShowDynamicComps;
  ShowButtonDown(9,'EM_COMPUTERS_ATARI_HATARI_SCREEN');
  Conf.Pem_hatari_joy.Tag := 0;
  ShowHidePanel(CurrentPanel,'Pem_hatari_screen');
end;

procedure em_hatari_screen_ShowDynamicComps;
var
  i: Integer;
begin
  for i := 1 to 3 do
    begin
      case i of
        1 : Image_Comp(Conf.Pem_hatari_screen,'media\confeditor\images\hatari\hatari.png',
              3,586,106,70,i,True);
        2 : Image_Comp(Conf.Pem_hatari_screen,'media\confeditor\images\hatari\hatari_image.png',
              559,565,169,97,i,True);
        3 : Image_Comp(Conf.Pem_hatari_screen,'media\confeditor\images\hatari\sound.png',
              507,2,227,71,i,True);
      end;
    end;
end;

procedure em_hatari_screen_FreeDynamicComps;
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

